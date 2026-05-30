# Neovim Config

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Setup

```bash
git clone git@github.com:dhisonp/lazyvim.git ~/.config/nvim
nvim
```

Plugins install automatically on first launch.

**Prerequisites:** Neovim 0.12+, a Nerd Font, a C compiler (for Treesitter parsers), `git`, `fd`, `ripgrep`

LSP servers and formatters are installed automatically via Mason (see `lua/plugins/mason.lua`).
The Python language server [`ty`](https://github.com/astral-sh/ty) is the one exception — install
it separately (e.g. `uv tool install ty`) so it is available on `PATH`.

## Structure

```
init.lua                  # Entry point
lua/config/options.lua   # Editor options
lua/config/keymaps.lua   # Keymaps
lua/config/autocmds.lua  # Autocommands
lua/config/lazy.lua      # Plugin manager setup
lua/plugins/              # Plugin specs (one file per plugin)
```

## Commands

| Command        | Description     |
| -------------- | --------------- |
| `:Lazy`        | Manage plugins  |
| `:checkhealth` | Diagnose issues |

## Treesitter

Highlighting uses the `main` branch of `nvim-treesitter`. The parser set is declared
explicitly in `lua/plugins/treesitter.lua` via `require('nvim-treesitter').install({...})`
and a `FileType` autocmd calls `vim.treesitter.start()` to enable highlighting wherever a
parser is available. Add a language by appending its parser to that list; run `:TSUpdate`
to refresh installed parsers.

Formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — see `.stylua.toml`.
