-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set any file that starts with Dockerfile to the correct file type
-- This makes it so the LSP will attach to the buffer and syntax highlighting will be shown
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "Dockerfile*" },
  callback = function()
    vim.opt.filetype = "dockerfile"
  end,
})
