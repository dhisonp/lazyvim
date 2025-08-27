vim.g.have_nerd_font = true

-- Notifications
vim.notify = require 'notify'

-- Color Scheme
vim.cmd.colorscheme 'modus_vivendi'

-- Editor
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10

-- Mouse
vim.o.mouse = 'a'
vim.o.showmode = false

-- Behavior
vim.o.breakindent = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true

-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Windows
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
