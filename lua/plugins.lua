vim.cmd.colorscheme 'kanagawa'

vim.schedule(function()
  -- On treesitter's `main` branch parsers are installed imperatively. install()
  -- is a no-op for parsers already present.
  require('nvim-treesitter').install({
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

  -- Allow vertical split on widths >= 124
  local fzf = require 'fzf-lua'
  fzf.setup({
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        scrollbar = false,
        flip_columns = 88,
      },
    },
  })
  fzf.register_ui_select()

  require('gitsigns').setup()
end)
