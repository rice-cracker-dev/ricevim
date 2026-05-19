---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'diagflow.nvim',
  event = 'LspAttach',
  after = function()
    require('diagflow').setup()
  end,
}
