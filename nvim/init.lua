-- Leader key must be set before lazy.nvim loads plugins
vim.g.mapleader = ','

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Helper functions (must load before options, which uses has_paste in statusline)
require('core.functions')

-- Core settings
require('core.options')

-- Plugins
require('lazy').setup('plugins')

-- Keymaps and autocommands
require('core.keymaps')
require('core.autocmds')
