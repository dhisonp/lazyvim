-- Neovim 0.12+ built-in treesitter setup (replaces nvim-treesitter)
-- nvim-treesitter is archived as of April 2026; this uses Neovim's built-in API

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

-- Install parsers on first run (idempotent - skips if already installed)
for _, lang in ipairs(parsers) do
  vim.schedule(function()
    local ok, installed = pcall(vim.treesitter.language.add, lang)
    if not ok then
      -- Parser not installed, try to install it
      vim.notify('Installing treesitter parser: ' .. lang, vim.log.levels.INFO)
      vim.treesitter.install(lang)
    end
  end)
end

-- Build flat list of filetypes to trigger treesitter highlighting
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
  else
    -- Skip parsers that don't have standalone filetypes (markdown_inline, luadoc)
    if lang ~= 'markdown_inline' and lang ~= 'luadoc' then
      table.insert(ft_patterns, lang)
    end
  end
end

-- Enable syntax highlighting via filetype autocmd
-- vim.treesitter.start() enables highlighting for the current buffer
vim.api.nvim_create_autocmd('FileType', {
  pattern = ft_patterns,
  callback = function(args)
    -- Don't start if buffer is large (performance)
    local max_filesize = 100 * 1024 -- 100KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > max_filesize then
      return
    end

    -- Try to start treesitter highlighting
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      lang = args.match
    end

    pcall(vim.treesitter.start, args.buf, lang)
  end,
})

-- Create :TSInstall command for manual parser installation
vim.api.nvim_create_user_command('TSInstall', function(opts)
  local lang = opts.args
  if lang == '' then
    vim.notify('Usage: :TSInstall <language>', vim.log.levels.WARN)
    return
  end
  vim.notify('Installing treesitter parser: ' .. lang, vim.log.levels.INFO)
  vim.treesitter.install(lang)
end, {
  nargs = 1,
  complete = function()
    -- Return list of available parser names
    return {
      'bash', 'c', 'cpp', 'css', 'go', 'html', 'javascript', 'json', 'lua',
      'markdown', 'markdown_inline', 'python', 'query', 'rust', 'tsx',
      'typescript', 'vim', 'vimdoc', 'yaml',
    }
  end,
  desc = 'Install a treesitter parser (built-in Neovim 0.12+)',
})
