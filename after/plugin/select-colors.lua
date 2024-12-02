local function set()
  -- not necessary?
  -- vim.o.background = 'dark'
  -- vim.cmd.hi 'Comment gui=none'

  -- vim.cmd 'colorscheme tokyonight-night'
  -- vim.cmd 'colorscheme oxocarbon'
  -- vim.cmd 'colorscheme vscode'
  vim.cmd 'colorscheme catppuccin-mocha'
  -- vim.cmd 'colorscheme rose-pine'
  -- require('onedark').load()

  -- you may choose one of the 2 flashbangs
  -- vim.cmd 'colorscheme tokyonight-day'
  -- vim.cmd 'colorscheme catppuccin-latte'
end

vim.g.custom_colorscheme_set = set
vim.g.custom_colorscheme_transparent = true
