---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'oil.nvim',
  after = function()
    require('oil').setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
