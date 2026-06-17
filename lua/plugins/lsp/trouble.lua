return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  -- <leader>o toggles a live symbol outline (functions/classes) on the right
  -- and jumps focus into it, so you can navigate symbols immediately.
  keys = {
    {
      '<leader>o',
      '<cmd>Trouble symbols toggle focus=true win.position=right<cr>',
      desc = 'Symbols outline (Trouble)',
    },
  },
}
