local treesitter_augroup = vim.api.nvim_create_augroup('ricevim_treesitter', { clear = true })

local language_filetypes = {
  javascript = { 'javascriptreact' },
  tsx = { 'typescriptreact' },
}

for filetype, exts in pairs(language_filetypes) do
  vim.treesitter.language.register(filetype, exts)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = treesitter_augroup,
  callback = function(args)
    -- highlight
    pcall(vim.treesitter.start, args.buf)

    -- fold
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- indent
    vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
  end,
})
