-- Leader must be set before any plugin loads so <leader> mappings
-- registered during plugin setup resolve to the right key.
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

local pack_ok, pack_err = pcall(vim.pack.add, {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/ishan9299/modus-theme-vim',
}, { confirm = false })
if not pack_ok then
  vim.notify(tostring(pack_err), vim.log.levels.WARN)
end

require 'options'
require 'keymaps'
require 'plugins'
require 'autocmds'
require 'lsp'
