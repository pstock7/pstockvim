return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Pretty sure Nerd Fonts supports legacy computing symbols (default: false)
    legacy_computing_symbols_support = true,
    -- Reduce speed of head of smear (default: 0.6)
    stiffness = 0.4,
    -- Reduce speed of tail of smear (default: 0.4)
    trailing_stiffness = 0.2,
    -- Increase the stop animating distance to prevent weird animations when using hjkl (default: 0.1)
    distance_stop_animating = 0.5,
    -- Don't reduce the thickness of the trail as much (default: 0.3)
    volume_reduction_exponent = 0.1,
  },
}
