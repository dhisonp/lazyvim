return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
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
  {
    'sainnhe/sonokai',
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      -- vim.g.sonokai_style = 'maia'
    end,
  },
  { 'miikanissi/modus-themes.nvim', lazy = true, priority = 1000 },
}
