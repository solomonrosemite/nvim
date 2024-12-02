return {
  'windwp/nvim-autopairs',
  cond = vim.g.vscode == nil,
  event = 'InsertEnter',
  config = true,
}
