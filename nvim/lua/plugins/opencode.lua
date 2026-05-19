---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'opencode.nvim',
  event = 'DeferredUIEnter',
  before = function()
    require('lz.n').trigger_load('render-markdown.nvim')
  end,
  after = function()
    require('opencode').setup({
      preferred_picker = 'snacks',
      preferred_completion = 'blink',

      ui = {
        input = {
          min_height = 0.25,
          max_height = 0.25,
        },
      },
    })
  end,
}
