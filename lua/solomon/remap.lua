vim.g.mapleader = ' '

-- Fix for this: https://neovim.discourse.group/t/how-do-i-use-space-as-the-leader-in-visual-mode/916/11
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- (Only needed for nvim v0.11)
-- Unbind default bindings of grr, gra, grn
-- https://github.com/neovim/neovim/pull/28650#discussion_r1612295598
-- alternative to proposed solution: nnoremap <nowait> gr gr
if vim.g.vscode == nil then
  -- vim.keymap.del('n', 'grr')
  -- vim.keymap.del('n', 'gra')
  -- vim.keymap.del('n', 'grn')
end

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', ',', ';')
vim.keymap.set('n', ';', ',')

-- Stop Vim from yanking visual selected text
vim.keymap.set('x', 'p', 'P')
-- vim.keymap.set('n', '<leader>p', '"0p')
-- vim.keymap.set('n', '<leader>P', '"0P')

vim.keymap.set('n', 'H', '<C-w>h')
vim.keymap.set('n', 'L', '<C-w>l')

vim.keymap.set('n', 'K', '<C-w>k')
vim.keymap.set('n', 'J', '<C-w>j')

vim.keymap.set('n', '<C-Right>', '<C-w>><C-w>>')
vim.keymap.set('n', '<C-Left>', '<C-w><<C-w><')

-- To to previous buffer and next buffer
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })

if vim.g.vscode == nil then
  vim.keymap.set('n', '<C-q>', ':q<CR>')
end

vim.keymap.set('n', '<leader>fr', ':%s/f/r/g')

vim.api.nvim_set_keymap('n', '<leader>cc', ':noh<CR>', { noremap = true, silent = true })

vim.cmd "command! -nargs=0 W execute 'w'"
vim.cmd [[cnoreabbrev Q q]]
vim.cmd [[cnoreabbrev Q! q!]]

function YankCommentAndPasteAbove()
  -- Comment the lines
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  require('Comment.api').toggle.linewise.count(end_line - start_line + 1)

  -- Paste the yanked content above the visual selection
  vim.cmd [[normal! O]]
  vim.cmd [[normal! P]]
end
vim.api.nvim_set_keymap('x', '<Leader>a', [[:<C-u>execute "'<,'>y | lua YankCommentAndPasteAbove()"<CR>]], { noremap = true })

-- Copy to clipboard from WSL
-- Source: https://vi.stackexchange.com/questions/42305/neovim-following-the-instructions-in-h-clipboard-wsl-not-work-it-shows-no
vim.keymap.set('v', '<C-c>', '"+y')
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'utf8clip.exe',
    ['*'] = 'utf8clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- Use lowercase for global marks and uppercase for local marks.
-- https://stackoverflow.com/a/77404322/13024474
local low = function(i)
  return string.char(97 + i)
end
local upp = function(i)
  return string.char(65 + i)
end

for i = 0, 25 do
  vim.keymap.set('n', 'm' .. low(i), 'm' .. upp(i))
end
for i = 0, 25 do
  vim.keymap.set('n', 'm' .. upp(i), 'm' .. low(i))
end
for i = 0, 25 do
  vim.keymap.set('n', "'" .. low(i), "'" .. upp(i))
end
for i = 0, 25 do
  vim.keymap.set('n', "'" .. upp(i), "'" .. low(i))
end
