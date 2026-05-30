-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic Quickfix list' }
)
vim.keymap.set('n', '<C-n>', ":let @+ = expand('%')<CR>", { desc = 'Copy relative file path' })

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
vim.keymap.set('n', 'ga', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'Code actions' })
vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<CR>', { desc = 'See references' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'See definitions' })
vim.keymap.set('n', '<leader>a', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'See code actions' })
vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>FzfLua diagnostics_workspace<CR>',
  { desc = 'See workspace diagnostics' }
)

-- LSP and Code
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-c>', 'gc', { remap = true })

-- Conform (note: <C-i> is the same keycode as <Tab>)
vim.keymap.set(
  'n',
  '<C-i>',
  '<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>',
  { desc = 'Format buffer' }
)

-- Disable default LSP keymaps (gr* chain) so our `gr` mapping isn't shadowed by a timeout.
-- pcall guards against a future Neovim that no longer defines one of these.
for _, m in ipairs({
  { 'n', 'grt' },
  { 'n', 'gri' },
  { 'n', 'grr' },
  { 'n', 'gra' },
  { 'x', 'gra' },
  { 'n', 'grn' },
  { 'n', 'grx' },
}) do
  pcall(vim.keymap.del, m[1], m[2])
end
