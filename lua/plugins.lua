-- pcall-guarded: a failed or interrupted bootstrap degrades to a working
-- bare config instead of an error wall on every launch.
pcall(vim.cmd.colorscheme, 'monokai')

-- Deferred off the startup path (~12ms). Neither call is needed before the
-- first screen: parsers already on disk are picked up by vim.treesitter.start
-- (lua/autocmds.lua), and :FzfLua is registered by the plugin's own plugin/
-- file, so the keymaps work without requiring the module here.
vim.schedule(function()
  -- On treesitter's `main` branch parsers are installed imperatively. install()
  -- is a no-op for parsers already present.
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

  -- register_ui_select() is the only call with an effect: setup() is a no-op
  -- here, since fzf-lua sets its highlights up at load and the providers are
  -- left at defaults on purpose -- it already prefers ripgrep for grep and fd
  -- for files when they are on $PATH.
  local ok_fzf, fzf = pcall(require, 'fzf-lua')
  if ok_fzf then
    fzf.register_ui_select()
  end
end)
