return {
  'lobkovilya/gh-browse.nvim',
  keys = {
    { '<Leader>gh', ':lua require("gh-browse").gh_browse()<CR>', mode = 'v', silent = false, noremap = true },
  },
}
