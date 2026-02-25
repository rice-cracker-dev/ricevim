---@module 'lazy'
---@module 'snacks'
---@type LazySpec
return {
  'sudo-tee/opencode.nvim',

  dependencies = {
    'MeanderingProgrammer/render-markdown.nvim',
    'saghen/blink.cmp',
    'folke/snacks.nvim',
  },

  config = function()
    require('opencode').setup({
      preferred_picker = 'snacks',
      preferred_completion = 'blink',
    })
  end,
}
