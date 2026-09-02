# Neovim Config

Personal Neovim configuration built on [vim-plug](https://github.com/junegunn/vim-plug) and
native LSP. Deliberately close to vanilla Neovim — built-in mappings and defaults are preferred
over config wherever they do the job. No Mason, no LSP installer, no completion plugin: what's
here is spelled out explicitly rather than layered behind a framework.

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
lua/autocmds.lua   # Autocommands
lua/lsp.lua        # Language servers
```

Language servers are configured with Neovim's native `vim.lsp.config()` / `vim.lsp.enable()`
rather than `nvim-lspconfig`, so every server's `cmd` is spelled out in `lua/lsp.lua` and must be
installed manually and be on `$PATH`. Formatting is LSP-only, with one exception noted inline in
that file.

Treesitter parsers are declared in `lua/plugins.lua` and started per-buffer from an autocommand
in `lua/autocmds.lua`.

Formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — see `.stylua.toml`.
