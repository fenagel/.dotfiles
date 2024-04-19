vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set('n', '<Esc>', '<esc>:nohlsearch<CR>', { silent = true })

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
-- keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
-- keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
-- keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
-- keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

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

-- Fast saving
keymap.set('n', '<Leader>w', ':write!<CR>', opts)
keymap.set('n', '<Leader>q', ':q!<CR>', opts)

-- Better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- write file in current directory
-- :w %:h/<new-file-name>
keymap.set('n', '<C-n>', ':w %:h/', opts)

-- Select all
keymap.set('n', '<c-s>', 'ggVG', opts)

-- Move to start/end of line
keymap.set({ 'n', 'x', 'o' }, 'H', '^', opts)
keymap.set({ 'n', 'x', 'o' }, 'L', 'g_', opts)

-- Replace all instances of highlighted words
-- keymap.set('v', '<leader>rr', '"hy:%s/<C-r>h//g<left><left>')

-- Move Lines
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

--------------
-- obsidian --
--------------
--
-- >>> oo # from shell, navigate to vault (optional)
--
-- # NEW NOTE
-- >>> on "Note Name" # call my "obsidian new note" shell script (~/bin/on)
-- >>>
-- >>> ))) <leader>on # inside vim now, format note as template
-- >>> ))) # add tag, e.g. fact / blog / video / etc..
-- >>> ))) # add hubs, e.g. [[python]], [[machine-learning]], etc...
-- >>> ))) <leader>of # format title
--
-- # END OF DAY/WEEK REVIEW
-- >>> or # review notes in inbox
-- >>>
-- >>> ))) <leader>ok # inside vim now, move to zettelkasten
-- >>> ))) <leader>odd # or delete
-- >>>
-- >>> og # organize saved notes from zettelkasten into notes/[tag] folders
-- >>> ou # sync local with Notion
--
-- navigate to vault
--/Users/fenagel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain
keymap.set('n', '<leader>oo', ':cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain<cr>')
--
-- convert note to template and remove leading white space
keymap.set('n', '<leader>on', ':ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>')
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>')
--
-- search for files in full vault
keymap.set('n', '<leader>os', ':Telescope find_files search_dirs={"$HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain"}<cr>')
keymap.set('n', '<leader>oz', ':Telescope live_grep search_dirs={"$HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain"}<cr>')
--
-- search for files in notes (ignore zettelkasten)
-- vim.keymap.set("n", "<leader>ois", ":Telescope find_files search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
-- vim.keymap.set("n", "<leader>oiz", ":Telescope live_grep search_dirs={\"/Users/alex/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/ZazenCodes/notes\"}<cr>")
--
-- for review workflow
-- move file in current buffer to zettelkasten folder
keymap.set('n', '<leader>ok', ":!mv '%:p' $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain/zettelkasten<cr>:bd<cr>")
-- delete file in current buffer
keymap.set('n', '<leader>odd', ":!rm '%:p'<cr>:bd<cr>")
