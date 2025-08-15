return {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    'glepnir/dashboard-nvim',
    event = 'VimEnter', -- Or 'BufWinEnter'
    config = function()
        require('dashboard').setup {
            theme = 'doom',
            disable_statusline = false,
            disable_header = false,
            center = {
                {
                    icon = '󰈞  ',
                    desc = 'Find  File                              ',
                    action = 'FzfLua files',
                    key = '<Leader> f f',
                },
            },
        }
    end,
}
