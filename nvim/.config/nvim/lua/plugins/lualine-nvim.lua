local config = function()
	local lazy_status = require("lazy.status") -- to configure lazy pending updates count
	local theme = require("lualine.themes.nightfox")

	-- set bg transparency in all modes
	theme.normal.c.bg = nil
	-- theme.insert.c.bg = nil
	-- theme.visual.c.bg = nil
	-- theme.replace.c.bg = nil
	-- theme.command.c.bg = nil

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		sections = {
			lualine_x = {
				{
					lazy_status.updates,
					cond = lazy_status.has_updates,
					color = { fg = "#ff9e64" },
				},
				{ "encoding" },
				{ "fileformat" },
				{ "filetype" },
			},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
