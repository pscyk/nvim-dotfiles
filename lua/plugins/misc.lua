return {
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  { 'williamboman/mason.nvim', opts = {} },
    { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
      -- {
      --   "SmiteshP/nvim-navbuddy",
      --   dependencies = {
      --     "SmiteshP/nvim-navic",
      --     "MunifTanjim/nui.nvim"
      --   },
      --  opts = { lsp = { auto_attach = true } }
      -- },
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { 'j-hui/fidget.nvim', opts = {} },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'saghen/blink.pairs',
    version = '*',
    dependencies = 'saghen/blink.download',
    opts = {
      mappings = {
        enabled = true,
        pairs = {},
      },
      highlights = {
        enabled = true,
        groups = {
          'BlinkPairsOrange',
          'BlinkPairsPurple',
          'BlinkPairsBlue',
        },
        matchparen = {
          enabled = true,
          group = 'MatchParen',
        },
      },
      debug = false,
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },
      quickfile = { enabled = true },
    },
  },
  { 'folke/which-key.nvim', opts = {} },
  {
    'almo7aya/openingh.nvim',
    opts = {},
    keys = {
      { '<Leader>gr', ':OpenInGHRepo <CR>', mode = 'n', silent = true, noremap = true },
      { '<Leader>gf', ':OpenInGHFile <CR>', mode = 'n', silent = true, noremap = true },
      { '<Leader>gf', ':OpenInGHFileLines <CR>', mode = 'v', silent = true, noremap = true },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>ghp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']g', function()
          if vim.wo.diff then
            return ']g'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[g', function()
          if vim.wo.diff then
            return '[g'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- this is all you need
        theme = "tokyonight",

        -- everything below
        -- is extra style
        -- can't help myself :P
        component_separators = { left = "░", right = "░" },
        section_separators = { left = "▓▒░", right = "░▒▓" },
      },
      sections = {
        lualine_b = {
          "branch", {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            -- diagnostics_color = {
            --   error = { fg = "#151515" },
            --   warn =  { fg = "#151515" },
            --   info =  { fg = "#151515" },
            -- },
          },
        },
        lualine_x = {
          { "encoding", padding = { left = 1, right = 1 }, separator = { left = "░▒▓" } },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "searchcount", "progress" },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      exclude = { filetypes = { 'terminal', 'dashboard' } },
      scope = {
        show_start = true,
        show_end = false,
      },
      -- show_end_of_line = true,
      -- show_current_context_start = true,
      -- show_current_context = true,
      -- show_trailing_blankline_indent = false,
    },
  },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'romgrk/barbar.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  'sirver/ultisnips',
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    -- cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fb',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        yaml = { 'prettier' },
        python = { 'ruff_fix', 'ruff_format' },
      },

      notify_on_error = false,
    },
  },
  -- require 'kickstart.plugins.autoformat',
  -- { import = 'custom.plugins' },
}
