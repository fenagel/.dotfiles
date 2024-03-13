local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

local function get_color_scheme()
	local color_schemes = {}
	local color_schemes_glob = os.getenv("HOME") .. "/repos/iTerm2-Color-Schemes/wezterm/**"
	for _, v in ipairs(wezterm.glob(color_schemes_glob)) do
		local fileName = string.match(v, ".+/([^/]+)%.%w+$")
		table.insert(color_schemes, fileName)
	end
	local color_scheme = h.get_random_entry(color_schemes)
	return color_scheme
end

local colors = {
	foreground = "#fbf1c7",
	background = "#1d2021",

	cursor_bg = "#928374",
	cursor_fg = "black",
	cursor_border = "#928374",

	selection_fg = "#928374",
	selection_bg = "#ebdbb2",

	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#1d2021", -- black, color 0
		"#cc241d", -- red, color 1
		"#98971a", -- green, color 2
		"#d79921",
		"#458588",
		"#b16286",
		"#689d6a",
		"#a89984",
	},
	brights = {
		"#7c6f64", -- black, color 0
		"#fb4934", -- red, color 1
		"#b8bb26", -- green, color 2
		"#fabd2f",
		"#83a598",
		"#d3869b",
		"#8ec07c",
		"#fbf1c7",
	},
}
M.get_color_scheme = function()
	-- return get_color_scheme()
	-- return h.is_dark() and "Catppuccin Mocha" or "Catppuccin Latte"
	-- return "Catppuccin Mocha"
	-- return "Poimandres"
	-- return "OneHalfDark"
	-- return "Solarized Dark Higher Contrast"
	-- return "Tomorrow Night"
	-- return "rose-pine"
	return "GruvboxDarkHard"
	-- return "Gruvbox Dark (Gogh)"
	-- return "Gruvbox dark, hard (base16)"
	-- return "Everforest Dark (Gogh)"
end
M.colors = function()
	return colors
end

-- wezterm.on("user-var-changed", function(window, _, name, value)
-- 	wezterm.log_info("var", name, value)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if string.match(name, "color_scheme") then
-- 		overrides.color_scheme = value
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

return M
