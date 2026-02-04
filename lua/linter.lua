---@module 'lint'

---@class linter.Linter : lint.Linter
---@field patterns? (string | string[])

local M = {}
local lint = require('lint')
local utils = require('utils')

M.linters_by_ft = {
  lua = { 'selene' },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  html = { 'eslint_d' },
  vue = { 'eslint_d' },
  svelte = { 'eslint_d' },
  astro = { 'eslint_d' },
  css = { 'eslint_d' },
  scss = { 'eslint_d' },
  less = { 'eslint_d' },
  yaml = { 'eslint_d' },
  markdown = { 'markdownlint-cli2' },
  nix = { 'statix' },
  python = { 'ruff' },
}

---@type table<string, linter.Linter>
local linters = {}
local config_files = vim.api.nvim_get_runtime_file('lua/linters/*.lua', true)

for _, path in ipairs(config_files) do
  local name = utils.get_file_name_no_ext(path)
  ---@type linter.Linter
  local config = dofile(path)
  local baseLinter = lint.linters[name]

  if type(baseLinter) == 'function' then
    baseLinter = baseLinter()
  end

  ---@diagnostic disable-next-line
  linters[name] = vim.tbl_deep_extend('force', baseLinter, config)
end

vim.g.linters = linters

---@type fun(buf: integer)
function M.lint(buf)
  buf = buf or vim.api.nvim_get_current_buf()

  local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
  local linter_names = M.linters_by_ft[ft]

  if linter_names == nil then
    return
  end

  for _, name in ipairs(linter_names) do
    ---@type linter.Linter|lint.Linter|fun(): lint.Linter
    local linter = linters[name] or lint.linters[name]
    assert(linter, 'Linter with name `' .. name .. '` not available')

    if type(linter) == 'function' then
      linter = linter()
    end

    local patterns = linter.patterns
    linter.name = linter.name or name

    if patterns == nil then
      lint.lint(linter)
    else
      local paths = vim.fs.find(function(fname)
        if type(patterns) == 'string' then
          return fname:match(patterns)
        else
          for _, pattern in ipairs(patterns) do
            if fname:match(pattern) then
              return true
            end
          end
        end

        return false
      end, { upward = true, type = 'file' })

      if #paths > 0 then
        lint.lint(linter)
      end
    end
  end
end

return M
