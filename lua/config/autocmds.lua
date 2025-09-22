-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Make a custom group for my own autocmds
-- REVIEW: May want to split into multiple groups if there end up being a lot of autocmds in this file
local custom_group = vim.api.nvim_create_augroup("pstock_custom", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = custom_group,
  pattern = "python",
  callback = function()
    vim.opt_local.makeprg = "flake8 --ignore E501"
  end,
})
