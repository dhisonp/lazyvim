return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = 'Live Grep',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'Find Buffers',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').help_tags()
      end,
      desc = 'Help Tags',
    },
    {
      '<leader>ft',
      function()
        require('fzf-lua').btags()
      end,
      desc = 'Buffer Tags',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').colorschemes()
      end,
      desc = 'Color Schemes',
    },
  },
  config = function()
    -- Calling setup is optional, but good practice to have in place
    require('fzf-lua').setup({})
  end,
}
