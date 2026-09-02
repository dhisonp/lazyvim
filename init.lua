-- Leader must be set before plugins load so <leader> mappings registered during
-- their setup resolve to the right key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('treesitter-update', { clear = true }),
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      require('nvim-treesitter').update(nil, { summary = true })
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/ishan9299/modus-theme-vim',
  'https://github.com/lewis6991/gitsigns.nvim',
}, { confirm = false })

require 'options'
require 'keymaps'
require 'autocmds'
require 'lsp'
-- Last: everything above is first-party and independent of it, so a broken
-- plugin costs only its own setup rather than the whole config.
require 'plugins'
