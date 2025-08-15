vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

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

-- Keymaps
-- See `:help vim.keymap.set()`

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Custom (TODO: Refactor to appropriate configs)
vim.keymap.set('n', '<leader>uc', '<cmd>FzfLua colorschemes<CR>', { desc = 'Select Theme' })
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open Lazygit' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymaps from fzf-lua.lua
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<CR>', { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>ft', '<cmd>FzfLua btags<CR>', { desc = 'Buffer Tags' })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua colorschemes<CR>', { desc = 'Color Schemes' })
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>', { desc = 'Grep Visual' })

-- Keymaps from grapple.lua
vim.keymap.set('n', '<leader>pt', '<cmd>Grapple toggle<cr>', { desc = 'Toggle Tag' })
vim.keymap.set('n', '<leader>pl', '<cmd>Grapple toggle_tags<cr>', { desc = 'Tag List' })
vim.keymap.set('n', '<leader>pj', '<cmd>Grapple cycle_tags next<cr>', { desc = 'Next Tag' })
vim.keymap.set('n', '<leader>pk', '<cmd>Grapple cycle_tags prev<cr>', { desc = 'Prev Tag' })

-- Keymaps from toggleterm.lua
vim.keymap.set('n', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })

-- Keymaps from debug.lua
vim.keymap.set('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', '<cmd>lua require("dap").step_into()<CR>', { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', '<cmd>lua require("dap").step_over()<CR>', { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', '<cmd>lua require("dap").step_out()<CR>', { desc = 'Debug: Step Out' })
vim.keymap.set(
  'n',
  '<leader>b',
  '<cmd>lua require("dap").toggle_breakpoint()<CR>',
  { desc = 'Debug: Toggle Breakpoint' }
)
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
vim.keymap.set('n', '<F7>', '<cmd>lua require("dapui").toggle()<CR>', { desc = 'Debug: See last session result.' })

-- Keymaps from conform.lua
vim.keymap.set(
  '',
  '<leader>F',
  '<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>',
  { desc = 'Format buffer' }
)

-- Keymaps from neo-tree.lua
vim.keymap.set('', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
