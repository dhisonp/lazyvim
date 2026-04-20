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
}
