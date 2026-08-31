--------------------------------------------------------------------
-- Leader
--
-- Must be set before any plugin loads so that <leader> mappings
-- registered during plugin setup resolve to the right key.
--------------------------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--------------------------------------------------------------------
-- Bootstrap
--
-- Fetch vim-plug on first launch, then install the plugins inline so the
-- rest of this file runs with everything already on the runtimepath.
--------------------------------------------------------------------
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
  -- The autoload dir did not exist at startup, so plug#begin() is not
  -- discoverable yet in this session. Source it directly.
  vim.cmd('source ' .. vim.fn.fnameescape(plug))
  bootstrapped = true
end

--------------------------------------------------------------------
-- Plugins
--
-- plug#begin() with no argument defaults to stdpath('data')/plugged.
--------------------------------------------------------------------
vim.cmd [[
  call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
  Plug 'ibhagwan/fzf-lua'
  Plug 'tanvirtin/monokai.nvim'
  call plug#end()
]]

-- Install synchronously here rather than from a VimEnter hook: VimEnter fires
-- after any -c/+cmd arguments, so `nvim --headless -c qa` would exit before the
-- hook ran and silently install nothing. plug#end() has already put the plugin
-- paths on the runtimepath, so the Plugin Settings section below picks them up
-- without needing to re-source this file.
if bootstrapped then
  vim.cmd 'PlugInstall --sync'
end

--------------------------------------------------------------------
-- Basic Options
--------------------------------------------------------------------
vim.g.have_nerd_font = true

-- Disable unused providers to suppress healthcheck warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Editor
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.opt.wrap = false

-- File handling
vim.opt.swapfile = false

-- Mouse
vim.o.mouse = 'a'
vim.o.showmode = false

-- Behavior
vim.o.breakindent = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.opt.shortmess:append 'I'

-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 250

-- Windows
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preserve formatter's decision on trailing newlines
vim.opt.fixendofline = false

-- Diagnostics. virtual_text is off on purpose: the CursorHold autocmd
-- below shows the message in a float instead, gated by updatetime=250.
vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = true,
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = false,
})

--------------------------------------------------------------------
-- Key Mappings
--------------------------------------------------------------------

-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic Quickfix list' }
)
vim.keymap.set('n', '<C-n>', ":let @+ = expand('%')<CR>", { desc = 'Copy relative file path' })

-- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Fuzzy Finding (fzf-lua)
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>h', '<cmd>FzfLua help_tags<CR>', { desc = 'Find help tags' })

-- LSP and Code
vim.keymap.set('n', 'ga', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'Code actions' })
vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<CR>', { desc = 'See references' })
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { desc = 'See definitions' })
vim.keymap.set('n', '<leader>a', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'See code actions' })
vim.keymap.set(
  'n',
  '<leader>d',
  '<cmd>FzfLua diagnostics_workspace<CR>',
  { desc = 'See workspace diagnostics' }
)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<C-c>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-c>', 'gc', { remap = true })

-- Disable default LSP keymaps (gr* chain) so our `gr` mapping isn't shadowed by a timeout.
-- pcall guards against a future Neovim that no longer defines one of these.
for _, m in ipairs({
  { 'n', 'grt' },
  { 'n', 'gri' },
  { 'n', 'grr' },
  { 'n', 'gra' },
  { 'x', 'gra' },
  { 'n', 'grn' },
  { 'n', 'grx' },
}) do
  pcall(vim.keymap.del, m[1], m[2])
end

--------------------------------------------------------------------
-- Plugin Settings
--
-- pcall-guarded so a failed or interrupted bootstrap degrades to a working
-- bare config rather than an error wall on every launch.
--------------------------------------------------------------------

-- Colorscheme
pcall(vim.cmd.colorscheme, 'monokai')

-- Treesitter. On the `main` branch parsers are installed imperatively and
-- highlighting is started per-buffer by the FileType autocmd below.
local ok_ts, ts = pcall(require, 'nvim-treesitter')
if ok_ts then
  ts.install({
    'bash',
    'css',
    'diff',
    'dockerfile',
    'gitcommit',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  })
end

-- fzf-lua. Providers are left at defaults on purpose: fzf-lua already prefers
-- ripgrep for grep/live_grep and fd for files when they are on $PATH.
local ok_fzf, fzf = pcall(require, 'fzf-lua')
if ok_fzf then
  fzf.setup({
    winopts = {
      preview = {
        -- 'flex' picks the layout by width: vertical (preview below the list)
        -- when the fzf window is <= flip_columns, horizontal above it. The
        -- width tested is fzf's own window, i.e. winopts.width (0.80) of
        -- vim.o.columns -- not the raw terminal width.
        layout = 'flex',
        flip_columns = 128,
      },
    },
  })
  fzf.register_ui_select()
end

--------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------

-- Show diagnostics under the cursor on hold (virtual_text is disabled above)
vim.api.nvim_create_autocmd('CursorHold', {
  group = vim.api.nvim_create_augroup('diagnostic-float-on-hold', { clear = true }),
  callback = function()
    vim.diagnostic.open_float({ focusable = false, scope = 'cursor' })
  end,
})

-- Enable treesitter highlighting wherever a parser is available.
-- pcall keeps it a no-op for filetypes without a parser.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- Highlight references to the symbol under the cursor, and expose an
-- inlay-hint toggle, for any server that advertises support.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if
      client
      and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
    then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
        end,
      })
    end

    if
      client
      and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
    then
      vim.keymap.set('n', '<leader>uh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, { buffer = event.buf, desc = 'LSP: Toggle Inlay Hints' })
    end
  end,
})

--------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------
require 'lsp'
