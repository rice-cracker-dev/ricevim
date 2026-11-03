---@module 'snacks'

local wk = require('which-key')
local constants = require('constants')

wk.setup({ preset = 'helix' })
wk.add({ ' ', '<Nop>', { silent = true, remap = false } })

-- incremental selection
wk.add({
  '<A-o>',
  function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      require('vim.treesitter._select').select_parent(vim.v.count1)
    else
      vim.lsp.buf.selection_range(vim.v.count1)
    end
  end,
  mode = { 'n', 'x', 'o' },
  desc = 'Select outer node',
}, {
  '<A-i>',
  function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
      require('vim.treesitter._select').select_child(vim.v.count1)
    else
      vim.lsp.buf.selection_range(-vim.v.count1)
    end
  end,
  mode = { 'n', 'x', 'o' },
  desc = 'Select inner node',
})

wk.add({
  {
    '<c-t>',
    function()
      Snacks.terminal.toggle()
    end,
    desc = 'Toggle terminal',
  },
  {
    '<c-b>',
    '<cmd>BlameToggle<cr>',
    desc = 'Toggle git blame',
  },
  { '<c-n>', '<cmd>Oil<cr>', desc = 'Toggle Oil' },
  {
    '<leader>b',
    function()
      Snacks.scratch.open({
        win = {
          width = 0.9,
          height = 0.9,
        },
      })
    end,
    desc = 'Toggle scratch buffer',
  },
  {
    '<leader>f',
    group = 'Pickers',
  },
  {
    '<leader>ff',
    function()
      Snacks.picker.files(constants.snacks_picker_files_config)
    end,
    desc = 'Pick files',
  },
  {
    '<leader>fd',
    function()
      require('utils').snacks_directory_picker()
    end,
    desc = 'Pick directories',
  },
  {
    '<leader>fg',
    function()
      Snacks.picker.grep(constants.snacks_picker_grep_config)
    end,
    desc = 'Live grep',
  },
  {
    '<leader>fb',
    function()
      Snacks.picker.buffers()
    end,
    desc = 'Pick buffers',
  },
  {
    '<leader>fs',
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = 'Pick symbols',
  },
  {
    '<leader>fS',
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = 'Pick workspace symbols',
  },
  {
    '<leader>fi',
    function()
      Snacks.picker.icons()
    end,
    desc = 'Pick icons',
  },
  {
    '<leader>fh',
    function()
      Snacks.picker.highlights()
    end,
    desc = 'Pick highlights',
  },
  {
    '<leader>g',
    function()
      Snacks.lazygit.open()
    end,
    desc = 'Toggle Lazygit',
  },
  {
    '<leader>D',
    group = 'Direnv',
  },
  {
    '<leader>o',
    group = 'Opencode',
  },
  {
    '<leader>p',
    group = 'CompetiTest',
  },
  {
    '<leader>pr',
    '<cmd>CompetiTest run<cr>',
  },
  {
    '<leader>pe',
    '<cmd>CompetiTest edit_testcase<cr>',
  },
  {
    '<leader>pa',
    '<cmd>CompetiTest add_testcase<cr>',
  },
  {
    '<leader>pd',
    '<cmd>CompetiTest delete_testcase<cr>',
  },
})

vim.api.nvim_create_augroup('ricevim_lsp_mappings', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    wk.add({
      { 'gd', vim.lsp.buf.definition, desc = 'Go to definition', buffer = args.buf },
      { 'gD', vim.lsp.buf.declaration, desc = 'Go to declaration', buffer = args.buf },
      { 'gy', vim.lsp.buf.type_definition, desc = 'Go to type definition', buffer = args.buf },
      { 'gi', vim.lsp.buf.implementation, desc = 'List implementations', buffer = args.buf },
      { 'gr', vim.lsp.buf.references, desc = 'List implementations', buffer = args.buf },
      {
        ']d',
        function()
          vim.diagnostic.jump({ count = 1, float = true })
        end,
        desc = 'Go to next diagnostic',
        buffer = args.buf,
      },
      {
        '[d',
        function()
          vim.diagnostic.jump({ count = -1, float = true })
        end,
        desc = 'Go to previous diagnostic',
        buffer = args.buf,
      },
      { '<leader>K', vim.diagnostic.open_float, desc = 'Open diagnostic float', buffer = args.buf },
      { '<leader>k', vim.lsp.buf.hover, desc = 'Hover', buffer = args.buf },
      { '<leader>r', vim.lsp.buf.rename, desc = 'Rename symbol', buffer = args.buf },
      { '<leader>a', vim.lsp.buf.code_action, desc = 'Code action', buffer = args.buf },
    })
  end,
})
