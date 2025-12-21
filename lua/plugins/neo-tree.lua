---@module 'lazy'
---@module 'neo-tree'
---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,

  ---@type neotree.Config
  opts = {
    window = { mappings = { ["l"] = {"toggle_node", nowait = true } } }
  },

  keys = {
    {"<c-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree"}
  },
}
