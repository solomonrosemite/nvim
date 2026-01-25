return {
  'https://codeberg.org/andyg/leap.nvim',
  event = 'BufRead',
  config = function()
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
    vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
  end,
}
