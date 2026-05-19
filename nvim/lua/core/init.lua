vim.g.mapleader = ' '
require('lz.n').load('plugins')

require('core.options')
require('core.treesitter')
require('core.lsp')
require('core.mappings')
require('core.diagnostics')
