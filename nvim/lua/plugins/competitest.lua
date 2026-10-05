---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'competitest.nvim',
  after = function()
    require('competitest').setup()
  end,
}
