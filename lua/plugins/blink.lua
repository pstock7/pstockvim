return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "tex", "markdown" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "normal",
    },
    snippets = {
      preset = "luasnip",
    },
  },
}
