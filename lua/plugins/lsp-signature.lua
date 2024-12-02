return {
  'ray-x/lsp_signature.nvim',
  cond = vim.g.vscode == nil,
  event = 'VeryLazy',
  opts = {
    hint_enable = false,
  },
  config = function(_, opts)
    require('lsp_signature').setup(opts)
  end,
}
