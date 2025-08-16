return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'doom',
      config = {
        header = {
          -- Best Pokemon
          '                              ',
          '⠀⠀⠀⠀⠀⣀⣖⣚⡂⠀⠀⠀⠀⣓⢲⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⢠⢴⣖⣒⡗⠃⠀⠀⠀⠀⢀⣄⣘⠛⠒⢻⣶⣦⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢰⢺⠚⢰⡜⠃⠀⠀⠀⣄⣶⠛⠀⠀⠀⠀⠀⠀⠘⡞⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⣿⢸⠀⢸⣇⣀⠀⣀⣀⣿⣘⠀⠀⣀⢠⣒⣂⣀⡀⢇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⡸⠼⣶⠚⢳⡆⠀⠀⣿⠀⠀⠒⣀⢶⢾⡟⠠⡥⣳⢺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢅⢸⠿⢦⣈⡱⠶⠶⠿⣄⣀⠶⣿⠉⢸⣇⠀⢇⡈⣎⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⣼⢩⠍⠉⠉⠉⠠⠀⠀⠉⠉⢰⣉⣀⡺⠁⠀⠈⢧⣿⡯⡄⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢹⠉⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⣸⡏⠳⡧⡄⠀⠀⠀⠀⠀⠀⠀',
          '⣼⣤⠀⠀⠀⠀⠀⠀⠁⠀⠠⠿⣤⠀⠀⠀⢠⡼⠟⣿⡆⠉⠿⠩⠂⠀⠀⠀⠀⠀',
          '⠹⠻⣤⠀⠀⠀⠀⠀⠀⠀⣞⠠⢭⣽⠿⠉⠉⠁⡠⠋⠿⣤⠀⣤⡇⠄⠀⠀⠀⠀',
          '⠀⠈⠻⠿⡏⢫⣭⣭⣭⣭⡤⣿⣿⣿⣱⠀⠀⠊⠀⠀⠀⠠⠛⣿⡇⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠉⠉⠉⠉⢉⣹⣛⣻⠒⣿⠀⠀⠀⠀⢠⣤⡟⡛⠉⠈⣇⢲⣒⣲⣀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⣈⣬⠀⠀⣿⠂⠀⢸⠀⢸⡇⠀⡂⣤⠀⣭⠒⠒⠒⠚⢻⣶',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠟⣿⠀⢠⢺⣀⠀⠙⠛⡟⠃⣿⣺⠀⠀⠀⠀⠘⢺',
          '⠀⠀⠀⠀⠀⠀⠀⠀⣆⡷⠀⢀⣈⣿⢹⠀⠘⢦⣀⡀⠀⣶⠻⡀⠀⠀⠀⠀⠀⢸',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣲⣀⠀⠈⢹⣇⣀⡀⠀⠑⠒⣿⣀⠈⠒⠒⠒⠂⢰⣺',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⡉⠈⠉⠀⢰⠀⢸⣿⣗⣲⣶⣶⣖⣻⣀⠀⠀⢀⣰⣾⠿',
          '⠀⠀⠀⠀⠀⠀⠀⠀⣶⣆⣶⣀⣀⣊⣰⣾⠀⠀⠀⠀⠀⢸⢻⠉⠀⠈⡉⠹⢿⣶',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠛⠛⠛⠛⠀⠀⠀⠀⠀⠀⠘⢻⣲⣀⣰⣇⣀⣸⣿',
          '                              ',
          '                              ',
          '                              ',
        },
        center = {
          {
            action = 'FzfLua files',
            desc = 'Find files',
            key = 'f',
          },
          {
            action = 'FzfLua oldfiles',
            desc = 'Find recent files',
            key = 'r',
          },
          {
            action = 'FzfLua grep_visual',
            desc = 'Search directory',
            key = 'g',
          },
          {
            action = 'Grapple toggle_tags',
            desc = 'Grapple tags',
            key = 'p',
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
