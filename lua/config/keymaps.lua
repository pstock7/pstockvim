-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Since H and L are for switching buffers, define new keymaps for their original vim functionality
map({ "n", "x" }, "<localleader>h", "H", { noremap = true, desc = "Top line of window" })
map({ "n", "x" }, "<localleader>l", "L", { noremap = true, desc = "Bottom line of window" })

-- Add a keymap to toggle diffview
vim.keymap.set("n", "<leader>vd", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
vim.keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory<cr>", { desc = "Open file history" })

-- Add keymaps for CodeCompanion
vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "Open CodeCompanion actions" })
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion chat" })

-- Set luasnip to intercept <Tab> and <S-Tab>
-- This is apparently the officially endorsed method
vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])
