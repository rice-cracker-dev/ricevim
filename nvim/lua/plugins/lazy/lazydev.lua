---@module 'lazy'
---@type LazySpec
return {
  'folke/lazydev.nvim',

  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      { path = vim.g.hyprland_stub, words = { 'hl%.' } },
    },
  },
}
