require('snacks').setup({
  picker = { enabled = true },
  terminal = { enabled = true },
  gh = { enabled = true },
  bigfile = { enabled = true },
  scratch = { enabled = true },
  indent = { enabled = true, animate = { enabled = false } },
  notifier = {
    enabled = true,
    padding = false,
    gap = 1,
  },
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
})
