---@module 'lazy'
---@module 'snacks'
---@type LazySpec
return {
  {
    'nickjvandyke/opencode.nvim',

    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim',
      'saghen/blink.cmp',
      'folke/snacks.nvim',
    },

    config = function()
      vim.g.opencode_opts = {
        provider = {
          enabled = 'snacks',
        },
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}
