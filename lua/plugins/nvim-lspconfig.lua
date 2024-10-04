return {
  -- Add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },
}
