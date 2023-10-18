return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local silent = { silent = true }

		keymap.set(
			"n",
			"<leader>hm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
		keymap.set("n", "<leader>1", function()
			require("harpoon.ui").nav_file(1)
		end, silent)
		keymap.set("n", "<leader>2", function()
			require("harpoon.ui").nav_file(2)
		end, silent)
		keymap.set("n", "<leader>3", function()
			require("harpoon.ui").nav_file(3)
		end, silent)
		keymap.set("n", "<leader>4", function()
			require("harpoon.ui").nav_file(4)
		end, silent)
	end,
}
