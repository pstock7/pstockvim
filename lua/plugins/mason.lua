return {
  -- Add tools for mason to install
  {
    "mason-org/mason.nvim",
    -- TODO: Change this to only disable Mason on NixOS
    enabled = true,
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
