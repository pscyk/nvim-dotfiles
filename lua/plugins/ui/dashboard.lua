return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
  },
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local ascii = require 'ascii'

    -- Quotes collection
    local quotes = {
      -- Wisdom
      'Yesterday is history, tomorrow is a mystery, but today is a gift.',
      'There are no accidents.',
      'One often meets his destiny on the road he takes to avoid it.',
      'Your mind is like water. When agitated, it becomes difficult to see.',
      'Anything is possible when you have inner peace.',
      -- Programming
      'Talk is cheap. Show me the code. — Linus Torvalds',
      'First, solve the problem. Then, write the code.',
      'Simplicity is the ultimate sophistication. — Leonardo da Vinci',
      'The best error message is the one that never shows up.',
      "Code is like humor. When you have to explain it, it's bad.",
      'Make it work, make it right, make it fast.',
      'Programs must be written for people to read. — Abelson & Sussman',
      'The only way to go fast is to go well. — Robert C. Martin',
      'Deleted code is debugged code.',
      'There are only two hard things: cache invalidation and naming things.',
      'Perfection is achieved when there is nothing left to take away.',
      'The best code is no code at all.',
      -- Life/Stoic
      'Stay hungry. Stay foolish. — Steve Jobs',
      'Done is better than perfect.',
      'The impediment to action advances action. — Marcus Aurelius',
      'We are what we repeatedly do. Excellence is a habit. — Aristotle',
      'He who has a why can bear any how. — Nietzsche',
      'The obstacle is the way. — Marcus Aurelius',
      'Memento mori.',
      'This too shall pass.',
      'Be water, my friend. — Bruce Lee',
      'The journey of a thousand miles begins with a single step. — Lao Tzu',
      'What we do in life echoes in eternity. — Gladiator',
      'Fortune favors the bold. — Virgil',
    }

    math.randomseed(os.time())

    local header = {
      type = 'text',
      val = ascii.get_random_global(),
      opts = { position = 'center', hl = 'AlphaHeader' },
    }

    local quote = {
      type = 'text',
      val = quotes[math.random(#quotes)],
      opts = { position = 'center', hl = 'AlphaQuote' },
    }

    local config = {
      layout = {
        { type = 'padding', val = 2 },
        header,
        { type = 'padding', val = 2 },
        quote,
      },
      opts = { margin = 5 },
    }

    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#51afef' })
    vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#ECBE7B', italic = true })

    alpha.setup(config)
  end,
}
