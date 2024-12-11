return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Pretty sure Nerd Fonts supports legacy computing symbols
    legacy_computing_symbols_support = true,
    -- Less slowdown of the tail as it reaches the head (default: 2)
    trailing_exponent = 0.5,
    -- Increase the stop animating distance to prevent weird animations when using hjkl (default: 0.1)
    distance_stop_animating = 0.5,
    -- The more pixels the better :) (default: 0.7)
    matrix_pixel_threshold = 0.1,
    -- Don't reduce the thickness of the trail (default: 0.3)
    volume_reduction_exponent = 0,
  },
}
