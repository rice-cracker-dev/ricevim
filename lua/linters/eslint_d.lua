return {
  args = {
    '--format',
    'json',
    '--stdin',
    '--stdin-filename',
    function()
      return vim.api.nvim_buf_get_name(0)
    end,
  },
  patterns = {
    '^eslint%.config%.[cm]?[tj]s$', -- v9.0+
    '^%.eslintrc%.', -- v8.0
  },
}
