---@module 'lazy'
---@type LazySpec
return {
  'olimorris/codecompanion.nvim',
  dependencies = { 'zbirenbaum/copilot.lua', 'folke/snacks.nvim' },

  opts = {
    interactions = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'claude-opus-4.5',
        },
      },
    },

    display = {
      action_palette = { provider = 'snacks' },
    },
  },
}
