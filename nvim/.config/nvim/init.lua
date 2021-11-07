local vim = vim

local o = vim.o
local bo = vim.bo
local wo = vim.wo
local opt = vim.opt
local g = vim.g

g.mapleader = " "

vim.cmd[[colorscheme gruvbox]]

--vim.cmd 'au ColorScheme * hi! Normal guibg=none'
vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false
  }
)

opt.wildignore = { '*.pyc', '*_build', '**/node_modules', '**/.git/', '**/coverage/', '**/android/', '**/ios/' }

opt.termguicolors = true
opt.syntax = 'on'
opt.errorbells = false
opt.smartcase = true
opt.showmode = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath('config') .. '/undodir'
opt.undofile = true
opt.incsearch = true
opt.hlsearch = false
opt.cmdheight = 1
opt.updatetime = 50
opt.colorcolumn = '80'
opt.clipboard = 'unnamedplus'
opt.hidden = true
opt.completeopt='menuone,noinsert,noselect'
opt.autoindent = true
opt.smartindent = true
opt.shortmess = 'c'
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.scrolloff = 8
opt.expandtab = true
opt.number = true -- display line numbers
opt.relativenumber = true -- display relative line numbers
opt.signcolumn = 'yes'
opt.wrap = false 

opt.syntax = 'on'

require("fenagel")
