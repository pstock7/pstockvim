return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "tex", "markdown" }, vim.bo.filetype)
    end,
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "normal",
    },
  },
}
