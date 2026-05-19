---@module 'lazy'
---@type LazySpec
return {
  'nvim-mini/mini.nvim',

  config = function()
    -- call twice to access MiniIcons.get on the second setup call
    require('mini.icons').setup({
      filetype = {
        ['javascript.jsx'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['typescript.tsx'] = { glyph = '', hl = 'MiniIconsBlue' },
      },
    })
    MiniIcons.mock_nvim_web_devicons()

    -- text editing
    require('mini.comment').setup({
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },

      mappings = {
        comment = '<leader>c',
        comment_line = '<leader>c',
        comment_visual = '<leader>c',
        textobject = '<leader>c',
      },
    })
    require('mini.surround').setup()
    require('mini.splitjoin').setup()

    local loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup({
      snippets = { loader.from_lang() },
      expand = {
        insert = function(snippet)
          return MiniSnippets.default_insert(snippet, { empty_tabstop = '', empty_tabstop_final = '' })
        end,
      },
    })
  end,
}
