require('lualine').setup({
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
})
