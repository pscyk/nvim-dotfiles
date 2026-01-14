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

    -- Dotted ASCII art collection
    local arts = {
      -- Oogway from plugin
      vim.split(oogway.inspire_me(), '\n'),

      -- Ghost
      {
        [[                    .:-=+**##%%##**+=-:.                    ]],
        [[                .-+#%@@@@@@@@@@@@@@@@@@%#*=.                 ]],
        [[             .=*%@@@@@@@@@@@@@@@@@@@@@@@@@@%*-               ]],
        [[           .+%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#=             ]],
        [[          =#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#:           ]],
        [[        .+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+          ]],
        [[       .#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+         ]],
        [[       *@@@@@@@@@@@: .:@@@@@@@@@@@@:. :@@@@@@@@@@@@@:        ]],
        [[      -@@@@@@@@@@@.    =@@@@@@@@@@+    .@@@@@@@@@@@@@        ]],
        [[      #@@@@@@@@@@#  ()  %@@@@@@@@%  ()  *@@@@@@@@@@@@.       ]],
        [[      %@@@@@@@@@@%     .@@@@@@@@@@:     #@@@@@@@@@@@@-       ]],
        [[      #@@@@@@@@@@@*:.:*@@@@@@@@@@@@#:.:#@@@@@@@@@@@@@.       ]],
        [[      -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        ]],
        [[       *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#         ]],
        [[        +@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-         ]],
        [[         :%@@@@@@@@@@@@@@@@@@%##%@@@@@@@@@@@@@@@@%.          ]],
        [[           -%@@@@@@@@@@@@@@@-    =@@@@@@@@@@@@@%-            ]],
        [[             :*%@@@@@@@@@@@:      +@@@@@@@@@@#:              ]],
        [[                :=*#%%@@@%.        +@@@%#*=:                 ]],
      },

      -- Demon/Skull
      {
        [[             .::---:::.              ]],
        [[         .:=+*###%%%%##*+=:.         ]],
        [[       :=*%@@@@@@@@@@@@@@%#+-        ]],
        [[     .=*@@@@@@@@@@@@@@@@@@@@@*:      ]],
        [[    .+%@@@@@@@@@@@@@@@@@@@@@@@#:     ]],
        [[   .+@@@@@@@@@@@@@@@@@@@@@@@@@@#.    ]],
        [[   =%@@@@@@@@@@@@@@@@@@@@@@@@@@@=    ]],
        [[  .#@@@@@@%#*+=-::-=+*#%@@@@@@@@@:   ]],
        [[  :@@@@@*:    .-==-.    :*@@@@@@%-   ]],
        [[  -@@@@+   .=*%@@@@%*=.   +@@@@@%-   ]],
        [[  -@@@@:  .*@@@@@@@@@@*.  :@@@@@%-   ]],
        [[  :@@@@=   :*%@@@@@@%*:   =@@@@@%-   ]],
        [[  .#@@@@+:   .:=++=-:   :+@@@@@@#.   ]],
        [[   =%@@@@@#+=:.    .:=+#@@@@@@@%:    ]],
        [[   .+@@@@@@@@@%####%@@@@@@@@@@@+     ]],
        [[    .+%@@@@@@@@@@@@@@@@@@@@@@@+.     ]],
        [[      :*%@@@@@@@@@@@@@@@@@@@#:       ]],
        [[        :=*#%@@@@@@@@@@%#*=.         ]],
        [[            .::----::.               ]],
      },

      -- Cat
      {
        [[       .               .              ]],
        [[      ":"             ":"             ]],
        [[    ___:____     |"\/"|              ]],
        [[  ,'        `.    \  /               ]],
        [[  |  O        \___/  |               ]],
        [[~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~    ]],
      },

      -- Dragon
      {
        [[                 ______________                ]],
        [[           ,===:'.,            `-._            ]],
        [[                `:.`---.__         `-._        ]],
        [[                  `:.     `--.         `.      ]],
        [[                    \.        `.         `.    ]],
        [[            (,,(,    \.         `.   ____,-`., ]],
        [[         (,'     `/   \.   ,--.___`.'          ]],
        [[     ,  ,'  ,--.  `,   \.;'         `          ]],
        [[      `{D, {    \  :    \;                     ]],
        [[        V,,'    /  /    //                     ]],
        [[        j;;    /  ,' ,-//.    ,---.      ,     ]],
        [[        \;'   /  ,' /  _  \  /  _  \   ,'/     ]],
        [[              \   `'  / \  `'  / \  `.' /      ]],
        [[               `.___,'   `googway,'   `googway ]],
      },

      -- Vim
      {
        [[                                              ]],
        [[         :::    :::  :::::::::::  ::::    ::::  ]],
        [[        :+:    :+:      :+:      +:+:+: :+:+:+  ]],
        [[       +:+    +:+      +:+      +:+ +:+:+ +:+   ]],
        [[      +#+    +:+      +#+      +#+  +:+  +#+    ]],
        [[     +#+  +#+  +#+   +#+      +#+       +#+     ]],
        [[     #+#    #+#      #+#      #+#       #+#     ]],
        [[      ########   ########### ###       ###      ]],
        [[                                              ]],
      },
    }

    -- Quotes collection
    local quotes = {
      -- Oogway
      'Yesterday is history, tomorrow is a mystery, but today is a gift.',
      'There are no accidents.',
      'One often meets his destiny on the road he takes to avoid it.',
      'Your mind is like water. When agitated, it becomes difficult to see.',
      'If you only do what you can do, you will never be more than you are now.',
      'Anything is possible when you have inner peace.',
      -- Programming
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
      'Weeks of coding can save hours of planning.',
      'Perfection is achieved when there is nothing left to take away.',
      'The best code is no code at all.',
      'Copy and paste is a design error. — David Parnas',
      -- Life
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
    }

    math.randomseed(os.time())

    local header = {
      type = 'text',
      val = arts[math.random(#arts)],
      opts = { position = 'center', hl = 'AlphaHeader' },
    }

    local quote = {
      type = 'text',
      val = quotes[math.random(#quotes)],
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

    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#98be65' })
    vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#ECBE7B', italic = true })

    alpha.setup(config)
  end,
}
