return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]])
		require("transparent").setup({ -- Optional, you don't have to run setup.
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
			},
			extra_groups = {
				"CursorLine",
				"NormalFloat",
				"TablineFill",
				"NvimTreeNormal",
			}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})
		require("transparent").clear_prefix("BufferLine")
		-- require("transparent").clear_prefix("lualine")
	end,
}
