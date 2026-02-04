---@module 'lazy'
---@module 'lualine'
---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'NotAShelf/direnv.nvim', 'nickjvandyke/opencode.nvim' },

  opts = function()
    local trouble = require('trouble')
    local symbols = trouble.statusline({
      mode = 'lsp_document_symbols',
      groups = {},
      title = false,
      filter = { range = true },
      format = '{kind_icon}{symbol.name:Normal}',
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = 'lualine_c_normal',
    })

    return {
      options = { section_separators = '', component_separators = '' },

      sections = {
        lualine_c = {
          {
            symbols.get,
            cond = symbols.has,
          },
        },
        lualine_x = {
          function()
            return require('direnv').statusline()
          end,
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_z = {
          require('opencode').statusline,
        },
      },
    }
  end,
}
