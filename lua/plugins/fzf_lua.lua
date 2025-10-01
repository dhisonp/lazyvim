return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('fzf-lua').setup({})
    -- Register as vim.ui.select backend to fix code actions
    require('fzf-lua').register_ui_select()
  end,
}
