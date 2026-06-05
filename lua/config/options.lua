vim.g.have_nerd_font = true

-- Disable unused providers to suppress healthcheck warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Color Scheme
vim.cmd.colorscheme 'oscura'

-- Editor
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.opt.wrap = false
--
-- File handling
vim.opt.swapfile = false

-- Mouse
vim.o.mouse = 'a'
vim.o.showmode = false

-- Behavior
vim.o.breakindent = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.opt.shortmess:append 'I'

-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 250

-- Windows
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preserve formatter's decision on trailing newlines
vim.opt.fixendofline = false
