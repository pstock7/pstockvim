return {
  -- Add flake8 to nvim-lint which handles linters
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "flake8" },
      },
      linters = {
        flake8 = {
          args = { "--extend-ignore", "E501" },
        },
      },
    },
  },
}
