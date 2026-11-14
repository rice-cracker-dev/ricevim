---@type vim.lsp.Config
return {
  cmd = { require('utils').get_builtin_bin('rust-analyzer') },

  settings = {
    ['rust-analyzer'] = {
      rustfmt = {
        overrideCommand = { require('utils').get_builtin_bin('rustfmt') },
      },
      check = {
        command = 'clippy',
      },
    },
  },
}
