---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
}
