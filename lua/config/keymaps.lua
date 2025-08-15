vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open Lazygit' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Copy file paths
vim.keymap.set('n', '<leader>fc', function()
  local path = vim.fn.expand '%'
  vim.fn.setreg('+', path)
  print(path)
end, { desc = 'Copy absolute file path' })
vim.keymap.set('n', '<leader>fr', function()
  local relative_path = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
  vim.fn.setreg('+', relative_path)
  print(relative_path)
end, { desc = 'Copy relative file path' })

-- fzf-lua
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<CR>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>ft', '<cmd>FzfLua btags<CR>', { desc = 'Buffer tags' })
vim.keymap.set('n', '<leader>uc', '<cmd>FzfLua colorschemes<CR>', { desc = 'Select theme' })
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<CR>', { desc = 'Grep visual' })

-- grapple
vim.keymap.set('n', '<leader>pt', '<cmd>Grapple toggle<cr>', { desc = 'Toggle tag' })
vim.keymap.set('n', '<leader>pl', '<cmd>Grapple toggle_tags<cr>', { desc = 'Tag list' })
vim.keymap.set('n', '<leader>pj', '<cmd>Grapple cycle_tags next<cr>', { desc = 'Next tag' })
vim.keymap.set('n', '<leader>pk', '<cmd>Grapple cycle_tags prev<cr>', { desc = 'Prev tag' })

-- toggleterm
vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('t', '<C-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })

-- debug
vim.keymap.set('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', { desc = 'Debug: Start/continue' })
vim.keymap.set('n', '<F1>', '<cmd>lua require("dap").step_into()<CR>', { desc = 'Debug: Step into' })
vim.keymap.set('n', '<F2>', '<cmd>lua require("dap").step_over()<CR>', { desc = 'Debug: Step over' })
vim.keymap.set('n', '<F3>', '<cmd>lua require("dap").step_out()<CR>', { desc = 'Debug: Step out' })
vim.keymap.set(
  'n',
  '<leader>b',
  '<cmd>lua require("dap").toggle_breakpoint()<CR>',
  { desc = 'Debug: Toggle breakpoint' }
)
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set breakpoint' })
vim.keymap.set('n', '<F7>', '<cmd>lua require("dapui").toggle()<CR>', { desc = 'Debug: See last session result' })

-- conform
vim.keymap.set(
  '',
  '<leader>F',
  '<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>',
  { desc = 'Format buffer' }
)

-- neo-tree
-- NOTE: This is only open, and not close tree.
vim.keymap.set('', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
