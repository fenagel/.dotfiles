local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_font = function()
	local fonts = {
		"Monaspace Argon",
		"Monaspace Krypton",
		"Monaspace Neon",
		"Monaspace Radon",
		"Monaspace Xenon",
		"JetBrainsMono Nerd Font",
	}
	local family = h.get_random_entry(fonts)
	-- return wezterm.font_with_fallback({ { family = "Monaspace Argon", weight = "Regular" } })
	return wezterm.font("JetBrainsMono Nerd Font", { italic = true })
	-- return wezterm.font("CommitMono Nerd Font")
	-- return wezterm.font("Menlo")
end

return M
