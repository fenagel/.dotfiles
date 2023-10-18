return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>xx",
			function()
				require("trouble").open()
			end,
		},
		{
			"<leader>xw",
			function()
				require("trouble").open("workspace_diagnostics")
			end,
		},
		{
			"<leader>xd",
			function()
				require("trouble").open("document_diagnostics")
			end,
		},
		{
			"<leader>xq",
			function()
				require("trouble").open("quickfix")
			end,
		},
		{
			"<leader>xl",
			function()
				require("trouble").open("loclist")
			end,
		},
		-- {
		-- 	"gR",
		-- 	function()
		-- 		require("trouble").open("lsp_references")
		-- 	end,
		-- },
	},
}
