vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff')
vim.lsp.config('ruff', {})

vim.lsp.enable('pyrefly')
vim.lsp.config('pyrefly', require('config.lsp.pyrefly'))