---@type vim.lsp.Config
return {
  settings = {
    formatting = {
      command = { 'alejandra' },
    },

    diagnostic = {
      suppress = { 'sema-primop-overridden' },
    },
  },
}
