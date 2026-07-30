---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'blame.nvim',
  cmd = 'BlameToggle',

  after = function()
    require('blame').setup({})
  end,
}
