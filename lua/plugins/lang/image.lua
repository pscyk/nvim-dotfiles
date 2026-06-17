-- Inline image rendering via the kitty graphics protocol.
-- Pairs with render-markdown.nvim: render-markdown styles text, image.nvim
-- draws the actual `![alt](path)` images. We use the `magick_cli` processor so
-- no luarocks `magick` rock has to be built (system ImageMagick `magick` is enough).
return {
  '3rd/image.nvim',
  build = false,
  ft = { 'markdown' },
  opts = {
    backend = 'kitty',
    processor = 'magick_cli',
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { 'markdown' },
      },
    },
    -- size/behaviour
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true, -- hide images behind floats/popups
    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif' },
    editor_only_render_when_focused = false,
    tmux_show_only_in_active_window = true,
  },
}
