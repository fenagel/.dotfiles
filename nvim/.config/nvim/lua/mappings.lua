local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- AUTO COMMANDS --

vim.cmd[[autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync()]]
vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*xml,*vue,*.graphql,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]

-- Map leader to space
vim.g.mapleader = " "

map("n", "<leader>tt", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", { silent = true })

-- Allow gf to open non-existing files
map("", "gf", ":edit <cfile><cr>")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Open nvimrc file
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Update Packer
map("n", "<leader>u", "<cmd> PackerUpdate<CR>")
-- Source nvimrc file
map("n", "<Leader>sl", ":luafile %<CR>")

-- Splits
map("n", "<leader>sv", ":vsplit<CR>")
map("n", "<leader>sh", ":split<CR>")
-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map("v", "y", "myy`y")
map("v", "Y", "myY`y")
-- Paste replace visual selection without copying it
map("v", "<leader>p", '"_dP')
-- Make Y behave like the other capitals
map("n", "Y", "y$")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Telescope
map("n", "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<cr>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>gf", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_status()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
-- map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
-- map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("n", "<leader>ci", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- Movement
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")
map("n", "<leader>+", ":vertical resize +5<CR>")
map("n", "<leader>-", ":vertical resize -5<CR>")
map("", "<leader>w", ":w<CR>")
map("", "<leader>q", ":q<CR>")
map("", "<leader>e", ":e<CR>")
