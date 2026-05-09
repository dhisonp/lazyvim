--  Auto Commands
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float({ focusable = false, scope = 'cursor' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'prisma',
  callback = function()
    vim.treesitter.start()
  end,
})
