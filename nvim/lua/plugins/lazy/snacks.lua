---@module 'lazy'
---@type LazySpec
return {
  'folke/snacks.nvim',

  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    picker = { enabled = true },
    terminal = { enabled = true },
    bigfile = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    dashboard = {
      enabled = true,
      pane_gap = 16,
      sections = {
        { section = 'keys', gap = 1, padding = 1 },
        { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
  },
}
