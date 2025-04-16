return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
      cmd = {
        adapter = "ollama",
      },
    },
    adapters = {
      -- We could make this a new adapter, but changing ollama makes changing models pretty simple
      -- TODO: Consider implementing the following for a multi-computer config:
      -- https://github.com/olimorris/codecompanion.nvim/discussions/865
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "deepseek-r1:7b",
            },
          },
        })
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
