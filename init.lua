-- Leader must be set before any plugin loads so <leader> mappings
-- registered during plugin setup resolve to the right key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local plug = vim.fn.stdpath 'data' .. '/site/autoload/plug.vim'
local bootstrapped = false

if vim.fn.filereadable(plug) == 0 then
  print 'Installing vim-plug...'
  -- Download to a temp path and rename into place. curl -fLo writes in place,
  -- so an interrupted download would leave a readable but truncated plug.vim,
  -- and filereadable() would then never ask for it again -- plug#begin() would
  -- abort this file on every launch, taking the whole config with it.
  local tmp = plug .. '.tmp'
  vim.fn.system({
    'curl',
    '-fLo',
    tmp,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
  })
  if vim.v.shell_error ~= 0 then
    vim.fn.delete(tmp)
    error('Failed to download vim-plug to ' .. plug)
  end
  assert(vim.uv.fs_rename(tmp, plug))
  -- A newly created site/autoload/ isn't discoverable in this session, so
  -- plug#begin() would fail with E117 if we didn't source plug.vim directly.
  vim.cmd('source ' .. vim.fn.fnameescape(plug))
  bootstrapped = true
end

-- plug#begin() with no argument defaults to stdpath('data')/plugged. pcall'd
-- because an unusable plug.vim would otherwise abort this file and take
-- options, keymaps and lsp down with it; on failure we delete it so the next
-- launch re-bootstraps, and run bare for this one.
local plug_ok = pcall(function()
  vim.cmd [[
  call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
  Plug 'ibhagwan/fzf-lua'
  Plug 'tanvirtin/monokai.nvim'
  Plug 'nyoom-engineering/oxocarbon.nvim'
  call plug#end()
]]
end)

if not plug_ok then
  vim.fn.delete(plug)
  vim.notify('vim-plug failed to load and was removed; restart to reinstall', vim.log.levels.WARN)
end

-- Installed synchronously here, not via VimEnter: VimEnter fires after -c/+cmd
-- args, so `nvim --headless -c qa` would exit before it ran. plug#end() above
-- has already put the plugin paths on the runtimepath for lua/plugins.lua.
if bootstrapped and plug_ok then
  vim.cmd 'PlugInstall --sync'
end

require 'options'
require 'keymaps'
require 'plugins'
require 'autocmds'
require 'lsp'
