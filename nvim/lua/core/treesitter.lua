-- blacklist certain filetype from using treesitter indent
local indent_blacklist = {
  qml = true,
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('ricevim_treesitter', { clear = true }),
  callback = function(args)
    local buf = args.buf
    local filetype = args.match
    local language = vim.treesitter.language.get_lang(filetype) or filetype

    if not vim.treesitter.language.add(language) then
      return
    end

    -- highlight
    vim.treesitter.start(buf, language)

    -- fold
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- indent
    -- still buggy as hell
    if not indent_blacklist[vim.bo.ft] then
      vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
    end
  end,
})

require('treesitter-context').setup({
  enable = true,
  multiwindow = true,
})
