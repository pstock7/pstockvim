return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Add my own logo :)
      dashboard = {
        preset = {
          header = [[
                                                                   
      ████ ██████           █████  █  ██                    
     ███████████             █████ ██                         
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]],
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          git_diff = {
            win = {
              input = {
                keys = {
                  ["<CR>"] = { "git_diff_submodule", mode = { "i", "n" } },
                },
              },
            },
            actions = {
              git_diff_submodule = function(picker, item, action)
                -- If submodule do this
                if vim.fn.isdirectory(item._path) ~= 0 then
                  Snacks.picker.actions.close(picker)
                  vim.schedule(function()
                    Snacks.picker.git_diff({ cwd = item._path })
                  end)
                else
                  Snacks.picker.actions.confirm(picker, item, action)
                end
              end,
            },
          },
          git_status = {
            win = {
              input = {
                keys = {
                  ["<CR>"] = { "git_status_submodule", mode = { "i", "n" } },
                },
              },
            },
            actions = {
              git_status_submodule = function(picker, item, action)
                -- If submodule do this
                if vim.fn.isdirectory(item._path) ~= 0 then
                  Snacks.picker.actions.close(picker)
                  vim.schedule(function()
                    Snacks.picker.git_status({ cwd = item._path })
                  end)
                else
                  Snacks.picker.actions.confirm(picker, item, action)
                end
              end,
            },
          },
        },
      },
      zen = {
        win = {
          backdrop = {
            transparent = false,
          },
        },
      },
    },
  },
}
