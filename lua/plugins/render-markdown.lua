---@module 'lazy'
---@module 'render-markdown'
---@type LazySpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
  dependencies = { 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite

  ---@type render.md.UserConfig
  opts = {
    anti_conceal = { enabled = false },
    file_types = { 'markdown', 'opencode_output' },
  },
}
