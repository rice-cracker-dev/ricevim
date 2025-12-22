---@module 'lint'

---@class linter.Linter : lint.Linter
---@field patterns? (string | string[])

local M = {}

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

---@type fun(buf: integer)
function M.lint(buf)
  buf = buf or vim.api.nvim_get_current_buf()

  local lint = require('lint')
  local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
  local linters = M.linters_by_ft[ft]

  if linters == nil then
    return
  end

  for _, name in ipairs(linters) do
    ---@type linter.Linter
    ---@diagnostic disable-next-line
    local linter = lint.linters[name]
    assert(linter, 'Linter with name `' .. name .. '` not available')

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
