---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'direnv.nvim',
  lazy = false,
  after = function()
    require('direnv').setup()
  end,
}
