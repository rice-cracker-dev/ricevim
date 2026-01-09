vim.diagnostic.config({ virtual_lines = true })

vim.api.nvim_create_augroup('ricevim_lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  callback = function(args)
    require('linter').lint(args.buf)
  end,
})
