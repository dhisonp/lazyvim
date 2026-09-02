# Neovim Config

Personal Neovim config on the built-in plugin manager
([vim.pack](https://neovim.io/doc/user/pack/#vim.pack)) and native LSP. Deliberately close to
vanilla: built-ins are preferred over config wherever they do the job, no Mason or completion
plugin hides what is happening, and nothing is wrapped in `pcall` — four plugins is few enough
that a broken one should say so.

```bash
git clone git@github.com:dhisonp/nvim-config.git ~/.config/nvim
nvim
```

```
init.lua            # Leader, plugin list (vim.pack), requires
lua/options.lua     # Editor options and diagnostic config
lua/keymaps.lua     # Keymaps
lua/autocmds.lua    # Autocommands
lua/lsp.lua         # Language servers, formatting (:Fmt)
lua/plugins.lua     # Colorscheme, treesitter, fzf-lua, gitsigns
```

Plugins install on first launch, pinned by `nvim-pack-lock.json`; update with
`:lua vim.pack.update()` (review, then `:write`). Each server's `cmd` and `settings` are spelled
out in `lua/lsp.lua` rather than pulled from `nvim-lspconfig`, so servers are installed manually —
`:checkhealth vim.lsp` names any that are missing. Plugin setup is deferred off the startup path;
treesitter parsers are declared in `lua/plugins.lua` and started per-buffer from
`lua/autocmds.lua`.

**Needs:** Neovim 0.12+, a Nerd Font, a C compiler, `git`, `fd`, `ripgrep`, `fzf`. Formatted with
[StyLua](https://github.com/JohnnyMorganz/StyLua).
