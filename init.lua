vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  checker = { enabled = true },
}

require('core.keymaps')
require('core.autocmds')
require('config.lsp')
require('config.theme')
require('core.options')
