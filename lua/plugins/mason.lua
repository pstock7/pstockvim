return {
  -- Add tools for mason to install
  {
    "williamboman/mason.nvim",
    version = "1.*",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "autopep8",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.*",
  },
}
