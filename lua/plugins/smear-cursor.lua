return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Pretty sure Nerd Fonts supports legacy computing symbols (default: false)
    legacy_computing_symbols_support = true,
    -- Reduce speed of head of smear (default: 0.6)
    stiffness = 0.4,
    -- Reduce speed of tail of smear (default: 0.4)
    trailing_stiffness = 0.2,
    -- Increase the stop animating distance to prevent weird animating
    -- when smearing over short distances (default: 0.1)
    distance_stop_animating = 0.5,
    -- Increase the minimum distance required for smear (default: 0)
    min_horizontal_distance_smear = 1.1,
    min_vertical_distance_smear = 1.1,
    -- Don't reduce the thickness of the trail as much (default: 0.3)
    volume_reduction_exponent = 0.2,
    -- Seems to help me not lose track visually of the character being jumped to (default: false)
    never_draw_over_target = true,
    -- Do not anticipate movements by adding extra smear outside
    -- of the line between points a and b (default: 0.55)
    anticipation = 0,
  },
}
