return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Calling setup is optional, but good practice to have in place
    require('fzf-lua').setup({})
  end,
}
