---@module 'conform'
local M = {}

---@type conform.FiletypeFormatter
local prettier_compatible = { 'oxfmt', 'prettierd', stop_after_first = true }

M.formatters_by_ft = {
  lua = { 'stylua' },
  javascript = prettier_compatible,
  typescript = prettier_compatible,
  javascriptreact = prettier_compatible,
  typescriptreact = prettier_compatible,
  html = prettier_compatible,
  vue = prettier_compatible,
  svelte = prettier_compatible,
  astro = prettier_compatible,
  css = prettier_compatible,
  scss = prettier_compatible,
  less = prettier_compatible,
  yaml = prettier_compatible,
  markdown = prettier_compatible,
  graphql = prettier_compatible,
  nix = { 'alejandra' },
  python = { 'ruff' },
  nu = { 'nufmt' },
  csharp = { 'csharpier' },
}

return M
