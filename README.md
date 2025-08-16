# Lean & Productive Neovim Setup

This Neovim configuration is designed for developers who value a **lean, minimalistic, and aesthetically pleasing** environment without sacrificing **productivity**. Built on `lazy.nvim`, it provides a fast and efficient editing experience, focusing on essential plugins and sensible defaults.

## Features

*   **Minimalist Core:** Only includes what's necessary for a powerful editing experience.
*   **Blazing Fast:** Optimized for quick startup and smooth performance.
*   **Aesthetically Pleasing:** Thoughtfully chosen colorschemes and UI elements for a beautiful look.
*   **Productivity Focused:** Keybindings and plugins are selected to enhance workflow efficiency.
*   **Easily Extensible:** Simple to customize and add your own plugins without bloat.

## Installation

1.  **Backup (Optional):** If you have an existing Neovim configuration, back it up:
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```
2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/.config/nvim
    ```
    *(Remember to replace `YOUR_USERNAME/YOUR_REPO_NAME` with the actual path to your cloned repository.)*
3.  **Start Neovim:**
    ```bash
    nvim
    ```
    `lazy.nvim` will automatically install all the necessary plugins on first launch.

## Usage

Just open Neovim and start coding! Explore the `lua/config/keymaps.lua` file for default keybindings.

## Customization

This setup is designed to be a starting point. You can easily add your own plugins and configurations in the `lua/custom/plugins/` directory. Each file in this directory should return a `lazy.nvim` plugin specification.