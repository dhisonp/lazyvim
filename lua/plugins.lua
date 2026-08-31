-- pcall-guarded: a failed or interrupted bootstrap degrades to a working
-- bare config instead of an error wall on every launch.
pcall(vim.cmd.colorscheme, 'monokai')

-- Treesitter. On the `main` branch parsers are installed imperatively and
-- highlighting is started per-buffer by the FileType autocmd in lua/autocmds.lua.
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
  fzf.setup({})
  fzf.register_ui_select()
end
