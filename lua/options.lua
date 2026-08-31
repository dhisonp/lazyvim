-- Disable unused providers to suppress healthcheck warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.o.wrap = false

vim.o.swapfile = false

vim.o.mouse = ''
vim.o.showmode = false

vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.opt.shortmess:append 'I'

vim.o.clipboard = 'unnamedplus'

vim.o.signcolumn = 'yes'
vim.o.winborder = 'rounded'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preserve formatter's decision on trailing newlines
vim.o.fixendofline = false

vim.diagnostic.config({
  severity_sort = true,
  virtual_lines = { current_line = true },
  float = { source = 'if_many' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})
