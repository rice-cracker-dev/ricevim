---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'edgy.nvim',
  event = 'DeferredUIEnter',
  after = function()
    ---@module 'edgy'
    ---@type Edgy.Config
    local opts = {
      animate = {
        enabled = false,
      },
      options = {
        left = { size = 30 },
        bottom = { size = 10 },
        right = { size = 90 },
        top = { size = 10 },
      },
      left = {
        {
          title = 'Filesystem',
          ft = 'neo-tree',
          filter = function(buf)
            return vim.b[buf].neo_tree_source == 'filesystem'
          end,
          size = { height = 1 },
        },
      },
      right = {
        {
          ft = 'opencode_output',
          wo = {
            winbar = false,
            winhighlight = 'Normal:OpencodeBackground',
          },
        },
        {
          ft = 'opencode',
          size = { height = 8 },
          wo = {
            winbar = false,
            winhighlight = 'Normal:OpencodeBackground',
          },
        },
      },
    }

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
}
