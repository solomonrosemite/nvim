return {
  'tpope/vim-fugitive',
  commit = 'b068eaf1e6cbe35d1ac100d435cd7f7b74a5c87d',
  dependencies = {
    'shumphrey/fugitive-gitlab.vim',
    'tpope/vim-rhubarb',
  },
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    vim.keymap.set('n', '<leader>gap', ':Git add -p<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gaa', ':Git add -A<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gdd', ':Git diff<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gdc', ':Git diff --cached<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gcc', ':Git commit<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gtp', ':!~/.dotfiles/scripts/.config/scripts/increment_tag_push.sh<CR>', { noremap = true, silent = true })
    vim.keymap.set(
      'n',
      '<leader>gco',
      ':silent !zellij run -c --name "change branch" --floating -- ~/.dotfiles/scripts/.config/scripts/extra/zellij_vimfugitive_change_branch.sh<CR>',
      { noremap = true, silent = true }
    )
  end,
}
