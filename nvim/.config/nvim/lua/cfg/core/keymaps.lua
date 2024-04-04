vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set('n', '<Esc>', '<esc>:nohlsearch<CR>', { silent = true })
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keep cursor centered when scrolling
local opts = { noremap = true, silent = true }
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-u>', '<C-u>zz', opts)
keymap.set('n', 'n', 'nzz', opts)
keymap.set('n', 'N', 'Nzz', opts)
keymap.set('n', '*', '*zz', opts)
keymap.set('n', '#', '#zz', opts)
keymap.set('n', 'g*', 'g*zz', opts)
keymap.set('n', 'g#', 'g#zz', opts)

-- Select all
keymap.set('n', '<c-s>', 'ggVG', opts)

-- Move to start/end of line
keymap.set({ 'n', 'x', 'o' }, 'H', '^', opts)
keymap.set({ 'n', 'x', 'o' }, 'L', 'g_', opts)

-- Replace all instances of highlighted words
keymap.set('v', '<leader>rr', '"hy:%s/<C-r>h//g<left><left>')

-- Move Lines
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
