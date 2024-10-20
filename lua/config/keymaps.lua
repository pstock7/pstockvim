-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>rs", "<cmd>RemoteStart<cr>", { desc = "Start Remote Session" })
map("n", "<leader>rS", "<cmd>RemoteStop<cr>", { desc = "Stop Remote Session" })
map("n", "<leader>ri", "<cmd>RemoteInfo<cr>", { desc = "Remote Session Info" })
map("n", "<leader>rl", "<cmd>RemoteLog<cr>", { desc = "Remote Log" })
