# Neovim Config

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) and following [LazyVim](https://www.lazyvim.org/) patterns.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/              # Core configuration
│   │   ├── options.lua      # Vim options
│   │   ├── keymaps.lua      # Global keybindings
│   │   ├── autocmds.lua     # Autocommands & LSP keymaps
│   │   ├── lazy.lua         # Plugin manager bootstrap
│   │   ├── lsp.lua          # LSP server configuration
│   │   └── theme.lua        # Colorscheme
│   └── plugins/
│       ├── ai/              # AI assistants
│       │   ├── claudecode   # Claude Code integration
│       │   ├── copilot      # GitHub Copilot
│       │   ├── codeium      # Codeium
│       │   └── ...
│       ├── editor/          # Editor enhancements
│       │   ├── treesitter   # Syntax highlighting
│       │   ├── flash        # Navigation
│       │   ├── harpoon      # File marks
│       │   └── ...
│       ├── lang/            # Language-specific
│       │   ├── markdown
│       │   └── vimwiki
│       ├── lsp/             # LSP & completion
│       │   ├── mason        # LSP installer
│       │   ├── completion   # blink.cmp
│       │   ├── format       # conform.nvim
│       │   ├── lint         # nvim-lint
│       │   └── trouble      # Diagnostics
│       ├── tools/           # Utilities
│       │   ├── snacks       # Picker, explorer, terminal
│       │   ├── git          # Fugitive & gitsigns
│       │   └── ...
│       └── ui/              # Interface
│           ├── dashboard    # Alpha startup screen
│           ├── themes       # Tokyonight
│           ├── statusline   # Lualine
│           └── ...
├── snippets/                # UltiSnips snippets
└── spell/                   # Spell files
```

## Key Bindings

Leader: `<Space>`

| Key | Action |
|-----|--------|
| `<leader>f` | File explorer |
| `<leader>sf` | Find files |
| `<leader>sg` | Grep |
| `<leader>gg` | Lazygit |
| `<leader>fb` | Format buffer |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover docs |

## LSP Servers

Configured via Mason: `basedpyright`, `ruff`, `lua_ls`, `gopls`, `rust_analyzer`, `zls`

## Requirements

- Neovim 0.10+
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- ripgrep, fd (for telescope/snacks)
