-- vim.g.nightflyTransparent = 1
-- vim.cmd [[colorscheme nightfly]]
-- require('nightfox').setup({
--   options = {
--     transparent = true,
--   }
-- })
-- vim.cmd [[colorscheme nightfox]]
-- Theme settings
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.tokyonight_transparent = true
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd 'au ColorScheme * hi! Normal guibg=none'
-- vim.g.gruvbox_invert_selection = '0'
local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = true,
  term_colors = false,
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = true,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
  }
})
vim.cmd("colorscheme catppuccin")
-- require('kanagawa').setup({
--   undercurl = true, -- enable undercurls
--   commentStyle = "italic",
--   functionStyle = "NONE",
--   keywordStyle = "italic",
--   statementStyle = "bold",
--   typeStyle = "NONE",
--   variablebuiltinStyle = "italic",
--   specialReturn = true, -- special highlight for the return keyword
--   specialException = true, -- special highlight for exception handling keywords
--   transparent = true, -- do not set background color
--   dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--   globalStatus = true, -- adjust window separators highlight for laststatus=3
--   colors = {},
--   overrides = {},
-- })
-- vim.cmd("colorscheme kanagawa")
