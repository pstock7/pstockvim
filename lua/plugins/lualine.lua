return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    -- Keep the default values from LazyVim, but change the separators.
    -- If this ever causes an error when updating LazyVim, it is likely because the default config in LazyVim was updated
    -- LazyVim lualine config: https://www.lazyvim.org/plugins/ui#lualinenvim
    local separators = { left = "", right = "" }
    for _, section in ipairs({ "lualine_a", "lualine_z" }) do
      opts.sections[section] = {
        {
          opts.sections[section][1],
          separator = separators,
        },
      }
    end
  end,
}
