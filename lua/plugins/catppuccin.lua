---@module 'lazy'
---@type LazySpec
return {
  'catppuccin/nvim',
  name = 'catppuccin-nvim',
  priority = 1000,

  config = function()
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
    })

    vim.cmd.colorscheme('catppuccin')
  end,
}
