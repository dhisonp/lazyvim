return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('fzf-lua').setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          scrollbar = false,
        },
      },
      files = {
        cmd = 'fd --type f --hidden --follow --exclude .git',
        fzf_opts = { ['--algo'] = 'v2' },
      },
      grep = {
        cmd = 'rg --column --line-number --no-heading --color=always --smart-case --max-columns=4096',
        fzf_opts = { ['--algo'] = 'v2' },
      },
      fzf_opts = {
        ['--algo'] = 'v2',
        ['--no-scrollbar'] = true,
      },
    })
    require('fzf-lua').register_ui_select()
  end,
}
