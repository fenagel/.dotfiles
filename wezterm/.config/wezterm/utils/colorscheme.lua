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
	foreground = "#8383A5",
	background = "#0D0F11",

	cursor_bg = "#F7ECE5",
	cursor_fg = "#090A0B",
	cursor_border = "#F7ECE5",

	selection_fg = "#928374",
	selection_bg = "#F7F9B4",

	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#0D0F11",
		-- "#131516", -- black, color 0
		"#9C4430", -- red, color 1
		"#B1EEAB", -- green, color 2
		"#EE964B",
		"#9C4430",
		"#d3869b",
		"#689d6a",
		"#595959",
	},
	brights = {
		"#0D0F11",
		-- "#131516", -- black, color 0
		"#9C4430", -- red, color 1
		"#B1EEAB", -- green, color 2
		"#EE964B",
		"#9C4430",
		"#d3869b",
		"#689d6a",
		"#595959",
	},
}
M.get_color_scheme = function()
	-- return get_color_scheme()
	-- return h.is_dark() and "Catppuccin Mocha" or "Catppuccin Latte"
	-- return "Catppuccin Mocha"
	return "Tokyo Night"
	-- return "Poimandres"
	-- return "OneDark"
	-- return "Belge (terminal.sexy)"
	-- return "Black Metal (Bathory) (base16)"
	-- return "Solarized Dark Higher Contrast"
	-- return "Tomorrow Night"
	-- return "IR Black (base16)"
	-- return "rose-pine"
	-- return "Harper"
	-- return "One Half Black (Gogh)"
	-- return "GruvboxDarkHard"
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
