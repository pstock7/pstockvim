return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    -- Keep the default values from LazyVim, but change the separators.
    local separators = { left = "", right = "" }
    for _, section in ipairs({ "lualine_a", "lualine_z" }) do
      for _, component in ipairs(opts.sections[section]) do
        if type(component) == "string" or type(component) == "function" then
          opts.sections[section] = {
            {
              component,
              separator = separators,
            },
          }
        elseif type(component) == "table" then
          -- WARN: If this ever causes an error when updating LazyVim, it is
          -- likely because the default config in LazyVim was updated and this
          -- elseif has not been tested
          -- LazyVim lualine config: https://www.lazyvim.org/plugins/ui#lualinenvim
          component.separator = separators
        end
      end
    end
  end,
}
