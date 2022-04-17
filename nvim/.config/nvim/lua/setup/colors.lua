-- vim.g.nightflyTransparent = 1
-- require('nightfox').setup({
--   options = {
--     transparent = true,
--   }
-- })
-- vim.cmd [[colorscheme nightfly]]
-- vim.cmd [[colorscheme nightfox]]
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true
-- vim.cmd [[colorscheme tokyonight]]
require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "italic",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  globalStatus = true, -- adjust window separators highlight for laststatus=3
  colors = {},
  overrides = {},
})
vim.cmd("colorscheme kanagawa")
