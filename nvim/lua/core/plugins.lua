local corePlugins = vim.api.nvim_get_runtime_file('lua/plugins/core/*.lua', true)

for _, plugin in ipairs(corePlugins) do
  dofile(plugin)
end

-- lazy
require('lazy').setup({
  dev = {
    path = mnw.configDir .. '/pack/mnw/opt',
    -- match all plugins
    patterns = { '' },
    -- fallback to downloading plugins from git
    -- disable this to force only using nix plugins
    fallback = true,
  },

  -- keep rtp/packpath the same
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },

  install = {
    -- don't install missing plugins
    missing = false,
  },

  spec = {
    { import = 'plugins.lazy' },
  },
})
