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
  { 'ayu-theme/ayu-vim', lazy = true, priority = 1000 },
  { 'miikanissi/modus-themes.nvim', lazy = true, priority = 1000 },
  { 'rebelot/kanagawa.nvim', lazy = true, priority = 1000 },
}
