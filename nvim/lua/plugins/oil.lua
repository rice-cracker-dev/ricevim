---@module 'lazy'
---@type LazySpec
return {
  'stevearc/oil.nvim',
  cmd = 'Oil',

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
}
