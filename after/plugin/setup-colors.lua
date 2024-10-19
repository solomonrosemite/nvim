local transparent = vim.g.custom_colorscheme_transparent
local set_colors = vim.g.custom_colorscheme_set

if transparent then
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

require('catppuccin').setup {
  transparent_background = transparent,
}

require('onedark').setup {
  transparent = transparent,
  style = 'darker',
  lualine = {
    transparent = transparent,
  },
}

require('tokyonight').setup {
  transparent = transparent,
}

set_colors()
