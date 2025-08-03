return {
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "sainnhe/everforest",
    lazy = false,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
    end,
  },

  -- Set default color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      style = "night",
    },
  },
}
