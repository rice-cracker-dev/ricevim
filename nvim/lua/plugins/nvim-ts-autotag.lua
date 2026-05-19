---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'nvim-ts-autotag',
  event = { 'BufReadPre', 'BufNewFile' },
  after = function()
    require('nvim-ts-autotag').setup()
  end,
}
