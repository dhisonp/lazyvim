return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },

  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      markdown = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      vue = { 'prettier' },
    },
    formatters = {
      prettier = {
        -- Only run if prettier config exists in the workspace
        require_cwd = true,
      },
    },
  },
}

