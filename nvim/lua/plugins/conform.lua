---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  after = function()
    local utils = require('utils')
    local formatter = require('formatter')
    local config_files = vim.api.nvim_get_runtime_file('lua/formatters/*.lua', true)

    local formatters = {}
    for _, path in pairs(config_files) do
      local name = utils.get_file_name_no_ext(path)
      local config = dofile(path)

      formatters[name] = config
    end

    require('conform').setup({
      formatters = formatters,
      formatters_by_ft = formatter.formatters_by_ft,

      default_format_opts = {
        lsp_format = 'fallback',
      },

      format_on_save = { timeout_ms = 500 },
    })
  end,
}
