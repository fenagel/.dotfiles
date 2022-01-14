vim.cmd[[colorscheme gruvbox]]
-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override
--vim.cmd 'au ColorScheme * hi! Normal guibg=none'
vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guifg=#5eacd3'
vim.cmd 'au ColorScheme * hi! netrwDir guifg=#5eacd3'
vim.g.gruvbox_invert_selection = '0'
