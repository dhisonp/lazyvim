# Neovim Configuration

This directory contains a Neovim configuration based on the "kickstart.nvim" template. It's designed to be a starting point for a personalized Neovim setup.

## Project Overview

This is a Lua-based Neovim configuration. The main entry point is `init.lua`, which sets up basic Neovim options, keymaps, and then uses the `lazy.nvim` plugin manager to handle plugins.

The plugin configuration is modular, with some plugins defined directly in `init.lua` and others loaded from the `lua/kickstart/plugins/` and `lua/custom/plugins/` directories.

### Key Technologies:

*   **Neovim:** The text editor.
*   **Lua:** The primary configuration language.
*   **lazy.nvim:** The plugin manager.

## Building and Running

This is a configuration, not a standalone application, so there's no "build" process. To "run" it, you simply need to start Neovim.

**Prerequisites:**

*   Neovim (latest stable version recommended)
*   A Nerd Font (for icons in the UI)
*   `git` in your `PATH`

**Installation:**

1.  Clone this repository to `~/.config/nvim`.
2.  Start Neovim. `lazy.nvim` will automatically install the configured plugins.

**Commands:**

*   `:Lazy` - Open the `lazy.nvim` interface to manage plugins.
*   `:Lazy update` - Update all plugins.
*   `:checkhealth` - Diagnose any issues with Neovim or plugins.

## Development Conventions

### Coding Style

*   The code is formatted with `stylua`. A `.stylua.toml` file is present to define the formatting rules.

### Plugin Management

*   Plugins are managed through `lazy.nvim`.
*   Plugin specifications are located in `init.lua` and the `lua/custom/plugins/` directory.
*   The `lazy-lock.json` file ensures reproducible plugin versions.

### Customization

*   The configuration is designed to be extended by adding new files to the `lua/custom/plugins/` directory. Each file should return a `lazy.nvim` plugin specification.
