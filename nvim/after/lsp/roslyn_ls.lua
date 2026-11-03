---@type vim.lsp.Config
return {
  cmd = {
    require('utils').get_builtin_bin('Microsoft.CodeAnalysis.LanguageServer', 'roslyn-ls'),
    '--stdio',
  },
}
