---@module 'lazy'

local utils = require('utils')

---@type LazySpec
return {
  'mfussenegger/nvim-lint',
  lazy = false,

  config = function()
    local lint = require('lint')
    local config_files = vim.api.nvim_get_runtime_file('lua/linters/*.lua', true)

    for _, path in ipairs(config_files) do
      local name = utils.get_file_name_no_ext(path)
      local config = dofile(path)

      ---@diagnostic disable-next-line
      lint.linters[name] = vim.tbl_deep_extend('force', lint.linters[name], config)
    end
  end,
}
