---@module 'lazy'
---@module 'which-key'
---@type LazySpec
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',

  ---@type wk.Opts
  opts = {
    preset = 'modern',
  },
}
