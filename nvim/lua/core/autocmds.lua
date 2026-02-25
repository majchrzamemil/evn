local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Trailing whitespace cleanup for Rust and C++
local cleanup = augroup('TrailingWhitespace', { clear = true })
autocmd('BufWritePre', {
  group = cleanup,
  pattern = { '*.rs', '*.cpp' },
  callback = _G.delete_trailing_ws,
})

-- Policy filetype detection
local policy = augroup('PolicyFiletype', { clear = true })
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = policy,
  pattern = '*.pol',
  callback = function()
    vim.bo.filetype = 'policy'
  end,
})

-- NERDTree: open on startup (unless git commit)
local nerdtree = augroup('NERDTreeStartup', { clear = true })
autocmd('VimEnter', {
  group = nerdtree,
  callback = function()
    if vim.bo.filetype ~= 'gitcommit' then
      vim.cmd('NERDTree')
    end
  end,
})

-- NERDTree: close vim if it's the last window
autocmd('BufEnter', {
  group = nerdtree,
  pattern = '*',
  command = 'if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | quit | endif',
})
