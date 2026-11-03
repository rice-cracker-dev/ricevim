---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('lua-language-server') },

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
