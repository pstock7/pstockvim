if vim.uv.os_gethostname() == "6ZZG533" then
  vim.g.codeium_server_config =
    { portal_url = "https://windsurf.fedstart.com", api_url = "https://windsurf.fedstart.com/_route/api_server" }
  return {
    "Exafunction/windsurf.vim",
    event = "BufEnter",
    config = function()
      -- Fix accept to be a different key since <Tab> doesn't work
      vim.keymap.set("i", "<C-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  }
else
  return {}
end
