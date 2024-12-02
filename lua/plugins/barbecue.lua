return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  cond = vim.g.vscode == nil,
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('barbecue').setup {
      include_buftypes = { 'oil', 'acwrite', '' },
      modifiers = {
        dirname = ':p:~',
      },
    }
  end,
}
