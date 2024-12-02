return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Using h and l appears to delete the character we were on unless we set this to false
    -- We only really care about seeing the smear for big jumps anyways
    smear_between_neighbor_lines = false,
    -- Pretty sure Nerd Fonts supports legacy computing symbols
    legacy_computing_symbols_support = true,
  },
}
