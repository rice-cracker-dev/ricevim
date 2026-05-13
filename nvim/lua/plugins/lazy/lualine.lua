require('lualine').setup({
  options = { section_separators = '', component_separators = '' },

  sections = {
    lualine_x = {
      function()
        return require('nvim.lua.plugins.core.direnv').statusline()
      end,
      'encoding',
      'fileformat',
      'filetype',
    },
  },
})
