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

    -- Mix of quotes
    local other_quotes = {
      'Talk is cheap. Show me the code. — Linus Torvalds',
      'First, solve the problem. Then, write the code.',
      'Simplicity is the ultimate sophistication. — Leonardo da Vinci',
      'The best error message is the one that never shows up.',
      "Code is like humor. When you have to explain it, it's bad.",
      'Make it work, make it right, make it fast.',
      'Programs must be written for people to read. — Abelson & Sussman',
      'Any fool can write code that a computer can understand.',
      'The only way to go fast is to go well. — Robert C. Martin',
      'Deleted code is debugged code.',
      'It works on my machine.',
      'There are only two hard things: cache invalidation and naming things.',
      'Stay hungry. Stay foolish. — Steve Jobs',
      'Done is better than perfect.',
      'Weeks of coding can save hours of planning.',
    }

    math.randomseed(os.time())

    -- 50% chance oogway quote, 50% other
    local quote_text
    if math.random() > 0.5 then
      quote_text = oogway.what_is_your_wisdom()
    else
      quote_text = other_quotes[math.random(#other_quotes)]
    end

    local header = {
      type = 'text',
      val = vim.split(oogway.inspire_me(), '\n'),
      opts = { position = 'center', hl = 'AlphaHeader' },
    }

    local quote = {
      type = 'text',
      val = quote_text,
      opts = { position = 'center', hl = 'AlphaQuote' },
    }

    local config = {
      layout = {
        { type = 'padding', val = 4 },
        header,
        { type = 'padding', val = 2 },
        quote,
      },
      opts = { margin = 5 },
    }

    -- Peaceful green/gold theme
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#98be65' })
    vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#ECBE7B', italic = true })

    alpha.setup(config)
  end,
}
