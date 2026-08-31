-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set(
  'n',
  '<C-n>',
  "<cmd>let @+ = expand('%')<CR>",
  { silent = true, desc = 'Copy relative file path' }
)

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Fuzzy Finding (fzf-lua)
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

-- LSP navigation. Neovim 0.11 binds these globally in its defaults
-- (runtime/lua/vim/_defaults.lua) to the built-in handlers, which dump results
-- into the quickfix list; re-binding globally here replaces them with fzf-lua's
-- picker + preview. `gra` is left alone -- it routes through vim.ui.select,
-- which register_ui_select() already hands to fzf-lua.
vim.keymap.set('n', 'grr', '<cmd>FzfLua lsp_references<CR>', { desc = 'Goto references' })
vim.keymap.set('n', 'gri', '<cmd>FzfLua lsp_implementations<CR>', { desc = 'Goto implementations' })
vim.keymap.set('n', 'grt', '<cmd>FzfLua lsp_typedefs<CR>', { desc = 'Goto type definitions' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'Goto definition' })
vim.keymap.set('n', 'gO', '<cmd>FzfLua lsp_document_symbols<CR>', { desc = 'Document symbols' })
