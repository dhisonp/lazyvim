return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },

  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettier', stop_after_first = true },
      typescript = { 'prettier', stop_after_first = true },
      javascriptreact = { 'prettier', stop_after_first = true },
      typescriptreact = { 'prettier', stop_after_first = true },
      vue = { 'prettier', stop_after_first = true },
    },
  },
}
