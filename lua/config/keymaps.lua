-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
  'n',
  '<leader>q',
  '<cmd>CocList diagnostics<CR>',
  { desc = 'Open diagnostic Quickfix list' }
)

vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Lazygit' })

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Fzf-lua
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>uc', '<cmd>FzfLua colorschemes<CR>', { desc = 'Select theme' })

-- Commenting
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-c>', 'gc', { remap = true })

-- COC
vim.keymap.set('n', '<leader>r', '<Plug>(coc-rename)', { desc = 'Rename symbol' })
vim.keymap.set(
  'i',
  '<Tab>',
  [[coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"]],
  { expr = true, silent = true }
)
vim.keymap.set(
  'i',
  '<C-space>',
  'coc#refresh()',
  { expr = true, silent = true, desc = 'Trigger completion' }
)
vim.keymap.set(
  'n',
  '<C-i>',
  '<cmd>CocCommand editor.action.formatDocument<CR>',
  { desc = 'Format buffer' }
)
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { desc = 'See references' })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { desc = 'See definitions' })
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-cursor)', { desc = 'See code actions' })
vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>CocList diagnostics<CR>',
  { desc = 'See workspace diagnostics' }
)

-- Neo-tree
vim.keymap.set('n', '\\', '<cmd>Neotree toggle<CR>', { desc = 'File explorer' })
