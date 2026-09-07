vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search' })

vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>?', '<cmd>FzfLua help_tags<CR>', { desc = 'Find help tags' })
vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>FzfLua diagnostics_workspace<CR>',
  { desc = 'See workspace diagnostics' }
)
vim.keymap.set('n', '<leader>g', function()
  require('fzf-lua').git_status()
end, { desc = 'Git status' })

vim.keymap.set('n', 'grr', '<cmd>FzfLua lsp_references<CR>', { desc = 'Goto references' })
vim.keymap.set('n', 'gri', '<cmd>FzfLua lsp_implementations<CR>', { desc = 'Goto implementations' })
vim.keymap.set('n', 'grt', '<cmd>FzfLua lsp_typedefs<CR>', { desc = 'Goto type definitions' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'Goto definition' })
vim.keymap.set('n', 'gO', '<cmd>FzfLua lsp_document_symbols<CR>', { desc = 'Document symbols' })

vim.keymap.set('n', ']h', function()
  require('gitsigns').nav_hunk 'next'
end, { desc = 'Next hunk' })
vim.keymap.set('n', '[h', function()
  require('gitsigns').nav_hunk 'prev'
end, { desc = 'Previous hunk' })
vim.keymap.set('n', '<leader>hs', function()
  require('gitsigns').stage_hunk()
end, { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>hr', function()
  require('gitsigns').reset_hunk()
end, { desc = 'Reset hunk' })
vim.keymap.set('v', '<leader>hs', function()
  require('gitsigns').stage_hunk({ vim.fn.line '.', vim.fn.line 'v' })
end, { desc = 'Stage selection' })
vim.keymap.set('v', '<leader>hr', function()
  require('gitsigns').reset_hunk({ vim.fn.line '.', vim.fn.line 'v' })
end, { desc = 'Reset selection' })
vim.keymap.set('n', '<leader>hp', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>hb', function()
  require('gitsigns').blame_line({ full = true })
end, { desc = 'Blame line' })
vim.keymap.set('n', '<leader>hd', function()
  require('gitsigns').diffthis()
end, { desc = 'Diff buffer' })
vim.keymap.set({ 'o', 'x' }, 'ih', function()
  require('gitsigns').select_hunk()
end, { desc = 'Hunk' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
