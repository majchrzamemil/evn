return {
  'neoclide/coc.nvim',
  branch = 'release',
  event = 'VimEnter',
  config = function()
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

    -- TAB: trigger completion and navigate
    vim.keymap.set('i', '<TAB>',
      [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "\<Tab>" : coc#refresh()]],
      opts)
    vim.keymap.set('i', '<S-TAB>',
      [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
      opts)

    -- CR: confirm completion
    vim.keymap.set('i', '<CR>',
      [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
      opts)

    -- Trigger completion
    vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

    -- GoTo navigation
    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
    vim.keymap.set('n', 'ca', '<Plug>(coc-codeaction-cursor)', { silent = true })
    vim.keymap.set('n', 'rn', '<Plug>(coc-rename)', { silent = true })

    -- Diagnostics and docs
    vim.keymap.set('n', 'cd', ':CocDiagnostics<CR>', { silent = true })
    vim.keymap.set('n', 'od', ':CocCommand rust-analyzer.openDocs<CR>', { silent = true })

    -- Documentation with K
    vim.keymap.set('n', 'K', _G.show_documentation, { silent = true })

    -- Format command
    vim.api.nvim_create_user_command('F', function()
      vim.fn.CocAction('format')
    end, {})

    -- Float window scrolling
    local scroll_opts = { silent = true, nowait = true, expr = true }
    vim.keymap.set('n', '<C-f>',
      [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
      scroll_opts)
    vim.keymap.set('n', '<C-b>',
      [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
      scroll_opts)
    vim.keymap.set('i', '<C-f>',
      [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]],
      { silent = true, nowait = true, expr = true, replace_keycodes = false })
    vim.keymap.set('i', '<C-b>',
      [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]],
      { silent = true, nowait = true, expr = true, replace_keycodes = false })
    vim.keymap.set('v', '<C-f>',
      [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
      scroll_opts)
    vim.keymap.set('v', '<C-b>',
      [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
      scroll_opts)
  end,
}
