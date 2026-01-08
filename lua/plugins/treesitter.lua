---@module 'lazy'
---@module 'nvim-treesitter'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,

  opts = {
    modules = {},
    sync_install = false,
    auto_install = false,
    ignore_install = {},
    ensure_installed = {},

    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
      disable = {},
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  },
}
