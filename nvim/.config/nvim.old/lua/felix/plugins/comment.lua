return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- -- import comment plugin safely
		-- local comment = require("Comment")
		--
		-- local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
		--
		-- -- enable comment
		-- comment.setup({
		-- 	-- for commenting tsx and jsx files
		-- 	pre_hook = ts_context_commentstring.create_pre_hook(),
		-- })
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
