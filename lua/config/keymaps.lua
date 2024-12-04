-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "x" }, "<localleader>h", "H", { noremap = true, desc = "Top line of window" })
map({ "n", "x" }, "<localleader>l", "L", { noremap = true, desc = "Bottom line of window" })
