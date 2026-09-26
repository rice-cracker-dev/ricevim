local M = {}

---@type fun(path: string): string
function M.get_file_name_no_ext(path)
  return vim.fn.fnamemodify(path, ':t:r')
end

---@type function
function M.snacks_directory_picker()
  require('lz.n').trigger_load('oil.nvim')

  Snacks.picker.pick({
    title = 'Directories',
    format = 'text',
    preview = function(ctx)
      Snacks.picker.preview.directory(ctx)
    end,
    finder = function(opts, ctx)
      local cwd = vim.fs.normalize(opts and opts.cwd or vim.uv.cwd() or '.')

      return require('snacks.picker.source.proc').proc(
        ctx:opts({
          cwd = cwd,
          cmd = 'fd',
          args = { '.', '--type', 'directory', '--color', 'never' },
          transform = function(item)
            item.cwd = cwd
            item.file = item.text
          end,
        }),
        ctx
      )
    end,
    confirm = function(picker, item)
      picker:close()
      if item then
        require('oil').open(item.file)
      end
    end,
  })
end

---@param bin string
---@return boolean
function M.tsc_supports_lsp(bin)
  if vim.fn.executable(bin) ~= 1 then
    return false
  end

  local out = vim.system({ bin, '--version' }, { text = true }):wait()
  local version = vim.version.parse(out.stdout or '')

  return out.code == 0 and version ~= nil and version.major >= 7
end

return M
