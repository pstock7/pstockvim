return {
  -- Make which-key display representations of keys that actually make sense
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        keys = {
          C = "C-",
          M = "A-",
        },
      },
      spec = {
        {
          mode = "n",
          { "<leader>v", group = "diffview" },
          { "<leader>a", group = "ai" },
        },
      },
    },
  },
}
