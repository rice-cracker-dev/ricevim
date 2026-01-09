---@module 'snacks'

local wk = require('which-key')
local constants = require('constants')

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
  { '<leader>lt', group = 'Trouble', icon = '' },
  {
    '<leader>ltt',
    '<cmd>Trouble diagnostics toggle<cr>',
    desc = 'Diagnostics',
  },
  {
    '<leader>ltb',
    '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    desc = 'Buffer',
  },
  {
    '<leader>lts',
    '<cmd>Trouble symbols toggle focus=false<cr>',
    desc = 'Symbols',
  },
  {
    '<leader>ltl',
    '<cmd>Trouble loclist toggle<cr>',
    desc = 'Location list',
  },
  {
    '<leader>ltq',
    '<cmd>Trouble qflist toggle<cr>',
    desc = 'Quickfix list',
  },

  { '<leader>f', group = 'Picker', icon = '󰍉' },
  {
    '<leader>ff',
    function()
      Snacks.picker.files(constants.snacks_picker_files_config)
    end,
    desc = 'Files',
  },
  {
    '<leader>fg',
    function()
      Snacks.picker.grep(constants.snacks_picker_grep_config)
    end,
    desc = 'Grep files',
  },
  {
    '<leader>fb',
    function()
      Snacks.picker.buffers()
    end,
    desc = 'Buffers',
  },
  {
    '<leader>fi',
    function()
      Snacks.picker.icons()
    end,
    desc = 'Icons',
  },
  {
    '<leader>fh',
    function()
      Snacks.picker.highlights()
    end,
    desc = 'Highlights',
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
})

vim.api.nvim_create_augroup('ricevim_lsp_mappings', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    wk.add({
      { '<leader>lgd', vim.lsp.buf.definition, desc = 'Go to definition', buffer = args.buf },
      { '<leader>lgD', vim.lsp.buf.declaration, desc = 'Go to declaration', buffer = args.buf },
      { '<leader>lgt', vim.lsp.buf.type_definition, desc = 'Go to type definition', buffer = args.buf },
      { '<leader>lgi', vim.lsp.buf.implementation, desc = 'List implementations', buffer = args.buf },
      { '<leader>lgr', vim.lsp.buf.references, desc = 'List implementations', buffer = args.buf },
      {
        '<leader>lgn',
        function()
          vim.diagnostic.jump({ count = 1, float = true })
        end,
        desc = 'Go to next diagnostic',
        buffer = args.buf,
      },
      {
        '<leader>lgp',
        function()
          vim.diagnostic.jump({ count = -1, float = true })
        end,
        desc = 'Go to previous diagnostic',
        buffer = args.buf,
      },
      { '<leader>le', vim.diagnostic.open_float, desc = 'Open diagnostic float', buffer = args.buf },
      { '<leader>lH', vim.lsp.buf.document_highlight, desc = 'Document highlight', buffer = args.buf },
      { '<leader>lS', vim.lsp.buf.document_symbol, desc = 'Document symbols', buffer = args.buf },
      { '<leader>lh', vim.lsp.buf.hover, desc = 'Hover', buffer = args.buf },
      { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help', buffer = args.buf },
      { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename symbol', buffer = args.buf },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action', buffer = args.buf },
    })
  end,
})
