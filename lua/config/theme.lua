-- Active colorscheme: carbonfox, fully transparent (including the number
-- column and the sign/git column). Applied via a ColorScheme autocmd so it
-- survives `:colorscheme` switches.

local function transparent()
  vim.cmd [[
    hi Normal guibg=NONE
    hi NormalNC guibg=NONE
    hi NormalFloat guibg=NONE
    hi EndOfBuffer guibg=NONE
    hi Comment guibg=NONE
    hi TreesitterContext guibg=NONE
    hi LineNr guifg=#808080 guibg=NONE
    hi LineNrAbove guifg=#808080 guibg=NONE
    hi LineNrBelow guifg=#808080 guibg=NONE
    hi CursorLineNr guifg=#c0caf5 guibg=NONE
    hi SignColumn guibg=NONE
    hi GitSignsAdd guibg=NONE
    hi GitSignsChange guibg=NONE
    hi GitSignsDelete guibg=NONE
  ]]
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('user_theme_tweaks', { clear = true }),
  callback = transparent,
})

vim.opt.background = 'dark'
vim.cmd.colorscheme 'carbonfox'
