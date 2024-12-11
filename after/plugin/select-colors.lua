local function set()
  -- not necessary?
  -- vim.o.background = 'dark'
  -- vim.cmd.hi 'Comment gui=none'

  -- vim.cmd 'colorscheme tokyonight-night'
  -- vim.cmd 'colorscheme oxocarbon'
  -- vim.cmd 'colorscheme vscode'
  -- vim.cmd 'colorscheme catppuccin-mocha'
  -- vim.cmd 'colorscheme rose-pine'
  -- vim.cmd 'colorscheme arctic' -- better vs code dark+ theme
  require('onedark').load()

  -- you may choose one of the 3 flashbangs
  -- vim.cmd 'colorscheme visual_studio_code'
  -- vim.cmd 'colorscheme tokyonight-day'
  -- vim.cmd 'colorscheme catppuccin-latte'
end

vim.g.custom_colorscheme_set = set
vim.g.custom_colorscheme_transparent = true
