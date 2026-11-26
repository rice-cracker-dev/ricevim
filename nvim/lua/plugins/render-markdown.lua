---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'render-markdown.nvim',
  ft = { 'markdown', 'Avante', 'copilot-chat' },
  after = function()
    require('render-markdown').setup({
      anti_conceal = { enabled = false },
      file_types = { 'markdown' },
    })
  end,
}
