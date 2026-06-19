---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'direnv.nvim',
  lazy = false,
  after = function()
    require('direnv').setup({
      keybindings = {
        allow = '<leader>Da',
        deny = '<leader>Dd',
        reload = '<leader>Dr',
        edit = '<leader>De',
      },
    })
  end,
}
