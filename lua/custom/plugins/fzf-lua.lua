return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'echasnovski/mini.icons' },

  config = function()
    -- Calling setup is optional, but good practice to have in place
    require('fzf-lua').setup({})
  end,
}
