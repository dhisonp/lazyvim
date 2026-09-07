vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'sh',
    'css',
    'diff',
    'dockerfile',
    'gitcommit',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'query',
    'rust',
    'toml',
    'typescriptreact',
    'typescript',
    'vim',
    'help',
    'yaml',
    'zig',
  },
  callback = function()
    vim.treesitter.start()
  end,
})
