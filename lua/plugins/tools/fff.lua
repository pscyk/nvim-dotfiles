return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- downloads a prebuilt binary, falls back to building with cargo
    require('fff.download').download_or_build_binary()
  end,
  opts = {},
  -- <leader>fF so it sits alongside snacks pickers (<leader>ff / <leader>sf)
  -- without clobbering them. fff is the fast Rust-based frecency picker.
  keys = {
    {
      '<leader>fF',
      function()
        require('fff').find_files()
      end,
      desc = 'FFF Find Files (fast)',
    },
  },
}
