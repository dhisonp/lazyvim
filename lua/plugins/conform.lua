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
      javascriptreact = { 'prettier' },
      python = { 'ruff_organize_imports', 'ruff_format' },
      typescriptreact = { 'prettier' },
      typescript = { 'prettier' },
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

