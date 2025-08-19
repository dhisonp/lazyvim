-- General Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic Quickfix list' }
)

vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open Lazygit' })

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Copy File Paths
-- vim.keymap.set('n', '<leader>fc', function()
--   local path = vim.fn.expand '%'
--   vim.fn.setreg('+', path)
--   print(path)
-- end, { desc = 'Copy absolute file path' })
-- vim.keymap.set('n', '<leader>fr', function()
--   local relative_path = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
--   vim.fn.setreg('+', relative_path)
--   print(relative_path)
-- end, { desc = 'Copy relative file path' })

-- Fzf-lua Keymaps
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>uc', '<cmd>FzfLua colorschemes<CR>', { desc = 'Select theme' })

-- Fzf-lua LSP Keymaps
vim.keymap.set('n', 'ga', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'FzfLua: Code Actions' })
vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<CR>', { desc = 'FzfLua: View References' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'FzfLua: View Definition' })
vim.keymap.set('n', '<leader>a', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'See code actions' })

-- Debug Keymaps
-- vim.keymap.set(
--   'n',
--   '<F5>',
--   '<cmd>lua require("dap").continue()<CR>',
--   { desc = 'Debug: Start/continue' }
-- )
-- vim.keymap.set(
--   'n',
--   '<F1>',
--   '<cmd>lua require("dap").step_into()<CR>',
--   { desc = 'Debug: Step into' }
-- )
-- vim.keymap.set(
--   'n',
--   '<F2>',
--   '<cmd>lua require("dap").step_over()<CR>',
--   { desc = 'Debug: Step over' }
-- )
-- vim.keymap.set('n', '<F3>', '<cmd>lua require("dap").step_out()<CR>', { desc = 'Debug: Step out' })
-- vim.keymap.set(
--   'n',
--   '<leader>b',
--   '<cmd>lua require("dap").toggle_breakpoint()<CR>',
--   { desc = 'Debug: Toggle breakpoint' }
-- )
-- vim.keymap.set('n', '<leader>B', function()
--   require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
-- end, { desc = 'Debug: Set breakpoint' })
-- vim.keymap.set(
--   'n',
--   '<F7>',
--   '<cmd>lua require("dapui").toggle()<CR>',
--   { desc = 'Debug: See last session result' }
-- )

-- Conform
vim.keymap.set(
  'n',
  '<C-i>',
  '<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>',
  { desc = 'Format buffer' }
)

-- Disable Default LSP Keymaps (gr_ keymaps)
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gra')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'grn')

-- Other LSP Keymaps (from mason.lua, if any were left)
