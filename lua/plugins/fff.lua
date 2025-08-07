return {
  "dmtrKovalenko/fff.nvim",
  build = "cargo build --release",
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    -- pass here all the options
    width = 0.97,          -- Window width as fraction of screen
    height = 0.97,         -- Window height as fraction of screen
    prompt = '> ',       -- Input prompt symbol
    preview = {
        enabled = true,
        width = 0.8,
        max_lines = 100,
        max_size = 1024 * 1024, -- 1MB
    },
  title = 'FFF Files',  -- Window title
  max_results = 10,     -- Maximum search results to display
  max_threads = 16,      -- Maximum threads for fuzzy search
  },
  keys = {
    {
      "<leader>sf", -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files() -- or find_in_git_root() if you only want git files
      end,
      desc = "[S]earch [F]iles",
    },
  },
}
