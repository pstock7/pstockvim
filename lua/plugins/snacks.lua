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
      -- Change notification timeout from 3 seconds to 5 seconds
      notifier = {
        timeout = 5000,
      },
    },
  },
}
