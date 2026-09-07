vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.cursorline = true
vim.o.number = true
vim.o.wrap = false

vim.o.mouse = ''
vim.o.swapfile = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- Preserve formatter's decision on trailing newlines
vim.o.fixendofline = false

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

-- Hide intro
vim.opt.shortmess:append 'sI'
