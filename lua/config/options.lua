vim.g.have_nerd_font = true

-- Color Scheme
vim.cmd.colorscheme 'sonokai'

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

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
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

-- Notifications
vim.notify = require 'notify'
