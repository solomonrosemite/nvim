local function text()
  -- return [[🍃 ]]
  return [[🌸]]
  -- return [[🌸 ]]
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },

      -- lualine_x = {},
      lualine_x = { 'fileformat', text, 'encoding' },

      -- lualine_y = { 'encoding' },
      lualine_y = {},

      -- lualine_z = {},
      lualine_z = { 'filetype' },
    },
  },
}
