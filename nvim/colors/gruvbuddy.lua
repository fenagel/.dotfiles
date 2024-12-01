local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

-- Clear any existing colors
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "hybrid"

-- Define the color palette to match hybrid theme
local palette = {
  background = "#1d1f21", -- Dark background
  foreground = "#c5c8c6", -- Light text
  selection = "#373b41", -- Selection background
  line = "#282a2e", -- Line highlight
  comment = "#707880", -- Comment color
  red = "#cc6666", -- Red
  orange = "#de935f", -- Orange
  yellow = "#f0c674", -- Yellow
  green = "#b5bd68", -- Green
  aqua = "#de935f",
  -- aqua = "#8abeb7",      -- Aqua/Cyan
  blue = "#81a2be", -- Blue
  purple = "#b294bb", -- Purple
  window = "#303030", -- Window background
  darkcolumn = "#1c1c1c", -- Dark column
  addbg = "#5F875F", -- Add background (git)
  addfg = "#d7ffaf", -- Add foreground
  changebg = "#5F5F87", -- Change background
  changefg = "#d7d7ff", -- Change foreground
  delbg = "#cc6666", -- Delete background
  darkblue = "#00005f", -- Dark blue
  darkcyan = "#005f5f", -- Dark cyan
  darkred = "#5f0000", -- Dark red
  darkpurple = "#5f005f", -- Dark purple
}

-- Register colors
for name, hex in pairs(palette) do
  Color.new(name, hex)
end

-- Basic highlighting
Group.new("Normal", c.foreground, c.background)
Group.new("ColorColumn", nil, c.line)
Group.new("CursorColumn", nil, c.line)
Group.new("CursorLine", nil, c.line)
Group.new("Directory", c.blue, nil)
Group.new("DiffAdd", c.addfg, c.addbg)
Group.new("DiffChange", c.changefg, c.changebg)
Group.new("DiffDelete", c.background, c.delbg)
Group.new("DiffText", c.background, c.blue)
Group.new("ErrorMsg", c.background, c.red, s.standout)
Group.new("VertSplit", c.window, nil)
Group.new("Folded", c.comment, c.darkcolumn)
Group.new("FoldColumn", nil, c.darkcolumn)
Group.new("SignColumn", nil, c.darkcolumn)
Group.new("LineNr", c.selection, nil)
Group.new("CursorLineNr", c.yellow, nil)
Group.new("MatchParen", c.background, c.changebg)
Group.new("ModeMsg", c.green, nil)
Group.new("MoreMsg", c.green, nil)
Group.new("NonText", c.selection, nil)
Group.new("Pmenu", c.foreground, c.selection)
Group.new("PmenuSel", c.foreground, c.selection, s.reverse)
Group.new("Question", c.green, nil)
Group.new("Search", c.background, c.yellow)
Group.new("SpecialKey", c.selection, nil)
Group.new("SpellCap", c.blue, c.darkblue, s.underline)
Group.new("SpellLocal", c.aqua, c.darkcyan, s.underline)
Group.new("SpellBad", c.red, c.darkred, s.underline)
Group.new("SpellRare", c.purple, c.darkpurple, s.underline)
Group.new("StatusLine", c.comment, c.background, s.reverse)
Group.new("StatusLineNC", c.window, c.comment, s.reverse)
Group.new("TabLine", c.foreground, c.darkcolumn, s.reverse)
Group.new("Title", c.yellow, nil)
Group.new("Visual", nil, c.selection)
Group.new("WarningMsg", c.red, nil)

-- Generic Syntax Highlighting
Group.new("Comment", c.comment, nil)
Group.new("Constant", c.red, nil)
Group.new("String", c.green, nil)
Group.new("Identifier", c.purple, nil)
Group.new("Function", c.yellow, nil)
Group.new("Statement", c.blue, nil)
Group.new("Operator", c.aqua, nil)
Group.new("PreProc", c.aqua, nil)
Group.new("Type", c.orange, nil)
Group.new("Structure", c.aqua, nil)
Group.new("Special", c.red, nil)
Group.new("Underlined", c.blue, nil, s.underline)
Group.new("Error", c.red, c.darkred, s.underline)
Group.new("Todo", c.addfg, nil)
Group.new("qfLineNr", c.yellow, nil)

-- Diff Highlighting
Group.new("diffRemoved", c.red, nil)
Group.new("diffAdded", c.green, nil)
