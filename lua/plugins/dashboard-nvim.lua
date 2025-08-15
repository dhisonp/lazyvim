return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'doom',
      config = {
        center = {
          {
            action = 'FzfLua files',
            desc = 'Find File',
            key = 'f',
          },
          {
            action = 'Grapple toggle_tags',
            desc = 'Grapple Tags',
            key = 'p',
          },
          {
            action = 'LazyGit',
            desc = 'LazyGit',
            key = 'g',
          },
          {
            action = 'Mason',
            desc = 'Mason',
            key = 'm',
          },
          {
            action = 'Lazy',
            desc = 'Lazy',
            key = 'l',
          },
          {
            action = function()
              vim.api.nvim_input '<cmd>qa<cr>'
            end,
            desc = 'Quit',
            key = 'q',
          },
        },
        vertical_center = true,
      },
    })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
