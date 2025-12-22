---@module 'snacks'

local wk = require('which-key')

wk.add({
  {
    '<c-t>',
    function()
      Snacks.terminal.toggle()
    end,
    desc = 'Toggle terminal',
  },
  { '<c-n>', '<cmd>Neotree toggle<cr>', desc = 'Toggle file tree' },

  { '<leader>b', group = 'Buffer', icon = '' },
  {
    '<leader>bd',
    function()
      Snacks.bufdelete()
    end,
    desc = 'Delete buffer',
  },
  { '<leader>bn', '<cmd>bn<cr>', desc = 'Next buffer' },
  { '<leader>bp', '<cmd>bp<cr>', desc = 'Previous buffer' },
  {
    '<leader>bs',
    function()
      Snacks.scratch()
    end,
    desc = 'Toggle scratch buffer',
  },
  {
    '<leader>bS',
    function()
      Snacks.scratch.select()
    end,
    desc = 'Select scratch buffer',
  },

  { '<leader>l', group = 'LSP', icon = '󰅴' },
  {
    '<leader>lf',
    function()
      require('conform').format()
    end,
    desc = 'Format [Conform]',
  },

  { '<leader>f', group = 'Picker', icon = '󰍉' },
  {
    '<leader>ff',
    function()
      Snacks.picker.files()
    end,
    desc = 'Find files',
  },
  {
    '<leader>fg',
    function()
      Snacks.picker.grep()
    end,
    desc = 'Grep files',
  },
  {
    '<leader>fb',
    function()
      Snacks.picker.buffers()
    end,
    desc = 'Find buffers',
  },
  {
    '<leader>fi',
    function()
      Snacks.picker.icons()
    end,
    desc = 'Find icons',
  },
  {
    '<leader>fh',
    function()
      Snacks.picker.highlights()
    end,
    desc = 'Find highlights',
  },

  { '<leader>g', group = 'Git', icon = '' },
  {
    '<leader>gi',
    function()
      Snacks.picker.gh_issue()
    end,
    desc = 'GitHub Issues (open)',
  },
  {
    '<leader>gI',
    function()
      Snacks.picker.gh_issue({ state = 'all' })
    end,
    desc = 'GitHub Issues (all)',
  },
  {
    '<leader>gp',
    function()
      Snacks.picker.gh_pr()
    end,
    desc = 'GitHub Pull Requests (open)',
  },
  {
    '<leader>gP',
    function()
      Snacks.picker.gh_pr({ state = 'all' })
    end,
    desc = 'GitHub Pull Requests (all)',
  },
  {
    '<leader>gg',
    function()
      Snacks.lazygit()
    end,
    desc = 'Toggle Lazygit',
  },

  { '<leader>a', group = 'Assistant', icon = '' },
  { '<leader>ac', '<cmd>CodeCompanionChat<cr>', desc = 'Toggle chat' },
  { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Actions' },
  { '<leader>ap', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'Prompt' },
})
