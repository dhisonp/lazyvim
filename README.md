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

| Command        | Description     |
| -------------- | --------------- |
| `:Lazy`        | Manage plugins  |
| `:checkhealth` | Diagnose issues |

## Treesitter Parsers

Parsers are automatically managed via `nvim-treesitter`. When you open a file, if the parser isn't installed, it will be automatically downloaded and compiled.

You can also specify exactly which parsers you always want available in `lua/plugins/treesitter.lua` under the `ensure_installed` array.

Formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — see `.stylua.toml`.
