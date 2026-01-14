vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.lazy')
require('lazy').setup {
  spec = {
    { import = 'plugins.ui' },
    { import = 'plugins.editor' },
    { import = 'plugins.lsp' },
    { import = 'plugins.ai' },
    { import = 'plugins.tools' },
    { import = 'plugins.lang' },
  },
  checker = { enabled = true },
}

require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lsp')
require('config.theme')
