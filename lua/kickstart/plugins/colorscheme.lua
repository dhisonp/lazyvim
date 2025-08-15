return {
    -- Tokyonight colorscheme
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('tokyonight').setup {
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }
        end,
    },

    -- Kanagawa colorscheme
    {
        'rebelot/kanagawa.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            -- Load the colorscheme here
            vim.cmd.colorscheme 'kanagawa'
        end,
    },
}
