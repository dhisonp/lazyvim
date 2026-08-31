-- nvim-treesitter's `main` branch does not start highlighting itself (only the
-- runtime's own ftplugins for lua, markdown, help and query do), so this autocmd is required.
-- pcall keeps it a no-op for filetypes without a parser.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
