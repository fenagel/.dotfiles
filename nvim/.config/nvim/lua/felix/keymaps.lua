--local function map(mode, lhs, rhs, opts)
--  local options = { noremap = true }
--  if opts then
--    options = vim.tbl_extend("force", options, opts)
--  end
--  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
--end

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
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- keymap.set('n', "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set('n', "<leader>j", "<cmd>lprev<CR>zz")
-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
--
-- Neogit shortcuts
keymap.set("n", "<leader>gg", function()
	require("neogit").open()
end)
keymap.set("n", "<leader>ga", "<cmd>!git fetch --all<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "Y", "yg$")

keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Reselect visual selection after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- Open nvimrc file
keymap.set("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Update Packer
keymap.set("n", "<leader>u", "<cmd> PackerUpdate<CR>")

-- Source nvimrc file
keymap.set("n", "<Leader>sl", ":luafile %<CR>")

-- Quick new file
keymap.set("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
keymap.set("n", "<Leader>sa", "ggVG<c-$>")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set("v", "y", "myy`y")
keymap.set("v", "Y", "myY`y")

-- Paste replace visual selection without copying it
keymap.set("v", "<leader>p", '"_dP')

-- Make Y behave like the other capitals
keymap.set("n", "Y", "y$")

-- yank plus additional cmd for custom yanks
-- vim.keymap.set("n", "<leader>y", '"+y')
-- vim.keymap.set("v", "<leader>y", '"+y')

-- delete plus additional cmd for custom deletes
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- Tab to switch buffers in Normal mode
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- Keep search results centred
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "mzJ`z")

-- Line bubbling
-- keymap.set("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
-- keymap.set("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
-- keymap.set("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
-- keymap.set("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--After searching, pressing escape stops the highlight
keymap.set("n", "<esc>", ":noh<cr><esc>", { silent = true })
--
-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
-- Movement
keymap.set("n", "<leader>=", ":vertical resize +5<CR>")
keymap.set("n", "<leader>-", ":vertical resize -5<CR>")
keymap.set("", "<leader>w", ":w<CR>")
keymap.set("", "<leader>q", ":q<CR>")

-- Search and replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- GO error boiler plate macro
-- keymap.set("n", "<leader>ee", [[oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>]])

-- Go Commands
-- keymap.set("n", "<leader>oc", ":GoCmt<CR>")
-- keymap.set("n", "<leader>od", ":GoDoc<CR>")
-- keymap.set("n", "<leader>oat", ":GoAddTag<CR>")
-- keymap.set("n", "<leader>ort", ":GoRmTag<CR>")
-- keymap.set("n", "<leader>op", ":GoFixPlurals<CR>")
-- keymap.set("n", "<leader>otc", ":GoTest -c<CR>")
-- keymap.set("n", "<leader>otf", ":GoTestFunc<CR>")
-- keymap.set("n", "<leader>otp", ":GoTestPkg<CR>")
-- keymap.set("n", "<leader>ol", ":GoLint<CR>")
-- keymap.set("n", "<leader>ol", ":GoCoverage<CR>")
