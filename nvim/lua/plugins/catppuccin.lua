---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'catppuccin-nvim',
  lazy = false,
  priority = 1000,
  after = function()
    require('catppuccin').setup({
      flavour = 'macchiato',

      float = {
        transparent = false,
        solid = true,
      },

      dim_inactive = {
        enabled = true,
      },

      auto_integrations = true,
      integrations = {
        nvimtree = true,
        blink_cmp = true,
        snacks = true,
      },

      custom_highlights = function(colors)
        return {
          CursorInsert = { bg = colors.green, fg = colors.green },
          CursorVisual = { bg = colors.blue, fg = colors.blue },
        }
      end,
    })

    vim.cmd.colorscheme('catppuccin')
  end,
}
