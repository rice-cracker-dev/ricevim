vim.keymap.set({ 'n', 'v' }, ' ', '<Nop>', { silent = true, remap = false })
vim.g.mapleader = ' '

vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.swapfile = false

vim.o.winborder = 'solid'
vim.o.laststatus = 3
vim.o.splitkeep = 'screen'
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.filetype.add({
  extension = {
    ejs = 'html',
    conf = 'conf',
    env = 'dotenv',
    hbs = 'html',
  },

  filename = {
    ['.env'] = 'dotenv',
    ['.envrc'] = 'direnv',
    ['tsconfig.json'] = 'jsonc',
    ['.prettierrc'] = 'json',
  },

  pattern = {
    ['%.env%.[%w_.-]+'] = 'dotenv',
    ['compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['docker%-compose.*%.ya?ml'] = 'yaml.docker-compose',
  },
})
