return {
  'icedman/nvim-textmate',
  build = 'make',
  config = function()
    require('nvim-textmate').setup({
      extension_paths = {
        vim.fn.expand('~/go/src/gitlab.com/zeropw/zero/policy-lang-import/tools/vscode/policy/')
      },
      filetype_to_grammar = {
        policy = 'source.policy'
      }
    })
  end,
}
