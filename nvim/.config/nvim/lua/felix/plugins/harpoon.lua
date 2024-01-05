return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		keymap("n", "<s-m>", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
		keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
		vim.api.nvim_create_autocmd({ "filetype" }, {
			pattern = "harpoon",
			callback = function()
				vim.cmd([[highlight link HarpoonBorder TelescopeBorder]])
				-- vim.cmd [[setlocal nonumber]]
				-- vim.cmd [[highlight HarpoonWindow guibg=#313132]]
			end,
		})
		keymap("n", "<leader>1", function()
			require("harpoon.ui").nav_file(1)
		end, opts, { desc = "Go to harpoon mark #1" })

		keymap("n", "<leader>2", function()
			require("harpoon.ui").nav_file(2)
		end, opts, { desc = "Go to harpoon mark #2" })
		keymap("n", "<leader>3", function()
			require("harpoon.ui").nav_file(3)
		end, opts, { desc = "Go to harpoon mark #3" })
		keymap("n", "<leader>4", function()
			require("harpoon.ui").nav_file(4)
		end, opts, { desc = "Go to harpoon mark #4" })
	end,
}
