local map = vim.keymap.set

-- Window resizing
map('', '<C-left>', ':vertical resize -5<CR>')
map('', '<C-right>', ':vertical resize +5<CR>')
map('', '<C-up>', ':resize +5<CR>')
map('', '<C-down>', ':resize -5<CR>')

-- Window navigation
map('', '<M-down>', '<C-W>j')
map('', '<M-up>', '<C-W>k')
map('', '<M-left>', '<C-W>h')
map('', '<M-right>', '<C-W>l')

-- Tab navigation
map('', '<M-PAGEUP>', ':tabprevious<CR>')
map('', '<M-PAGEDOWN>', ':tabnext<CR>')

-- Search
map('', '<space>', '/')
map('', '<c-space>', '?')

-- Visual mode: search for selection
map('v', '*', function()
  local saved = vim.fn.getreg('v')
  vim.cmd('normal! "vy')
  local pattern = '\\V' .. vim.fn.escape(vim.fn.getreg('v'), '/\\')
  vim.fn.setreg('/', pattern)
  vim.cmd('normal! n')
  vim.fn.setreg('v', saved)
end, { silent = true })

map('v', '#', function()
  local saved = vim.fn.getreg('v')
  vim.cmd('normal! "vy')
  local pattern = '\\V' .. vim.fn.escape(vim.fn.getreg('v'), '?\\')
  vim.fn.setreg('/', pattern)
  vim.cmd('normal! N')
  vim.fn.setreg('v', saved)
end, { silent = true })

-- FZF
map('', '<C-S>', ':Ag<CR>')
map('', '<C-H>', ':Files<CR>')
map('', '<leader>h', ':Files<CR>')
map('', '<leader>u', ':Buffers<CR>')

-- Undotree
map('n', '<F5>', ':UndotreeToggle<CR>')
