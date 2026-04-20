local utils = require('utils')
local files = vim.api.nvim_get_runtime_file('after/lsp/*.lua', true)

for _, path in ipairs(files) do
  local name = utils.get_file_name_no_ext(path)
  vim.lsp.enable(name)
end
