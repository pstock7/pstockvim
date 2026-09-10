return {
  {
    "folke/snacks.nvim",
    config = function(_, opts)
      require("snacks").setup(opts)

      local function get_scrolloff()
        return vim.api.nvim_get_option_value("scrolloff", {
          scope = "global",
        })
      end

      local function set_scrolloff(value)
        -- Set the global value used by new windows.
        vim.api.nvim_set_option_value("scrolloff", value, {
          scope = "global",
        })

        -- scrolloff is global-local, so update existing windows too.
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_set_option_value("scrolloff", value, {
              scope = "local",
              win = win,
            })
          end
        end
      end

      Snacks.toggle({
        id = "scrolloff_999",
        name = "set scrolloff=999",

        get = function()
          return get_scrolloff() == 999
        end,

        set = function(state)
          set_scrolloff(state and 999 or 4)
        end,
      }):map("<leader>uo")
    end,
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
