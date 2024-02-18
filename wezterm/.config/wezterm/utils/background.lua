local M = {}
local h = require("utils/helpers")

M.get_background = function()
	return {
		source = {
			Gradient = {
				colors = { h.is_dark() and "#000000" or "#ffffff" },
				-- colors = { h.is_dark() and "#152031" or "#ffffff" },
				-- colors = { h.is_dark() and "#00141A" or "#fff" },
			},
		},
		width = "100%",
		height = "100%",
		opacity = h.is_dark() and 0.95 or 0.8,
	}
end

return M
