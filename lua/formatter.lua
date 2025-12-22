local M = {}

M.formatters_by_ft = {
  lua = { 'stylua' },
  javascript = { 'prettierd' },
  typescript = { 'prettierd' },
  javascriptreact = { 'prettierd' },
  typescriptreact = { 'prettierd' },
  html = { 'prettierd' },
  vue = { 'prettierd' },
  svelte = { 'prettierd' },
  astro = { 'prettierd' },
  css = { 'prettierd' },
  scss = { 'prettierd' },
  less = { 'prettierd' },
  yaml = { 'prettierd' },
  markdown = { 'prettierd' },
  graphql = { 'prettierd' },
  nix = { 'alejandra' },
  python = { 'ruff' },
}

return M
