vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = 'Fuzzy find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { desc = 'Fuzzy grep files' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<cr>', { desc = 'Fuzzy grep tags in help files' })
vim.keymap.set('n', '<leader>ft', '<cmd>FzfLua btags<cr>', { desc = 'Fuzzy search buffer tags' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = 'Fuzzy search opened buffers' })

return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
}
