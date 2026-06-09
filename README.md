# Neovim Config

Personal Neovim configuration with [lazy.nvim](https://github.com/folke/lazy.nvim).

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
│       │   └── copilot      # GitHub Copilot (inline)
│       ├── editor/          # Editor enhancements
│       │   ├── treesitter   # Syntax highlighting
│       │   ├── flash        # Navigation
│       │   ├── harpoon      # File marks
│       │   └── ...
│       ├── lang/            # Language-specific
│       │   ├── render-markdown
│       │   └── img-clip
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
│           ├── themes       # Tokyonight
│           ├── statusline   # Lualine
│           ├── bufferline   # Barbar
│           ├── noice        # Cmdline/notifications UI
│           └── which-key
├── snippets/                # VSCode-format snippets (loaded by blink.cmp)
└── spell/                   # Spell files

The dashboard, picker, explorer, terminal, lazygit, and notifier are all
provided by [snacks.nvim](https://github.com/folke/snacks.nvim) (`tools/snacks.lua`).
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

Enabled via Neovim's native `vim.lsp.enable` (see `lua/config/lsp.lua`), with the
binaries provided by Mason: `basedpyright`, `ruff`, `ty`, `lua_ls`, `gopls`,
`rust_analyzer`, `zls`.

## Requirements

- Neovim 0.11+ (native `vim.lsp` config API)
- Git, [lazygit](https://github.com/jesseduffield/lazygit)
- A [Nerd Font](https://www.nerdfonts.com/)
- ripgrep, fd (for snacks pickers)
- node + npm (GitHub Copilot, basedpyright, prettier)
- rust + cargo (rust_analyzer, code_runner)
