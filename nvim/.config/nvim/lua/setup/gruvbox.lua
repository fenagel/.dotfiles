vim.cmd[[colorscheme gruvbox]]
-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override
--vim.cmd 'au ColorScheme * hi! Normal guibg=none'
vim.g.gruvbox_invert_selection = '0'
