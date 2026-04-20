---@type vim.lsp.Config
return {
  name = 'qml-language-server',
  filetypes = { 'qml' },
  root_dir = function(bufnr, ondir)
    local root_patterns = { '.git', '.qml', 'qmldir' }
    local fname = vim.api.nvim_buf_get_name(bufnr)

    for _, pattern in ipairs(root_patterns) do
      local root = vim.fs.find(pattern, { path = fname, upward = true })[1]
      if root then
        ondir(vim.fs.dirname(root))
        return
      end
    end

    ondir(vim.fs.dirname(fname))
  end,
  cmd = { 'qml-language-server' },
}
