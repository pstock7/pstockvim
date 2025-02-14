return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/luasnippets" } })
    require("luasnip").config.set_config({
      enable_autosnippets = true,
    })
  end,
}
