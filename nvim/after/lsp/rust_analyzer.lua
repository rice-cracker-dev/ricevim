---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('rust-analyzer') },
}
