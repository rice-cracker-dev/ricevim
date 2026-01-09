---@module 'lazy'
---@module 'avante'
---@type LazySpec
return {

  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,

  dependencies = {
    'nvim-mini/mini.nvim',
    'folke/snacks.nvim',
    'zbirenbaum/copilot.lua',
  },

  ---@type avante.Config
  opts = {
    provider = 'copilot',

    providers = {
      copilot = {
        model = 'claude-opus-4.5',
      },
    },

    behaviour = {
      auto_suggestions = false, -- using blink-cmp-copilot
    },

    input = {
      provider = 'snacks',
      provider_opts = {
        title = 'Avante Input',
      },
    },
  },
}
