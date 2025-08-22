return {
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    -- pass here all the options
    max_threads = 32,
    max_results = 10,
    prompt = '> ',
    title = '[S]earch [F]iles',
    layout = {
      height = 0.9,
      width = 0.9,
      prompt_position = 'top',    -- or 'top'
      preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
      preview_size = 0.75,
    },
  },
  keys = {
    {
      "<leader>sf",                 -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files() -- or find_in_git_root() if you only want git files
      end,
      desc = "[S]earch [F]iles",
    },
  },
}
