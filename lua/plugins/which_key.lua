return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
  opts = {
    preset = 'helix',
    delay = 0,
    icons = {
      mappings = false,
      keys = {},
    },

    -- Document existing key chains
    spec = {
      { '<leader>f', group = 'FzfLua' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>u', group = 'User Interface' },
    },
  },
}
