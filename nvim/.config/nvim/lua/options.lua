local opt = vim.opt -- to set options
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.errorbells = false
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable background buffers
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
vim.o.lazyredraw = true
opt.number = true -- Show line numbers
opt.list = true -- Show some invisible characters
opt.listchars = { tab = " ", trail = "·" }
opt.relativenumber = true
opt.scrolloff = 7 -- Lines of context
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess = "c"
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.colorcolumn = '80'
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en_gb" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.swapfile = false
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.wrap = false
opt.mouse = "a"
opt.guicursor = ""
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.undofile = true

-- vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! Normal ctermbg=none'
-- Transparent LSP Float Windows
vim.cmd 'au ColorScheme * highlight! normalfloat guibg=none'
vim.cmd 'au ColorScheme * highlight! errorfloat guibg=none'
vim.cmd 'au ColorScheme * highlight! warningfloat guibg=none'
vim.cmd 'au ColorScheme * highlight! infofloat guibg=none'
vim.cmd 'au ColorScheme * highlight! hintfloat guibg=none'
vim.cmd 'au ColorScheme * highlight! FloatBorder guifg=#aaaaaa guibg=NONE'
