return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    close_on_exit = true,
    direction = 'horizontal',
    size = 20,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    vim.keymap.set('n', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
    vim.keymap.set('t', '<C-j>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
  end,
}
