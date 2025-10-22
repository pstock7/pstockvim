return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  opts = {
    enabled = function()
      return not vim.tbl_contains({ "tex" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    -- Disable ghost text because it doesn't work well with windsurf completions
    completion = {
      ghost_text = {
        enabled = vim.uv.os_gethostname() ~= "6ZZG533",
      },
    },
  },
}
