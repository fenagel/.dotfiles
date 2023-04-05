print("Welcome Felix! How are you doing today?")

vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  "ellisonleao/gruvbox.nvim",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    tag = "0.1.1",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons"
  },
  "fatih/vim-go",
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'L3MON4D3/LuaSnip' },                  -- Required
      "hrsh7th/cmp-buffer",                    -- Optional
      "hrsh7th/cmp-path",                      -- Optional
      "saadparwaiz1/cmp_luasnip",              -- Optional
      "rafamadriz/friendly-snippets",          -- Optional
      { "onsails/lspkind-nvim", dependencies = "famiu/bufdelete.nvim" },
    }
  },
  { 'akinsho/toggleterm.nvim',         version = "*",    config = true },
  "terrortylor/nvim-comment",
  "ThePrimeagen/harpoon",
  "github/copilot.vim",
})

-- some
vim.keymap.set("n", "<M-b>", ":Ex<CR>")

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>f", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
    winblend = 10,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>p", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
-- Search and replace word under cursor
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Quick new file
vim.keymap.set("n", "<Leader>n", "<cmd>enew<CR>")
-- Easy select all of file
vim.keymap.set("n", "<Leader>sa", "ggVG<c-$>")
-- Maintain the cursor position when yanking a visual selection
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")
-- Keep search results centred
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--After searching, pressing escape stops the highlight
vim.keymap.set("n", "<esc>", ":noh<cr><esc>", { silent = true })
vim.keymap.set("", "<leader>w", ":w<CR>")
vim.keymap.set("", "<leader>q", ":q<CR>")
-- GO error boiler plate macro
vim.keymap.set("n", "<leader>e", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])
-- Harpoon
local silent = { silent = true }
vim.keymap.set("n", "<leader>a", function()
  require("harpoon.mark").add_file()
end, silent)
vim.keymap.set("n", "<C-e>", function()
  require("harpoon.ui").toggle_quick_menu()
end, silent)
vim.keymap.set("n", "<C-h>", function()
  require("harpoon.ui").nav_file(1)
end, silent)
vim.keymap.set("n", "<C-j>", function()
  require("harpoon.ui").nav_file(2)
end, silent)
vim.keymap.set("n", "<C-k>", function()
  require("harpoon.ui").nav_file(3)
end, silent)
vim.keymap.set("n", "<C-l>", function()
  require("harpoon.ui").nav_file(4)
end, silent)

-- CMP
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  mapping = {
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "",
        cmp_tabnine = "9",
        nvim_lsp = "",
        spell = "",
        look = "",
      },
    })
  }
})

-- Lualine
local function getWords()
  if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
    if vim.fn.wordcount().visual_words == 1 then
      return tostring(vim.fn.wordcount().visual_words) .. " word"
    elseif not (vim.fn.wordcount().visual_words == nil) then
      return tostring(vim.fn.wordcount().visual_words) .. " words"
    else
      return tostring(vim.fn.wordcount().words) .. " words"
    end
  else
    return ""
  end
end

-- local lineNum = vim.api.nvim_win_get_cursor(0)[1]
local function getLines()
  return tostring(vim.api.nvim_win_get_cursor(0)[1]) .. "/" .. tostring(vim.api.nvim_buf_line_count(0))
end

local function getColumn()
  local val = vim.api.nvim_win_get_cursor(0)[2]
  -- pad value to 3 units to stop geometry shift
  return string.format("%03d", val)
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    globalstatus = true,
    theme = "gruvbox",
    component_separators = { " ", " " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        source = diff_source,
        color_added = "#a7c080",
        color_modified = "#ffdf1b",
        color_removed = "#ff6666",
      },
    },
    lualine_c = {
      { "diagnostics", sources = { "nvim_diagnostic" } },
      function()
        return "%="
      end,
      "filename",
      {
        getWords,
        color = { fg = "#333333", bg = "#eeeeee" },
        separator = { left = "", right = "" },
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {},
    lualine_z = {
      { getColumn, padding = { left = 1, right = 0 } },
      { getLines,  icon = "",                     padding = 1 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "quickfix",
  },
})

-- Telescope
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    prompt_prefix = "> ",
    color_devicons = true,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next,     -- move to next result
      },
    },
  },
})
-- TREESITTER
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "go", "javascript", "typescript", "rust" },
  highlight = {
    enable = true,
  },
})

-- GRUVBOX
require("gruvbox").setup({
  contrast = "hard",
  palette_overrides = {
    gray = "#2ea542",
  },
})

-- LUALINE
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "gruvbox",
    component_separators = "|",
    section_separators = "",
  },
})

-- LSP
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "gopls",
  "eslint",
  "volar",
  "rust_analyzer",
})

lsp.set_preferences({
  sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
end)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = false,
  virtual_text = true,
  underline = false,
})

-- COMMENT
require("nvim_comment").setup({
  operator_mapping = "<leader>/",
})

-- TERMINAL SETUP
require("toggleterm").setup({
  direction = "horizontal",
  size = 15,
  open_mapping = [[<M-j>]],
})

-- COLORSCHEME
vim.cmd("colorscheme gruvbox")
-- Adding the same comment color in each theme
vim.cmd([[
	augroup CustomCommentCollor
		autocmd!
		autocmd VimEnter * hi Comment guifg=#2ea542
	augroup END
]])
vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
vim.cmd 'au ColorScheme * hi! Normal ctermbg=none'
-- Transparent LSP Float Windows
-- vim.cmd 'au ColorScheme * hi! Pmenu guibg=none'
-- vim.cmd 'au ColorScheme * hi! NormalFloat guibg=none'
-- vim.cmd 'au ColorScheme * hi! ErrorFloat guibg=none'
-- vim.cmd 'au ColorScheme * hi! WarningFloat guibg=none'
-- vim.cmd 'au ColorScheme * hi! InfoFloat guibg=none'
-- vim.cmd 'au ColorScheme * hi! HintFloat guibg=none'
-- vim.cmd 'au ColorScheme * hi! FloatBorder guifg=#aaaaaa guibg=NONE'

-- Disable annoying match brackets and all the jaz
-- vim.cmd([[
-- 	augroup CustomHI
-- 		autocmd!
-- 		autocmd VimEnter * NoMatchParen
-- 	augroup END
-- ]])

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  pattern = "*",
})
-- HighlightYank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

vim.o.background = "dark"

vim.keymap.set("i", "jj", "<Esc>")

vim.opt.guicursor = "i:block"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.inccommand = "split" -- Get a preview of replacements
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:1" -- always show signcolumns
vim.opt.colorcolumn = "80"
