vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/neovim/nvim-lspconfig',
})

vim.cmd.colorscheme 'kanagawa'

vim.schedule(function()
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
    'zig',
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
