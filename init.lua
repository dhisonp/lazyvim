-- Leader must be set before any plugin loads so <leader> mappings
-- registered during plugin setup resolve to the right key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Bootstrap
local plug = vim.fn.stdpath 'data' .. '/site/autoload/plug.vim'
local bootstrapped = false

if vim.fn.filereadable(plug) == 0 then
  print 'Installing vim-plug...'
  vim.fn.system({
    'curl',
    '-fLo',
    plug,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
  })
  if vim.v.shell_error ~= 0 then
    error('Failed to download vim-plug to ' .. plug)
  end
  -- A newly created site/autoload/ isn't discoverable in this session, so
  -- plug#begin() would fail with E117 if we didn't source plug.vim directly.
  vim.cmd('source ' .. vim.fn.fnameescape(plug))
  bootstrapped = true
end

-- plug#begin() with no argument defaults to stdpath('data')/plugged.
vim.cmd [[
  call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
  Plug 'ibhagwan/fzf-lua'
  Plug 'tanvirtin/monokai.nvim'
  call plug#end()
]]

-- Installed synchronously here, not via VimEnter, since VimEnter fires after
-- -c/+cmd args (`nvim --headless -c qa` would exit before it ran); lua/plugins.lua picks plugins up from here.
if bootstrapped then
  vim.cmd 'PlugInstall --sync'
end

require 'options'
require 'keymaps'
require 'plugins'
require 'autocmds'
require 'lsp'
