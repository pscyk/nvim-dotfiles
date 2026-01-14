return {
  'github/copilot.vim',
  config = function()
    -- Use <C-I> to accept suggestions while leaving <Tab> unmapped.
    vim.keymap.set('i', '<C-I>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
  end,
}
