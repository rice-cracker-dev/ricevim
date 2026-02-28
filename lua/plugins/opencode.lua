---@module 'lazy'
---@module 'edgy'
---@type LazySpec
return {
  {
    'sudo-tee/opencode.nvim',

    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim',
      'saghen/blink.cmp',
      'folke/snacks.nvim',
    },

    opts = {
      preferred_picker = 'snacks',
      preferred_completion = 'blink',

      ui = {
        input = {
          min_height = 0.25,
          max_height = 0.25,
        },
      },
    },
  },

  {
    'folke/edgy.nvim',

    ---@type Edgy.Config
    opts = {
      right = {
        {
          ft = 'opencode_output',
          wo = {
            winbar = false,
            winhighlight = 'Normal:OpencodeBackground',
          },
        },
        {
          ft = 'opencode',
          size = { height = 8 },
          wo = {
            winbar = false,
            winhighlight = 'Normal:OpencodeBackground',
          },
        },
      },
    },
  },
}
