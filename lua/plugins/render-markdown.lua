---@module 'lazy'
---@module 'render-markdown'
---@type LazySpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'Avante' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite

  ---@type render.md.UserConfig
  opts = {
    file_types = { 'markdown', 'Avante' },
  },
}
