---@type vim.lsp.Config
return {
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
