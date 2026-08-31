# Neovim Config

Personal Neovim configuration: [vim-plug](https://github.com/junegunn/vim-plug), three plugins,
native LSP. Deliberately close to vanilla Neovim — built-in mappings and defaults are preferred
over config wherever they do the job.

## Setup

```bash
git clone git@github.com:dhisonp/nvim-config.git ~/.config/nvim
nvim
```

vim-plug and all plugins install on first launch.

**Prerequisites:** Neovim 0.12+, a Nerd Font, a C compiler (for Treesitter parsers), `git`, `curl`,
`fd`, `ripgrep`, `fzf`.

## Structure

```
init.lua           # Leader, vim-plug bootstrap, plugin list, requires
lua/options.lua    # Editor options and diagnostic config
lua/keymaps.lua    # Keymaps
lua/plugins.lua    # Colorscheme, treesitter, fzf-lua
lua/autocmds.lua   # Autocommands (one)
lua/lsp.lua        # Language servers
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main`) | Syntax highlighting |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finding, `vim.ui.select` |
| [monokai.nvim](https://github.com/tanvirtin/monokai.nvim) | Colorscheme |

No plugin manager machinery beyond vim-plug: no Mason, no LSP installer, no completion plugin.

## Language servers

LSP is configured with Neovim's native `vim.lsp.config()` / `vim.lsp.enable()`. There is no
Mason and no `nvim-lspconfig`, so every server's `cmd` is spelled out explicitly in
`lua/lsp.lua`. Servers must be installed manually and be on `$PATH`.

The set mirrors `~/.config/helix/languages.toml`, so Helix and Neovim share one set of binaries:
`vtsls`, `eslint` (`vscode-eslint-language-server`), `ty`, `ruff`, `taplo`, `rust-analyzer`,
`yaml-language-server`, `lua-language-server`.

Most come from Homebrew; [`ty`](https://github.com/astral-sh/ty) via `uv tool install ty` and
`rust-analyzer` via `rustup`.

Formatting is LSP-only. The one exception is ESLint, which applies its fixes on `BufWritePre`
(see `lua/lsp.lua`); there is no `prettier` integration.

## Keymaps

`<leader>` is `<Space>`. Custom mappings are kept deliberately few — LSP navigation uses
Neovim's built-ins (`grr` references, `grn` rename, `gra` code action, `gri`, `grt`, `gO`,
`K` hover, `<C-]>` definition, `]d`/`[d` diagnostics, `<C-w>d` diagnostic float).

| Key | Action |
| --- | --- |
| `<leader>f` | Find files |
| `<leader>/` | Live grep |
| `<leader>b` | Buffers |
| `<leader>h` | Help tags |
| `<leader>d` | Workspace diagnostics |
| `<C-h/j/k/l>` | Window focus |
| `<C-n>` | Copy relative file path |
| `<Esc>` | Clear search highlight |

## Treesitter

Highlighting uses the `main` branch, which does not enable itself. The parser set is declared in
`lua/plugins.lua` via `require('nvim-treesitter').install({...})`, and the `FileType` autocmd in
`lua/autocmds.lua` calls `vim.treesitter.start()`. Add a language by appending its parser to that
list; run `:TSUpdate` to refresh installed parsers.

## Commands

| Command | Description |
| --- | --- |
| `:PlugInstall` / `:PlugUpdate` / `:PlugClean` | Manage plugins |
| `:TSUpdate` | Update Treesitter parsers |
| `:checkhealth` | Diagnose issues |

Formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — see `.stylua.toml`.
