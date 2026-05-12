return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        pathStrict = false,
      },
      workspace = {
        checkThirdParty = false,
        ignoreDir = {},
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
