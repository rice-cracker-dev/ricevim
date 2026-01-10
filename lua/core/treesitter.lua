local treesitter_augroup = vim.api.nvim_create_augroup('ricevim_treesitter', { clear = true })

-- highlight
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = treesitter_augroup,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- fold
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = treesitter_augroup,
  callback = function()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})

-- indent
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   group = treesitter_augroup,
--   callback = function()
--     vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
--   end,
-- })
