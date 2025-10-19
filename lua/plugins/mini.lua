return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup({ n_lines = 300 })
    require('mini.surround').setup()
  end,
}
