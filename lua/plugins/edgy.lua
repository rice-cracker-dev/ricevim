---@module 'lazy'
---@module 'edgy'
---@type LazySpec
return {
  'folke/edgy.nvim',
  event = 'VeryLazy',

  ---@type Edgy.Config
  opts = {
    animate = {
      enabled = false,
    },
    options = {
      left = { size = 30 },
      bottom = { size = 10 },
      right = { size = 90 },
      top = { size = 10 },
    },
  },
}
