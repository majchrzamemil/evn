local opt = vim.opt
local g = vim.g

g.loaded_matchparen = 1
g.solarized_termcolors = 256
g.coc_disable_startup_warning = 1

opt.history = 700

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

opt.autoread = true

opt.scrolloff = 7

opt.wildmenu = true
opt.wildignore = { '*.o', '*~', '*.pyc' }
opt.ruler = true
opt.cmdheight = 2
opt.number = true
opt.relativenumber = true
opt.laststatus = 2

opt.hidden = true

opt.backspace = { 'eol', 'start', 'indent' }
opt.whichwrap:append('<,>,h,l')

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.magic = true
opt.showmatch = false

opt.termguicolors = false
opt.background = 'dark'
opt.encoding = 'utf8'

opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.linebreak = true
opt.textwidth = 120
opt.wrap = true

opt.clipboard = 'unnamedplus'

vim.cmd('colorscheme miramare')

opt.statusline = [[ %{v:lua.has_paste()}%F%m%r%h %w  CWD: %r%{getcwd()}%h   Line: %l]]

local keys = vim.api.nvim_replace_termcodes('A{<CR>}<Esc>ko', true, true, true)
vim.fn.setreg('b', keys, 'c')
