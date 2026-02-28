---@module 'lazy'
---@module 'edgy'
---@module 'neo-tree'
---@type LazySpec
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    lazy = false,

    ---@type neotree.Config
    opts = {
      window = { mappings = { ['l'] = { 'toggle_node', nowait = true } } },
      filesystem = { filtered_items = { visible = true } },
    },
  },
  {
    'folke/edgy.nvim',

    ---@type Edgy.Config
    opts = {
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
    },
  },
}
