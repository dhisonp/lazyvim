# Neovim Config

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Setup

```bash
git clone git@github.com:dhisonp/lazyvim.git ~/.config/nvim
nvim
```

Plugins install automatically on first launch.

**Prerequisites:** Neovim 0.12+, a Nerd Font, `git`, `fd`, `ripgrep`

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

| Command        | Description             |
| -------------- | ----------------------- |
| `:Lazy`        | Manage plugins          |
| `:checkhealth` | Diagnose issues         |

## Treesitter Parsers

Bundled parsers (lua, vim, vimdoc, markdown, query, c) work out of the box. Install others with the built-in API:

```vim
" Single parser
:lua vim.treesitter.install('python')

" Multiple parsers
:lua for _, p in ipairs({'python', 'javascript', 'css'}) do vim.treesitter.install(p) end
```

Formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — see `.stylua.toml`.