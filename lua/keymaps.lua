vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })

vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>h', '<cmd>FzfLua help_tags<CR>', { desc = 'Find help tags' })
vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>FzfLua diagnostics_workspace<CR>',
  { desc = 'See workspace diagnostics' }
)

vim.keymap.set('n', 'grr', '<cmd>FzfLua lsp_references<CR>', { desc = 'Goto references' })
vim.keymap.set('n', 'gri', '<cmd>FzfLua lsp_implementations<CR>', { desc = 'Goto implementations' })
vim.keymap.set('n', 'grt', '<cmd>FzfLua lsp_typedefs<CR>', { desc = 'Goto type definitions' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'Goto definition' })
vim.keymap.set('n', 'gO', '<cmd>FzfLua lsp_document_symbols<CR>', { desc = 'Document symbols' })

