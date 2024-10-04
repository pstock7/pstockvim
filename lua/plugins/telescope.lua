return {
  -- Add telescope keymaps and change some options
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- Add keymaps to find hidden files
      {
        "<leader>fh",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Hidden Files (Root Dir)",
      },
      {
        "<leader>fH",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true, cwd = "" })
        end,
        desc = "Find Hidden Files (cwd)",
      },
    },
    -- Change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "-uu", -- Show hidden files and .gitignore files in grep
        },
      },
    },
  },
}
