-- Native vim.lsp.config()/vim.lsp.enable() only -- no Mason, no nvim-lspconfig.
-- Every server here mirrors ~/.config/helix/languages.toml so Helix and Neovim
-- share one set of installed binaries; `cmd` is spelled out since there's no lspconfig default.

local ts_filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
}

-- Servers that are useful on standalone files fall back to the file's own
-- directory when no project marker is found. Without any root_dir, taplo and
-- lua_ls decline to analyse the buffer at all ("document has been excluded").
-- This matches how Helix roots a lone file.
local function root_with_fallback(markers)
  return function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(bufnr, markers)
    if not root and fname ~= '' then
      root = vim.fs.dirname(fname)
    end
    on_dir(root)
  end
end

-- TypeScript / JavaScript
vim.lsp.config('vtsls', {
  cmd = { 'vtsls', '--stdio' },
  filetypes = ts_filetypes,
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

-- ESLint: lint only. It is the sole formatter-adjacent tool here, and runs
-- its fixes on save rather than owning documentFormatting.
vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = ts_filetypes,
  root_markers = {
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    'package.json',
    '.git',
  },
  settings = {
    validate = 'on',
    format = false,
    -- The server dereferences settings.experimental.useFlatConfig on startup;
    -- omitting it crashes textDocument/diagnostic.
    experimental = { useFlatConfig = false },
    quiet = false,
    run = 'onType',
    onIgnoredFiles = 'off',
    useESLintClass = false,
    problems = { shortenToSingleLine = false },
    nodePath = '',
    rulesCustomizations = {},
    codeActionOnSave = { enable = false, mode = 'all' },
    workingDirectory = { mode = 'location' },
    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true },
    },
  },
  -- The server requires workspaceFolder in its settings before initialize.
  before_init = function(_, config)
    local root = config.root_dir or vim.fn.getcwd()
    config.settings = config.settings or {}
    config.settings.workspaceFolder = {
      uri = vim.uri_from_fname(root),
      name = vim.fn.fnamemodify(root, ':t'),
    }
  end,
  -- Custom eslint/* requests the server will hang on if left unanswered.
  handlers = {
    ['eslint/confirmESLintExecution'] = function(_, result)
      if not result then
        return
      end
      return 4 -- approved
    end,
    ['eslint/openDoc'] = function(_, result)
      if result and result.url then
        vim.ui.open(result.url)
      end
      return {}
    end,
    ['eslint/probeFailed'] = function()
      return {}
    end,
    ['eslint/noLibrary'] = function()
      return {}
    end,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('eslint-fix-on-save', { clear = false }),
      buffer = bufnr,
      callback = function()
        client:request_sync('workspace/executeCommand', {
          command = 'eslint.applyAllFixes',
          arguments = {
            { uri = vim.uri_from_bufnr(bufnr), version = vim.lsp.util.buf_versions[bufnr] },
          },
        }, nil, bufnr)
      end,
    })
  end,
})

-- Python
vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_dir = root_with_fallback({
    'ty.toml',
    'pyproject.toml',
    'setup.py',
    'requirements.txt',
    '.git',
  }),
})

-- ruff is the linter; ty owns hover and go-to. Formatting stays off so it
-- never competes with ty over the same buffer.
vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_dir = root_with_fallback({ 'ruff.toml', '.ruff.toml', 'pyproject.toml', '.git' }),
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- TOML
vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },
  filetypes = { 'toml' },
  root_dir = root_with_fallback({ '.taplo.toml', 'taplo.toml', '.git' }),
})

-- Rust
vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
    },
  },
})

-- YAML
vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  root_dir = root_with_fallback({ '.git' }),
  settings = {
    yaml = {
      format = { enable = true },
      validate = true,
      schemas = {
        ['https://json.schemastore.org/github-workflow.json'] = '.github/workflows/*.{yml,yaml}',
        ['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json'] = 'roles/{tasks,handlers}/*.{yml,yaml}',
      },
    },
  },
})

-- Lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_dir = root_with_fallback({
    '.luarc.json',
    '.luarc.jsonc',
    '.stylua.toml',
    'stylua.toml',
    '.git',
  }),
  -- Stands in for what lazydev.nvim used to do: teach lua_ls about `vim`
  -- and the Neovim runtime.
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      completion = { callSnippet = 'Replace' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Enable
vim.lsp.enable({
  'eslint',
  'lua_ls',
  'ruff',
  'rust_analyzer',
  'taplo',
  'ty',
  'vtsls',
  'yamlls',
})
