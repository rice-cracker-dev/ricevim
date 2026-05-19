---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'persistence.nvim',
  event = 'BufReadPre',
  after = function()
    require('persistence').setup()
  end,
}
