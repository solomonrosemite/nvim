local transparent = vim.g.custom_colorscheme_transparent
local set_colors = vim.g.custom_colorscheme_set

require('catppuccin').setup {
  transparent_background = transparent,
  background = {
    light = 'latte',
    dark = 'mocha',
  },
}

require('onedark').setup {
  transparent = transparent,
  -- style = 'light',
  -- style = 'darker',
  style = 'warmer',
  lualine = {
    transparent = transparent,
  },
}

require('tokyonight').setup {
  transparent = transparent,
  style = 'moon',
  light_style = 'day',
}

set_colors()

if transparent then
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
