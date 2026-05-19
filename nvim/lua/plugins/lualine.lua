---@module "lz.n"
---@type lz.n.PluginSpec
return {
  'lualine.nvim',
  event = 'DeferredUIEnter',
  after = function()
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
  end,
}
