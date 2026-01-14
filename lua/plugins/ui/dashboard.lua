return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { '0x5a4/oogway.nvim' },
  },
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local oogway = require 'oogway'

    local header = {
      type = 'text',
      val = vim.split(oogway.inspire_me(), '\n'),
      opts = { position = 'center', hl = 'AlphaHeader' },
    }

    local quote = {
      type = 'text',
      val = oogway.what_is_your_wisdom(),
      opts = { position = 'center', hl = 'AlphaQuote' },
    }

    local footer = {
      type = 'text',
      val = '',
      opts = { position = 'center', hl = 'AlphaFooter' },
    }

    local config = {
      layout = {
        { type = 'padding', val = 4 },
        header,
        { type = 'padding', val = 2 },
        quote,
        { type = 'padding', val = 2 },
        footer,
      },
      opts = { margin = 5 },
    }

    -- Peaceful green/gold theme
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#98be65' })
    vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#ECBE7B', italic = true })
    vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#5b6268' })

    alpha.setup(config)

    -- Update footer after lazy loads
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        footer.val = '⚡ ' .. stats.loaded .. '/' .. stats.count .. ' plugins'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
