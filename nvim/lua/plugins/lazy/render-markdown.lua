---@module 'lazy'
---@module 'render-markdown'
---@type LazySpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },

  ---@type render.md.UserConfig
  opts = {
    anti_conceal = { enabled = false },
    file_types = { 'markdown', 'opencode_output' },
  },
}
