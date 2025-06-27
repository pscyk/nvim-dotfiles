vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
require('lazy').setup {
  spec = {
     { import = 'plugins' },
  },
  checker = { enabled = true },
}

 require('core.options')
 require('core.keymaps')
 require('core.autocmds')

vim.lsp.enable 'basedpyright'
vim.lsp.enable 'ruff'
vim.lsp.config('ruff')
vim.lsp.enable 'pyrefly'
