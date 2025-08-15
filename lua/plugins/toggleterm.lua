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
  end,
}
