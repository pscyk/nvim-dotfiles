return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'tokyonight',
      component_separators = { left = '░', right = '░' },
      section_separators = { left = '▓▒░', right = '░▒▓' },
    },
    sections = {
      lualine_b = {
        'branch',
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
        },
      },
      lualine_x = {
        { 'encoding', padding = { left = 1, right = 1 }, separator = { left = '░▒▓' } },
        { 'fileformat' },
        { 'filetype' },
      },
      lualine_y = { 'searchcount', 'progress' },
    },
  },
}
