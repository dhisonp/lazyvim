return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- Ensure blink.cmp is loaded before LSP attaches so it can register its capabilities
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if
          client
          and client:supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight,
            event.buf
          )
        then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
            end,
          })
        end

        if
          client
          and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
        then
          vim.keymap.set('n', '<leader>uh', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, { buffer = event.buf, desc = 'LSP: Toggle Inlay Hints' })
        end
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = true,
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = false,
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        -- LSP servers
        'lua-language-server',
        'vtsls',
        'vue-language-server',
        'eslint-lsp',
        'prisma-language-server',
        'json-lsp',
        'taplo',
        'dockerfile-language-server',
        'docker-compose-language-service',
        -- Formatters
        'stylua',
        'prettier',
      },
    })

    -- Enable servers explicitly (below) instead of auto-enabling whatever Mason
    -- happens to have installed. Keeps exactly one server per filetype, predictably.
    require('mason-lspconfig').setup({ automatic_enable = false })

    -- Lua
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    })
    vim.lsp.enable 'lua_ls'

    vim.lsp.enable 'ty'

    -- Vue - use Mason-managed language server
    local mason_packages = vim.fn.stdpath 'data' .. '/mason/packages'
    local vue_language_server_path = mason_packages
      .. '/vue-language-server/node_modules/@vue/language-server'
    local tsserver_filetypes =
      { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = tsserver_filetypes,
    }
    local vue_ls_config = {
      on_attach = function(client, bufnr)
        -- Disable semantic tokens for vue_ls to reduce false errors
        client.server_capabilities.semanticTokensProvider = nil
      end,
      settings = {
        vue = {
          inlayHints = {
            inlineHandlerLeading = false,
            missingProps = false,
            optionsWrapper = false,
          },
        },
      },
    }
    vim.lsp.config('vtsls', vtsls_config)
    vim.lsp.config('vue_ls', vue_ls_config)
    vim.lsp.enable({ 'vtsls', 'vue_ls' })

    -- ESLint: lint only. Prettier (via conform) owns formatting, so disable
    -- eslint-lsp's formatting to avoid EOF/newline conflicts, and run fixes on save.
    vim.lsp.config('eslint', {
      settings = { format = false },
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

    -- Servers that need no extra config beyond lspconfig's defaults
    vim.lsp.enable({
      'eslint',
      'prismals',
      'jsonls',
      'taplo',
      'dockerls',
      'docker_compose_language_service',
    })
  end,
}
