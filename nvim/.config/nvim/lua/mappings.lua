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
   vim.lsp.buf.formatting_sync()
 end,
 pattern = '*'
})
vim.api.nvim_create_autocmd("BufWritePre", {
command = ':Prettier',
pattern = {'*.js','*.ts','*.jsx','*.tsx','*.xml','*.vue','*.graphql','*.md','*.mdx','*.svelte','*.yml','*.yaml' }
})

-- Map leader to space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- Telescope
vim.keymap.set('n', '<leader>f', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>gc', function() require('telescope.builtin').git_commits() end)
vim.keymap.set('n', '<leader>gb', function() require('telescope.builtin').git_branches() end)
vim.keymap.set('n', '<leader>gs', function() require('telescope.builtin').git_status() end)
vim.keymap.set('n', '<leader>gp', function() require('telescope.builtin').git_bcommits() end)
-- Fugitive shortcuts
vim.keymap.set('n', '<leader>ga', ':Git add %:p<CR><CR>', { silent = true })
vim.keymap.set('n', '<leader>gg', ':GBrowse<CR>', { silent = true })
vim.keymap.set('n', '<leader>gd', ':Gdiff<CR>', { silent = true })
vim.keymap.set('n', '<leader>ge', ':Gedit<CR>', { silent = true })
vim.keymap.set('n', '<leader>gr', ':Gread<CR>', { silent = true })
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR><CR>', { silent = true })
vim.keymap.set('n', '<leader>gl', ':silent! Glog<CR>:bot copen<CR>', { silent = true })
vim.keymap.set('n', '<leader>gm', ':Gmove<Space>', { silent = true })
vim.keymap.set('n', '<leader>go', ':Git checkout<Space>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function()
  vim.inspect(vim.lsp.buf.list_workspace_folders())
end)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", { silent = true })

-- Allow gf to open non-existing files
vim.keymap.set("", "gf", ":edit <cfile><cr>")

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Open nvimrc file
vim.keymap.set("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Update Packer
vim.keymap.set("n", "<leader>u", "<cmd> PackerUpdate<CR>")
-- Source nvimrc file
vim.keymap.set("n", "<Leader>sl", ":luafile %<CR>")

-- Quick new file
vim.keymap.set("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
vim.keymap.set("n", "<Leader>sa", "ggVG<c-$>")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")
-- Paste replace visual selection without copying it
vim.keymap.set("v", "<leader>p", '"_dP')
-- Make Y behave like the other capitals
vim.keymap.set("n", "Y", "y$")

-- Tab to switch buffers in Normal mode
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- Keep search results centred
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- Make Y yank to end of the line
vim.keymap.set("n", "Y", "y$")

-- Line bubbling
vim.keymap.set("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
vim.keymap.set("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--After searching, pressing escape stops the highlight
vim.keymap.set("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Telescope
--map("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files()<cr>')
--map("n", "<leader>lg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
--map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
--map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
--map("n", "<leader>f", '<cmd>lua require("telescope.builtin").git_files()<cr>')
--map("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_status()<cr>')
--map("n", "<leader>gb", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
--map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
--map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
--map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
--map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
--map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
---- map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
---- map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
---- map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("n", "<leader>ci", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- Movement
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>+", ":vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>")
vim.keymap.set("", "<leader>w", ":w<CR>")
vim.keymap.set("", "<leader>q", ":q<CR>")
