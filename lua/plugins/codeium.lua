return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  requires = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  cond = function()
    local cwd = vim.fn.expand '%:p:h'
    local work_dir = vim.fn.expand '~' .. '/work'
    return vim.g.vscode == nil and not cwd:find(work_dir, 1, true) and false -- temporarily disabled. remove false
  end,
}
