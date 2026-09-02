-- nvim-treesitter's `main` branch does not start highlighting itself (only the
-- runtime's own ftplugins for lua, markdown, help and query do), so this autocmd
-- is required. language.add reports a missing parser by returning nil instead of
-- throwing, which keeps filetypes without one a no-op and lets a real failure in
-- start() surface.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf)
    end
  end,
})
