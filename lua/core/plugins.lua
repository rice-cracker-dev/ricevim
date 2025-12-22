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
    -- install missing plugins
    missing = true,
  },

  spec = {
    { import = 'plugins' },
  },
})
