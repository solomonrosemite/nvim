vim.keymap.set('n', '<leader>fm', ':silent !zellij run -c --name "makefile" --floating -- fzf-make<CR>', { noremap = true, silent = true })
