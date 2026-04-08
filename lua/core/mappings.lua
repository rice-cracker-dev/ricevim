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
  {
    '<leader>f',
    function()
      Snacks.picker.files(constants.snacks_picker_files_config)
    end,
    desc = 'Pick files',
  },
  {
    '<leader>g',
    function()
      Snacks.picker.grep(constants.snacks_picker_grep_config)
    end,
    desc = 'Live grep',
  },
  {
    '<leader>b',
    function()
      Snacks.picker.buffers()
    end,
    desc = 'Pick buffers',
  },
  {
    '<leader>s',
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = 'Pick symbols',
  },
  {
    '<leader>S',
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = 'Pick workspace symbols',
  },
  {
    '<leader>i',
    function()
      Snacks.picker.icons()
    end,
    desc = 'Pick icons',
  },
  {
    '<leader>h',
    function()
      Snacks.picker.highlights()
    end,
    desc = 'Pick highlights',
  },
  {
    '<leader>G',
    function()
      Snacks.lazygit()
    end,
    desc = 'Toggle Lazygit',
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
