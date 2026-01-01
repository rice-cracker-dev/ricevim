local utils = require('utils')
local capabilities = require('blink.cmp').get_lsp_capabilities()

local config_files = vim.api.nvim_get_runtime_file('lua/servers/*.lua', true)
local servers = {}

for _, path in ipairs(config_files) do
  local name = utils.get_file_name_no_ext(path)
  local config = dofile(path)

  local on_attach = vim.lsp.config[name] ~= nil and vim.lsp.config[name].on_attach
  local config_on_attach = config.on_attach

  config.capabilities = capabilities
  config.on_attach = function(client, bufnr)
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
