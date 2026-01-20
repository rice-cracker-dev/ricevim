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
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()

    -- appearance
    require('mini.tabline').setup()
  end,
}
