---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'typst-preview.nvim',
  ft = 'typst',
  after = function()
    require('typst-preview').setup()
  end,
}
