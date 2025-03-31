-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set any file that starts with Dockerfile to the correct filetype
-- This allows for the following:
--   1. LSP will correctly attach to buffer when file is opened
--   2. Syntax highlighting will be shown
--   3. mini.icons will show the dockerfile filetype icon for these files
--   ...and possibly more which I haven't noticed and hopefully won't have to
vim.filetype.add({ pattern = { ["Dockerfile.*"] = "dockerfile" } })
