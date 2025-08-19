<img width="1448" height="1097" alt="Screenshot 2025-08-19 at 3 03 19 PM" src="https://github.com/user-attachments/assets/b2a476b2-547e-40f3-8f10-359b86137b35" />

This directory contains a Neovim configuration based on the "kickstart.nvim" template. It's designed to be a starting point for a personalized Neovim setup, offering a lean, minimalistic, and aesthetically pleasing environment without sacrificing productivity. Built on `lazy.nvim`, it provides a fast and efficient editing experience, focusing on essential plugins and sensible defaults.

## Project Overview

This is a Lua-based Neovim configuration. The main entry point is `init.lua`, which sets up basic Neovim options, keymaps, and then uses the `lazy.nvim` plugin manager to handle plugins.

The plugin configuration is modular, with some plugins defined directly in `init.lua` and others loaded from the `lua/kickstart/plugins/` and `lua/custom/plugins/` directories.

### Key Technologies:

- **Neovim:** The text editor.
- **Lua:** The primary configuration language.
- **lazy.nvim:** The plugin manager.

## Features

- **Minimalist Core:** Only includes what's necessary for a powerful editing experience.
- **Blazing Fast:** Optimized for quick startup and smooth performance, including optimized colorscheme loading.
- **Aesthetically Pleasing:** Thoughtfully chosen colorschemes and UI elements for a beautiful look, with customizable indentation guides.
- **Productivity Focused:** Keybindings and plugins are selected to enhance workflow efficiency.
- **Easily Extensible:** Simple to customize and add your own plugins without bloat.

## Building and Running

This is a configuration, not a standalone application, so there's no "build" process. To "run" it, you simply need to start Neovim.

**Prerequisites:**

- Neovim (latest stable version recommended)
- A Nerd Font (for icons in the UI)
- `git` in your `PATH`

**Installation:**

1.  Clone this repository to `~/.config/nvim`.
    ```bash
    git clone git@github.com:dhisonp/lazyvim.git ~/.config/nvim
    ```
2.  Start Neovim. `lazy.nvim` will automatically install the configured plugins.
    ```bash
    nvim
    ```

**Commands:**

- `:Lazy` - Open the `lazy.nvim` interface to manage plugins.
- `:Lazy update` - Update all plugins.
- `:checkhealth` - Diagnose any issues with Neovim or plugins.

## Keymaps

Here are some of the most frequently used keymaps:

| Keymap      | Description                    |
| :---------- | :----------------------------- |
| `<leader>q` | Open diagnostic Quickfix list  |
| `<leader>g` | Open Lazygit                   |
| `<C-h>`     | Move focus to the left window  |
| `<C-j>`     | Move focus to the lower window |
| `<C-k>`     | Move focus to the upper window |
| `<C-l>`     | Move focus to the right window |
| `<leader>f` | Find files (FzfLua)            |
| `<leader>/` | Live grep (FzfLua)             |
| `<C-i>`     | Format buffer (Conform)        |

## Development Conventions

### Coding Style

- The code is formatted with `stylua`. A `.stylua.toml` file is present to define the formatting rules.

### Plugin Management

- Plugins are managed through `lazy.nvim`.
- Plugin specifications are located in `init.lua` and the `lua/custom/plugins/` directory.
- The `lazy-lock.json` file ensures reproducible plugin versions.
- Linters and formatters are managed and installed via `mason.nvim`.

### Customization

- The configuration is designed to be extended by adding new files to the `lua/custom/plugins/` directory. Each file should return a `lazy.nvim` plugin specification.
