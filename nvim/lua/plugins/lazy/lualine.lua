---@module "lazy"
---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = { section_separators = '', component_separators = '' },

    sections = {
      lualine_x = {
        function()
          return require('nvim.lua.plugins.lazy.direnv').statusline()
        end,
        'encoding',
        'fileformat',
        'filetype',
      },
    },
  },
}
