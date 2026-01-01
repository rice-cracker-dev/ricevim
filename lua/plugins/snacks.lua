---@module 'lazy'
---@module 'edgy'
---@module 'snacks'
---@type LazySpec
return {
  {
    'nvim-neo-tree/neo-tree.nvim',

    opts = function(_, opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end
      local events = require('neo-tree.events')
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
    end,
  },
  {
    'folke/edgy.nvim',
    ---@param opts Edgy.Config
    opts = function(_, opts)
      for _, pos in ipairs({ 'top', 'bottom', 'left', 'right' }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = 'snacks_terminal',
          size = { height = 0.3 },
          title = '%{b:snacks_terminal.id}: %{b:term_title}',
          filter = function(_, win)
            return vim.w[win].snacks_win and vim.w[win].snacks_win.position == pos and vim.w[win].snacks_win.relative == 'editor' and not vim.w[win].trouble_preview
          end,
        })
      end
    end,
  },
  {
    'folke/snacks.nvim',
    lazy = false,

    ---@type snacks.Config
    opts = {
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
    },
  },
}
