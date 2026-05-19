---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'fidget.nvim',
  after = function()
    require('fidget').setup({})
  end,
}
