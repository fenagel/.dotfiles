local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_font = function()
	-- 	local fonts = {
	-- 		"Monaspace Argon",
	-- 		"Monaspace Krypton",
	-- 		"Monaspace Neon",
	-- 		"Monaspace Radon",
	-- 		"Monaspace Xenon",
	-- 		"JetBrainsMono Nerd Font",
	-- 	}
	-- local family = h.get_random_entry(fonts)
	-- return wezterm.font_with_fallback({ { family = "Monaspace Radon", weight = "Regular" } })
	-- return wezterm.font("JetBrainsMono Nerd Font", { italic = false })
	-- return wezterm.font("Iosevka Term", { weight = "Regular", italic = false })
	-- return wezterm.font("FiraCode NF", { weight = "Regular", italic = false })
	-- return wezterm.font("CommitMono Nerd Font", { weight = "Regular", italic = false })
	return wezterm.font("SFMono Nerd Font")
	-- 	-- return wezterm.font("Menlo")
	-- 	--
end
-- M.get_font = function(fonts)
-- 	local family = h.get_random_entry(fonts)
-- 	return wezterm.font_with_fallback({
-- 		{ family = family, weight = "Regular" },
-- 		{ family = "Symbols Nerd Font Mono" },
-- 	})
-- end

return M
