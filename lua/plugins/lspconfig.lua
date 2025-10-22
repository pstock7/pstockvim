if vim.fn.executable("/apps/xm-root/xmopts/xmpy/unix/xmpy") then
  return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "/apps/xm-root/xmopts/xmpy/unix/xmpy",
            },
          },
        },
      },
    },
  }
else
  return {}
end
