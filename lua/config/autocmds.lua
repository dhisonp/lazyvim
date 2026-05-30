--  Auto Commands
--  See `:help lua-guide-autocommands`

-- Show diagnostics under the cursor on hold (virtual_text is disabled, see mason.lua)
vim.api.nvim_create_autocmd('CursorHold', {
  group = vim.api.nvim_create_augroup('diagnostic-float-on-hold', { clear = true }),
  callback = function()
    vim.diagnostic.open_float({ focusable = false, scope = 'cursor' })
  end,
})
