return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        center = {
          {
            action = 'FzfLua files',
            desc = 'Find File',
            key = 'f',
          },
          {
            action = 'Lazy',
            desc = 'Lazy',
            key = 'l',
          },
          {
            action = 'LazyGit',
            desc = 'LazyGit',
            key = 'g',
          },
          {
            action = function()
              vim.api.nvim_input '<cmd>qa<cr>'
            end,
            desc = 'Quit',
            key = 'q',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
