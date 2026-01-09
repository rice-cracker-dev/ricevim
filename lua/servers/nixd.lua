---@type vim.lsp.Config
return {
  settings = {
    formatting = {
      command = { 'alejandra' },
    },

    diagnostics = {
      suppress = { 'sema-primop-overridden' },
    },
  },
}
