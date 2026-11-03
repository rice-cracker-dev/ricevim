---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'catppuccin-nvim',
  lazy = false,
  priority = 1000,
  after = function()
    require('catppuccin').setup({
      flavour = 'macchiato',
      transparent_background = true,

      float = {
        transparent = true,
        solid = false,
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
