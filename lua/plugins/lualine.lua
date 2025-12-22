---@module 'lazy'
---@module 'lualine'
---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'NotAShelf/direnv.nvim' },

  opts = {
    options = { section_separators = '', component_separators = '' },

    sections = {
      lualine_x = {
        function()
          return require('direnv').statusline()
        end,
        'encoding',
        'fileformat',
        'filetype',
      },
    },
  },
}
