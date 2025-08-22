vim.lsp.enable('basedpyright')
vim.lsp.config('basedpyright', require('config.lsp.basedpyright'))
vim.lsp.enable('ruff')
vim.lsp.config('ruff', {})
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')

vim.lsp.enable('pyrefly')
vim.lsp.config('pyrefly', require('config.lsp.pyrefly'))
