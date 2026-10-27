-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.filetype.add({
  -- Register *.gotmpl files as gotmpl filetype
  -- Uses ngynkvn/gotmpl.nvim for syntax highlighting
  extension = { gotmpl = "gotmpl" },
  -- Set any file that starts with Dockerfile to the correct filetype
  -- This allows for the following:
  --   1. LSP will correctly attach to buffer when file is opened
  --   2. Syntax highlighting will be shown
  --   3. mini.icons will show the dockerfile filetype icon for these files
  --   ...and possibly more which I haven't noticed and hopefully won't have to
  pattern = { ["Dockerfile.*"] = "dockerfile" },
})

-- Make bash the default shell
-- This helps if the default shell for a given system is not bash
vim.opt.shell = "bash"

-- Do not attempt to restore view when moving through jumplist, changelist, alternate-file, or marks
vim.opt.jumpoptions:remove("view")

-- Set the default textwidth to be 120 characters which affects a few things (see `:h textwidth` and friends)
vim.opt.textwidth = 120

-- Check if we are in NixOS to change various things in our configuration
-- WARN: This will likely fail in Windows
local fd_os_release = assert(io.open("/etc/os-release"), "r")
local s_os_release = fd_os_release:read("*a")
fd_os_release:close()
s_os_release = s_os_release:lower()
local is_nixos = s_os_release:match("nixos")
-- Set a global variable we can use throughout our neovim configuration
vim.g.is_nixos = is_nixos ~= nil
