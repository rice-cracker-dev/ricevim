return {
  name = 'qml-language-server',
  filetypes = { 'qml' },
  root_dir = function(fname)
    local root_patterns = { '.git', '.qml', 'qmldir' }
    for _, pattern in ipairs(root_patterns) do
      local root = vim.fs.find(pattern, { path = fname, upward = true })[1]
      if root then
        return vim.fs.dirname(root)
      end
    end
    return vim.fs.dirname(fname)
  end,
  cmd = { 'qml-language-server' },
}
