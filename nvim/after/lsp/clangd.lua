---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('clangd', 'clang-tools') },
}
