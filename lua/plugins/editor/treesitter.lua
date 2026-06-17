return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main', -- `master` is frozen and does not support Neovim 0.12
  lazy = false, -- load on startup so highlighting attaches to the first buffer
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  },
  config = function()
    -- [[ Configure Treesitter ]]
    -- The `main` branch is a thin wrapper: it installs parsers/queries, and the
    -- actual features (highlight, indent, fold) are provided by Neovim itself.
    -- See `:help nvim-treesitter` and `:help treesitter`.
    local TS = require 'nvim-treesitter'

    TS.setup {
      -- Parsers and queries are installed here (prepended to runtimepath).
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }

    local ensure_installed = {
      'c',
      'cpp',
      'go',
      'lua',
      'python',
      'rust',
      'tsx',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      -- required by render-markdown.nvim
      'markdown',
      'markdown_inline',
    }
    TS.install(ensure_installed)

    local function is_installed(lang)
      return vim.tbl_contains(TS.get_installed 'parsers', lang)
    end

    -- Enable treesitter highlighting + indentation per buffer, auto-installing
    -- missing parsers on the fly (replaces the old `auto_install = true`).
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('user_treesitter', { clear = true }),
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang or not vim.tbl_contains(TS.get_available(), lang) then
          return
        end

        local function enable()
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end
          pcall(vim.treesitter.start, buf)
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        if is_installed(lang) then
          enable()
        else
          pcall(function()
            TS.install({ lang }):await(vim.schedule_wrap(enable))
          end)
        end
      end,
    })

    -- [[ Text objects ]] -- nvim-treesitter-textobjects `main` API
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true, -- jump forward to textobj, like targets.vim
      },
      move = {
        set_jumps = true, -- record moves in the jumplist
      },
    }

    local select = require 'nvim-treesitter-textobjects.select'
    local move = require 'nvim-treesitter-textobjects.move'

    -- select
    for lhs, capture in pairs {
      ['aa'] = '@parameter.outer',
      ['ia'] = '@parameter.inner',
      ['af'] = '@function.outer',
      ['if'] = '@function.inner',
      ['ac'] = '@class.outer',
      ['ic'] = '@class.inner',
    } do
      vim.keymap.set({ 'x', 'o' }, lhs, function()
        select.select_textobject(capture, 'textobjects')
      end, { desc = 'TS select ' .. capture })
    end

    -- move
    local function map_move(fn, maps)
      for lhs, capture in pairs(maps) do
        vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
          fn(capture, 'textobjects')
        end, { desc = 'TS move ' .. capture })
      end
    end
    map_move(move.goto_next_start, { [']f'] = '@function.outer', [']m'] = '@function.outer', [']c'] = '@class.outer' })
    map_move(move.goto_next_end, { [']F'] = '@function.outer', [']M'] = '@function.outer', [']C'] = '@class.outer' })
    map_move(move.goto_previous_start, { ['[f'] = '@function.outer', ['[m'] = '@function.outer', ['[c'] = '@class.outer' })
    map_move(move.goto_previous_end, { ['[F'] = '@function.outer', ['[M'] = '@function.outer', ['[C'] = '@class.outer' })

    -- [[ Incremental selection ]]
    -- The `main` branch dropped the built-in module, so this is a minimal
    -- reimplementation of the old <c-space> / <M-space> workflow.
    do
      local nodes = {}

      local function visually_select(node)
        local srow, scol, erow, ecol = node:range()
        if ecol == 0 and erow > srow then
          erow = erow - 1
          ecol = #(vim.api.nvim_buf_get_lines(0, erow, erow + 1, true)[1] or '')
        end
        vim.fn.setpos("'<", { 0, srow + 1, scol + 1, 0 })
        vim.fn.setpos("'>", { 0, erow + 1, math.max(ecol, 1), 0 })
        vim.cmd 'normal! gv'
      end

      local function init_selection()
        local node = vim.treesitter.get_node()
        if not node then
          return
        end
        nodes = { node }
        visually_select(node)
      end

      local function node_incremental()
        local node = nodes[#nodes]
        if not node then
          return init_selection()
        end
        local srow, scol, erow, ecol = node:range()
        local parent = node:parent()
        while parent do
          local psr, psc, per, pec = parent:range()
          if psr ~= srow or psc ~= scol or per ~= erow or pec ~= ecol then
            break
          end
          parent = parent:parent()
        end
        if parent then
          table.insert(nodes, parent)
          visually_select(parent)
        else
          visually_select(node)
        end
      end

      local function node_decremental()
        if #nodes > 1 then
          table.remove(nodes)
        end
        if nodes[#nodes] then
          visually_select(nodes[#nodes])
        end
      end

      vim.keymap.set('n', '<c-space>', init_selection, { desc = 'TS init selection' })
      vim.keymap.set('x', '<c-space>', node_incremental, { desc = 'TS increment node' })
      vim.keymap.set('x', '<M-space>', node_decremental, { desc = 'TS decrement node' })
    end
  end,
}
