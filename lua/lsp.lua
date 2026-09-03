local ts_filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
}

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

vim.lsp.config('vtsls', {
  cmd = { 'vtsls', '--stdio' },
  filetypes = ts_filetypes,
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

-- TODO: Clean noisy ESLint LSP definition
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
  -- Most of this is a crash guard, not preference: the server reads these paths
  -- with no optional chaining, so omitting any of experimental, problems,
  -- codeAction, rulesCustomizations or nodePath throws at runtime. Do not trim
  -- them as "obvious defaults". workingDirectory is also load-bearing -- setting
  -- it at all suppresses per-file module resolution in favour of the root.
  settings = {
    validate = 'on',
    format = false,
    run = 'onType',
    onIgnoredFiles = 'off',
    experimental = { useFlatConfig = false },
    problems = { shortenToSingleLine = false },
    nodePath = '',
    rulesCustomizations = {},
    workingDirectory = { mode = 'location' },
    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true },
    },
  },
  -- The server reads workspaceFolder out of its settings during initialize.
  before_init = function(_, config)
    local root = config.root_dir or vim.fn.getcwd()
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
})

-- eslint has no willSaveWaitUntil, so fixes go through an explicit command
-- before write. Registered once here rather than in on_attach: a plain `:e`
-- detaches and re-attaches the client, and nvim_create_autocmd does not dedupe,
-- so per-attach registration stacks up a blocking request per reload.
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('eslint-fix-on-save', { clear = true }),
  callback = function(ev)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf, name = 'eslint' })) do
      -- Explicit timeout: the default is 1000ms, long enough for a wedged
      -- server to stall every save.
      local res = client:request_sync('workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
          { uri = vim.uri_from_bufnr(ev.buf), version = vim.lsp.util.buf_versions[ev.buf] },
        },
      }, 400, ev.buf)
      if res and res.err then
        vim.notify('eslint.applyAllFixes: ' .. tostring(res.err.message), vim.log.levels.WARN)
      end
    end
  end,
})

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

vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_dir = root_with_fallback({ 'ruff.toml', '.ruff.toml', 'pyproject.toml', '.git' }),
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
})

vim.lsp.config('taplo', {
  cmd = { 'taplo', 'lsp', 'stdio' },
  filetypes = { 'toml' },
  root_dir = root_with_fallback({ '.taplo.toml', 'taplo.toml', '.git' }),
})

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

vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'build.zig.zon', 'build.zig', '.git' },
})

-- prettier and stylua read .prettierrc/.stylua.toml; the language servers don't.
local prettier = { 'prettier', '--stdin-filepath', '%s' }
local formatters = {
  lua = { 'stylua', '--stdin-filepath', '%s', '-' },
}
local prettier_filetypes = { 'css', 'html', 'json', 'jsonc', 'markdown', 'scss' }
for _, ft in ipairs(vim.list_extend(prettier_filetypes, ts_filetypes)) do
  formatters[ft] = prettier
end

-- prettier is rarely installed globally, so prefer the project's own copy.
local function resolve(cmd, name)
  for dir in vim.fs.parents(name) do
    local bin = dir .. '/node_modules/.bin/' .. cmd
    if vim.fn.executable(bin) == 1 then
      return bin
    end
  end
  return vim.fn.executable(cmd) == 1 and cmd or nil
end

vim.api.nvim_create_user_command('Fmt', function(opts)
  local range
  if opts.range > 0 then
    range = {
      start = { opts.line1, 0 },
      ['end'] = { opts.line2, vim.fn.col({ opts.line2, '$' }) - 1 },
    }
  end

  local name = vim.api.nvim_buf_get_name(0)
  local argv = formatters[vim.bo.filetype]
  local bin = (argv and not range and name ~= '') and resolve(argv[1], name) or nil
  if not argv or not bin then
    return vim.lsp.buf.format({ range = range })
  end

  local cmd = { bin }
  for i = 2, #argv do
    cmd[i] = (argv[i]:gsub('%%s', name))
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local res = vim.system(cmd, { stdin = lines }):wait()
  if res.code ~= 0 then
    return vim.notify(vim.trim(res.stderr), vim.log.levels.WARN)
  end

  local out = vim.split((res.stdout:gsub('\n$', '')), '\n')
  if not vim.deep_equal(lines, out) then
    local view = vim.fn.winsaveview()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, out)
    vim.fn.winrestview(view)
  end
end, { range = true, desc = 'Format buffer or range' })

-- autotrigger only fires on the server's triggerCharacters (typically `.`),
-- so identifier characters are added to also complete while typing a name.
local identifier_chars =
  vim.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_', '')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-autocompletion', { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local provider = client.server_capabilities.completionProvider
    if provider then
      provider.triggerCharacters =
        vim.list_extend(provider.triggerCharacters or {}, identifier_chars)
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.lsp.enable({
  'eslint',
  'lua_ls',
  'ruff',
  'rust_analyzer',
  'taplo',
  'ty',
  'vtsls',
  'yamlls',
  'zls',
})
