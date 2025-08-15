return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'horizontal',
    close_on_exit = true,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    vim.keymap.set('n', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
    vim.keymap.set('t', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
  end,
}
