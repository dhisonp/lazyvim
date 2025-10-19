return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup({
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      })
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
    end,
  },
  { 'ayu-theme/ayu-vim', lazy = true, priority = 1000 },
  { 'miikanissi/modus-themes.nvim', lazy = true, priority = 1000 },
  { 'rebelot/kanagawa.nvim', lazy = true, priority = 1000 },
}
