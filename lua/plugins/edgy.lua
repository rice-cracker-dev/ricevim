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
    left = {
      {
        title = 'Filesystem',
        ft = 'neo-tree',
        filter = function(buf)
          return vim.b[buf].neo_tree_source == 'filesystem'
        end,
        size = { height = 1 },
      },
    },
    right = {
      {
        title = 'Assistant Chat',
        ft = 'codecompanion',
        size = { height = 1 },
      },
    },
  },
}
