return {
  -- Add tools for mason to install
  {
    "mason-org/mason.nvim",
    enabled = not vim.g.is_nixos,
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "autopep8",
      },
    },
  },
}
