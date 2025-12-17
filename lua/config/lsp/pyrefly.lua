return {
  cmd = { 'pyrefly', 'lsp' },
  filetypes = { 'python' },
  rootPatterns = { "pyrefly.toml", "pyproject.toml", ".git" },
  settings = {},
  on_exit = function(code, _, _)
    vim.notify('Closing Pyrefly LSP exited with code: ' .. code, vim.log.levels.INFO)
  end,
}
