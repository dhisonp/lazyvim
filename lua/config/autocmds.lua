--  Auto Commands
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'prisma',
  callback = function()
    vim.treesitter.start()
  end,
})
