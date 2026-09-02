pcall(vim.cmd.colorscheme, 'modus-vivendi')

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

  -- Only the window geometry is overridden: the providers are left at defaults
  -- on purpose -- fzf-lua already prefers ripgrep for grep and fd for files
  -- when they are on $PATH.
  local ok_fzf, fzf = pcall(require, 'fzf-lua')
  if ok_fzf then
    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          scrollbar = false,
          -- Tested against the fzf window's inner width (0.80 * terminal),
          -- so 88 keeps the horizontal split down to ~124-cell terminals.
          flip_columns = 88,
        },
      },
    })
    fzf.register_ui_select()
  end
end)
