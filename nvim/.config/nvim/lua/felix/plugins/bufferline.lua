return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	enabled = false,
	opts = {
		options = {
			separator_style = { "", "" },
			offsets = { { text_align = "left", separator = false } },
			indicator = { style = "none" },
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = false,
			always_show_bufferline = false,
		},
	},
}
