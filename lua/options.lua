vim.g.have_nerd_font = true

-- Disable unused providers to suppress healthcheck warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.opt.wrap = false

vim.opt.swapfile = false

vim.o.mouse = ''
vim.o.showmode = false

vim.o.breakindent = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.opt.shortmess:append 'I'

-- Deferred so startup doesn't pay the cost of probing the system clipboard
-- provider before the UI is up.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.signcolumn = 'yes'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preserve formatter's decision on trailing newlines
vim.opt.fixendofline = false

vim.diagnostic.config({
  severity_sort = true,
  virtual_lines = { current_line = true },
  float = { border = 'rounded', source = 'if_many' },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
})
