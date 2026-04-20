-- Neovim 0.12+ built-in treesitter setup

local parsers = {
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
}

-- Auto-install parsers
for _, lang in ipairs(parsers) do
  vim.schedule(function()
    local ok = pcall(vim.treesitter.language.add, lang)
    if not ok then
      vim.treesitter.install(lang)
    end
  end)
end

-- Map parser names to filetypes where they differ
local ft_patterns = {}
local ft_map = {
  bash = { 'sh', 'bash', 'zsh' },
  vimdoc = { 'help' },
}

for _, lang in ipairs(parsers) do
  local fts = ft_map[lang]
  if fts then
    for _, ft in ipairs(fts) do
      table.insert(ft_patterns, ft)
    end
  elseif lang ~= 'markdown_inline' and lang ~= 'luadoc' then
    table.insert(ft_patterns, lang)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = ft_patterns,
  callback = function(args)
    vim.treesitter.start(args.buf, args.match)
  end,
})

vim.api.nvim_create_user_command('TSInstall', function(opts)
  vim.treesitter.install(opts.args)
end, {
  nargs = 1,
  desc = 'Install a treesitter parser',
})
