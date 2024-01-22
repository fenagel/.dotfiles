local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_color_scheme = function()
	-- return get_color_scheme()
	-- return h.is_dark() and "Catppuccin Mocha" or "Catppuccin Latte"
	return "Catppuccin Mocha"
	-- return "Tomorrow Night"
end

return M
