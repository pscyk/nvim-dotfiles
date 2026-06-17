-- Alabaster: Tonsky's minimal "semantic-friendly" theme.
-- Only strings/numbers, comments and top-level definitions get color; keywords,
-- punctuation and variable/function *usages* stay neutral. The single scheme
-- `alabaster` switches dark/light off `vim.o.background`.
-- Activated (and transparency applied) in lua/config/theme.lua.
return {
  'p00f/alabaster.nvim',
  lazy = false,
  priority = 1000,
}
