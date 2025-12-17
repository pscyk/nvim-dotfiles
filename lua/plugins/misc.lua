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

  { 'j-hui/fidget.nvim',       opts = {} },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = false,
        ['<C-J>'] = { 'select_and_accept', 'fallback' },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = { documentation = { auto_show = true }, list = { selection = { preselect = false, auto_insert = true } } },
      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
  -- {
  --   'saghen/blink.pairs',
  --   version = '*', -- (recommended) only required with prebuilt binaries
  --
  --   -- download prebuilt binaries from github releases
  --   dependencies = 'saghen/blink.download',
  --   -- OR build from source, requires nightly:
  --   -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  --   -- build = 'cargo build --release',
  --   -- If you use nix, you can build from source using latest nightly rust with:
  --   -- build = 'nix run .#build-plugin',
  --
  --   --- @module 'blink.pairs'
  --   --- @type blink.pairs.Config
  --   opts = {
  --     mappings = {
  --       -- you can call require("blink.pairs.mappings").enable()
  --       -- and require("blink.pairs.mappings").disable()
  --       -- to enable/disable mappings at runtime
  --       enabled = true,
  --       cmdline = true,
  --       -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
  --       -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
  --       disabled_filetypes = {},
  --       -- see the defaults:
  --       -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
  --       pairs = {},
  --     },
  --     highlights = {
  --       enabled = true,
  --       -- requires require('vim._extui').enable({}), otherwise has no effect
  --       cmdline = true,
  --       groups = {
  --         'BlinkPairsOrange',
  --         'BlinkPairsPurple',
  --         'BlinkPairsBlue',
  --       },
  --       unmatched_group = 'BlinkPairsUnmatched',
  --
  --       -- highlights matching pairs under the cursor
  --       matchparen = {
  --         enabled = true,
  --         -- known issue where typing won't update matchparen highlight, disabled by default
  --         cmdline = false,
  --         -- also include pairs not on top of the cursor, but surrounding the cursor
  --         include_surrounding = false,
  --         group = 'BlinkPairsMatchParen',
  --         priority = 250,
  --       },
  --     },
  --     debug = false,
  --   }
  -- },
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
  { 'folke/which-key.nvim',  opts = {} },
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
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   opts = {
  --     exclude = { filetypes = { 'terminal', 'dashboard' } },
  --     scope = {
  --       show_start = true,
  --       show_end = false,
  --     },
  --     -- show_end_of_line = true,
  --     -- show_current_context_start = true,
  --     -- show_current_context = true,
  --     -- show_trailing_blankline_indent = false,
  --   },
  -- },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'romgrk/barbar.nvim',    dependencies = 'nvim-tree/nvim-web-devicons' },
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
