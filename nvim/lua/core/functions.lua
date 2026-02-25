function _G.check_backspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_documentation()
  local ft = vim.bo.filetype
  if ft == 'vim' or ft == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn['coc#rpc#ready']() == 1 then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end

function _G.has_paste()
  if vim.o.paste then
    return 'PASTE MODE  '
  end
  return ''
end

function _G.delete_trailing_ws()
  local save_cursor = vim.fn.getpos('.')
  local save_search = vim.fn.getreg('/')
  vim.cmd([[%s/\s\+$//ge]])
  vim.fn.setpos('.', save_cursor)
  vim.fn.setreg('/', save_search)
end
