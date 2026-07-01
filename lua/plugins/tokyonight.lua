return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.git = {
        add = colors.teal,
        change = colors.yellow,
        delete = colors.red1,
      }
    end,
  },
}
