return {
  -- Add tools for mason to install
  {
    "williamboman/mason.nvim",
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
