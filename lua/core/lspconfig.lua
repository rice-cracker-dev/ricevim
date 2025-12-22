local wk = require('which-key')
local utils = require('utils')
local capabilities = require('blink.cmp').get_lsp_capabilities()

local default_on_attach = function(_, bufnr)
  wk.add({
    { '<leader>lgd', vim.lsp.buf.definition, desc = 'Go to definition', buffer = bufnr },
    { '<leader>lgD', vim.lsp.buf.declaration, desc = 'Go to declaration', buffer = bufnr },
    { '<leader>lgt', vim.lsp.buf.type_definition, desc = 'Go to type definition', buffer = bufnr },
    { '<leader>lgi', vim.lsp.buf.implementation, desc = 'List implementations', buffer = bufnr },
    { '<leader>lgr', vim.lsp.buf.references, desc = 'List implementations', buffer = bufnr },
    {
      '<leader>lgn',
      function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
      desc = 'Go to next diagnostic',
      buffer = bufnr,
    },
    {
      '<leader>lgp',
      function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
      desc = 'Go to previous diagnostic',
      buffer = bufnr,
    },
    { '<leader>le', vim.diagnostic.open_float, desc = 'Open diagnostic float', buffer = bufnr },
    { '<leader>lH', vim.lsp.buf.document_highlight, desc = 'Document highlight', buffer = bufnr },
    { '<leader>lS', vim.lsp.buf.document_symbol, desc = 'Document symbols', buffer = bufnr },
    { '<leader>lh', vim.lsp.buf.hover, desc = 'Hover', buffer = bufnr },
    { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help', buffer = bufnr },
    { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename symbol', buffer = bufnr },
    { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action', buffer = bufnr },
  })
end

local config_files = vim.api.nvim_get_runtime_file('lua/servers/*.lua', true)
local servers = {}

for _, path in ipairs(config_files) do
  local name = utils.get_file_name_no_ext(path)
  local config = dofile(path)

  local on_attach = vim.lsp.config[name] ~= nil and vim.lsp.config[name].on_attach
  local config_on_attach = config.on_attach

  config.capabilities = capabilities
  config.on_attach = function(client, bufnr)
    default_on_attach(client, bufnr)

    if on_attach then
      on_attach(client, bufnr)
    end

    if config_on_attach then
      config_on_attach(client, bufnr)
    end
  end

  vim.lsp.config[name] = vim.tbl_deep_extend('force', vim.lsp.config[name], config)
  table.insert(servers, name)
end

vim.lsp.enable(servers)
