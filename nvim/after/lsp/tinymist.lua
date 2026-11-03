---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('tinymist') },
  settings = {
    formatterMode = 'typstyle',
    exportPdf = 'onType',
    semanticTokens = 'disable',
  },
}
