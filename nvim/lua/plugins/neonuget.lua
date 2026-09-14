---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'neonuget',
  cmd = 'NuGet',

  after = function()
    require('neonuget').setup({
      dotnet_path = 'dotnet',
      default_project = nil,
    })
  end,
}
