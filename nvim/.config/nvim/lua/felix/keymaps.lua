-- AUTO COMMANDS --
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	pattern = "*",
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   command = ':Prettier',
--   pattern = { '*.js', '*.ts', '*.jsx', '*.tsx', '*.xml', '*.vue', '*.graphql', '*.md', '*.mdx', '*.svelte', '*.yml',
--     '*.yaml', '*.astro' }
-- })
local keymap = vim.keymap
-- Map leader to space
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')
keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
-- keymap.set('n', "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set('n', "<leader>j", "<cmd>lprev<CR>zz")
-- Telescope
keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>") -- list available diagnostics
keymap.set("n", "<leader>u", function()
	require("telescope").extensions.file_browser.file_browser()
end, { desc = "Files Explore" })
keymap.set("n", "<leader>gs", vim.cmd.Git)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>cr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Code References" })
--
-- Neogit shortcuts
keymap.set("n", "<leader>gg", function()
	require("neogit").open()
end)
keymap.set("n", "<leader>ga", "<cmd>!git fetch --all<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "Y", "yg$")

keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Source nvimrc file
-- keymap.set("n", "<Leader>sl", ":luafile %<CR>")

-- Quick new file
keymap.set("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
keymap.set("n", "<Leader>sa", "ggVG<c-$>")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`y")
keymap.set("v", "Y", "myY`y")

-- Make Y behave like the other capitals
keymap.set("n", "Y", "y$")

-- yank plus additional cmd for custom yanks
-- vim.keymap.set("n", "<leader>y", '"+y')
-- vim.keymap.set("v", "<leader>y", '"+y')

-- delete plus additional cmd for custom deletes
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- Keep search results centred
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z")

-- Line bubbling
-- keymap.set("n", "<c-j>", "<cmd>m .+0<CR>==", { silent = true })
-- keymap.set("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
-- keymap.set("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
-- keymap.set("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--After searching, pressing escape stops the highlight
keymap.set("n", "<esc>", ":noh<cr><esc>", { silent = true })
--
-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Movement
keymap.set("n", "<leader>=", ":vertical resize +5<CR>")
keymap.set("n", "<leader>-", ":vertical resize -5<CR>")
keymap.set("", "<leader>w", ":w<CR>")
keymap.set("", "<leader>q", ":q<CR>")

-- Search and replace word under cursor
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Harpoon
local silent = { silent = true }

keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, silent)
keymap.set("n", "<C-e>", function()
	require("harpoon.ui").toggle_quick_menu()
end, silent)
keymap.set("n", "<C-h>", function()
	require("harpoon.ui").nav_file(1)
end, silent)
keymap.set("n", "<C-j>", function()
	require("harpoon.ui").nav_file(2)
end, silent)
keymap.set("n", "<C-k>", function()
	require("harpoon.ui").nav_file(3)
end, silent)
keymap.set("n", "<C-l>", function()
	require("harpoon.ui").nav_file(4)
end, silent)
-- GO error boiler plate macro
keymap.set("n", "<leader>e", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])
