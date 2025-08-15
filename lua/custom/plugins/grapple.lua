return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>pt', '<cmd>Grapple toggle<cr>', desc = 'Toggle Tag' },
    { '<leader>pl', '<cmd>Grapple toggle_tags<cr>', desc = 'Tag List' },
    { '<leader>pj', '<cmd>Grapple cycle_tags next<cr>', desc = 'Next Tag' },
    { '<leader>pk', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Prev Tag' },
  },
}
