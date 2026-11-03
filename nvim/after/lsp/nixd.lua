---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('nixd') },

  settings = {
    nixd = {
      formatting = {
        command = { 'alejandra' },
      },

      diagnostic = {
        suppress = { 'sema-primop-overridden' },
      },
    },
  },
}
