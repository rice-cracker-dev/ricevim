---@module 'lazy'
---@module 'neo-tree'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,

  ---@type neotree.Config
  opts = {
    window = { mappings = { ['l'] = { 'toggle_node', nowait = true } } },
    filesystem = { filtered_items = { visible = true } },
  },
}
