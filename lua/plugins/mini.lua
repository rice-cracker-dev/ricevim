---@module 'lazy'
---@module 'mini'
---@type LazySpec
return {
  'nvim-mini/mini.nvim',
  lazy = false,

  config = function()
    -- call twice to access MiniIcons.get on the second setup call
    require('mini.icons').setup({
      filetype = {
        ['javascript.jsx'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['typescript.tsx'] = { glyph = '', hl = 'MiniIconsBlue' },
      },
    })
    MiniIcons.mock_nvim_web_devicons()

    -- general
    require('mini.git').setup()
    require('mini.diff').setup()

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
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()

    -- appearance
    require('mini.tabline').setup()
  end,
}
