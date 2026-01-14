return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
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
}
