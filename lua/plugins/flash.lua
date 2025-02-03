return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          char_actions = function()
            -- Disable f, t, F, T continuing like ; and ,
            -- Reject change, return to vim :)
            return { [";"] = "next", [","] = "prev" }
          end,
          -- We don't disable anything else though because wrapping search and
          -- highlighting are amazing
        },
      },
    },
  },
}
