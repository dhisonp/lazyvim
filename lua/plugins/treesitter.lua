return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'lua',
      'vim',
      'vimdoc',
      'query',
      'markdown',
      'markdown_inline',
      'typescript',
      'tsx',
      'javascript',
      'vue',
      'css',
      'html',
      'python',
      'json',
      'toml',
      'yaml',
      'dockerfile',
      'prisma',
      'bash',
      'diff',
      'gitcommit',
    })

    -- Enable treesitter highlighting wherever a parser is available.
    -- pcall keeps it a no-op for filetypes without a parser.
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
