return {
  -- Add autopep8 to conform.nvim which handles formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "autopep8" },
      },
      formatters = {
        autopep8 = {
          prepend_args = { "--max-line-length", "120" },
        },
      },
    },
  },
}
