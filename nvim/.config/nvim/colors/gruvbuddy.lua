require("colorbuddy").colorscheme("gruvbuddy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("yellow", "#FFFAC2")
Color.new("green", "#5FB3A1")
Color.new("teal1", "#5DE4C7")
Color.new("teal2", "#5FB3A1")
Color.new("teal3", "#42675A")
Color.new("blue", "#506477")
Color.new("cyan", "#89DDFF")
Color.new("blue1", "#89DDFF")
Color.new("blue2", "#ADD7FF")
Color.new("blue3", "#91B4D5")
Color.new("blue4", "#7390AA")
Color.new("magenta", "#FAE4FC")
Color.new("pink1", "#FAE4FC")
Color.new("pink2", "#FCC5E9")
Color.new("pink3", "#D0679D")
Color.new("red", "#D0679D")
Color.new("purple", "#D0679D")
Color.new("blueGray1", "#A6ACCD")
Color.new("blueGray2", "#767C9D")
Color.new("blueGray3", "#506477")
Color.new("text", "#E4F0FB")
-- background1 = '#303340',
-- background2 = '#1B1E28',
-- background3 = '#171922',
-- white = '#FFFFFF',
-- none = 'NONE',

Color.new("white", "#EBEDF2")

local background_string = "#1B1E28"
Color.new("background", background_string)
Color.new("gray0", background_string)
Color.new("gray1", "#A6ACCD")
Color.new("gray2", "#767C9D")
Color.new("gray3", "#506477")
Color.new("gray7", "#506477")

Group.new("Normal", c.superwhite, c.gray0)

Group.new("@constructor", c.teal1, nil, s.none)
Group.new("@exception", c.blue3, nil, s.none)
Group.new("@conditional", c.yellow, nil, s.none)
Group.new("@special", c.teal3, nil, s.none)
Group.new("@character", c.pink3, nil, s.none)
Group.new("@error", c.pink3, nil, s.none)
Group.new("@todo", c.yellow, nil, s.none)
Group.new("@delimiter", c.text, nil, s.none)
Group.new("@comment", c.blueGray1, nil, s.none)
Group.new("@field", c.text, nil, s.none)
Group.new("@boolean", c.teal1, nil, s.none)
Group.new("@number", c.teal1, nil, s.none)
Group.new("@float", c.teal1, nil, s.none)
Group.new("@label", c.blue3, nil, s.none)
Group.new("@method", c.teal1, nil, s.none)
Group.new("@operator", c.blue2, nil, s.none)
Group.new("@string", c.teal1, nil, s.none)
Group.new("@string.escape", c.pink3, nil, s.none)
Group.new("@tag.delimiter", c.text, nil, s.none)
Group.new("@tag.attribute", c.blue3, nil, s.none)
Group.new("@type", c.teal3, nil, s.none)
Group.new("@constant", c.text, nil, s.none)
Group.new("@constant.builtin", c.blue2, nil, s.none)
Group.new("@function", c.blue2, nil, s.none)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@keyword", c.blue3, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@keyword.return", c.teal2, nil, s.none)
Group.new("@keyword.function", c.blue2, nil, s.none)
Group.new("@keyword.operator", c.teal1, nil, s.none)
Group.new("@property", c.blue2)
Group.new("@variable", c.text, nil)
Group.new("@variable.builtin", c.blue2:light():light(), g.Normal)

--

-- Color.new("white", "#f2e5bc")
-- -- Color.new("red", "#cc6666")
-- Color.new("red", "#c14a4a")
-- -- Color.new("pink", "#fef601")
-- Color.new("pink", "#FED872")
-- Color.new("green", "#99cc99")
-- Color.new("yellow", "#FED872")
-- -- Color.new("yellow", "#f8fe7a")
-- -- Color.new("blue", "#81a2be")
-- Color.new("blue", "#45707a")
-- Color.new("aqua", "#8ec07c")
-- Color.new("cyan", "#8abeb7")
-- Color.new("purple", "#8e6fbd")
-- -- Color.new("violet", "#b294bb")
-- Color.new("violet", "#945e80")
-- Color.new("orange", "#de935f")
-- Color.new("brown", "#a3685a")
--
-- Color.new("seagreen", "#698b69")
-- Color.new("turquoise", "#698b69")

-- local background_string = "#000000"
-- Color.new("background", background_string)
-- Color.new("gray0", background_string)
--
-- Group.new("Normal", c.superwhite, c.gray0)
--
-- Group.new("@constant", c.orange, nil, s.none)
-- Group.new("@function", c.yellow, nil, s.none)
-- Group.new("@function.bracket", g.Normal, g.Normal)
-- Group.new("@keyword", c.violet, nil, s.none)
-- Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
-- Group.new("@property", c.blue)
-- Group.new("@variable", c.superwhite, nil)
-- Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

-- I've always liked lua function calls to be blue. I don't know why.
Group.new("@function.call.lua", c.blue:dark(), nil, nil)
