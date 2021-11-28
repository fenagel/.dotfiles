-------------------- HELPERS -------------------------------
local vim = vim
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local opt, wo = vim.opt, vim.wo
local fmt = string.format

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

  Plug 'gruvbox-community/gruvbox'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'smiteshp/nvim-gps'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'tpope/vim-rhubarb'
  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'chriskempson/base16-vim'
  Plug 'sbdchd/neoformat'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug('tzachar/cmp-tabnine', {['do'] = vim.fn['./install.sh']})
  Plug 'onsails/lspkind-nvim'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
vim.call('plug#end')

-------------------- PLUGIN SETUP --------------------------
-- Telescope
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")

-- nvim-cmp 
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
})

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
  mapping = {
      ['<c-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<c-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<c-y>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    },
	  sources = {
    -- tabnine completion? yayaya
    { name = "cmp_tabnine" },

    { name = "nvim_lsp" },

    -- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },
	},
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
})

-- Snippets
local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = "/Users/felix/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
		  table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

-------------------- OPTIONS -------------------------------
local indent, width = 2, 80
opt.colorcolumn = tostring(width)   -- Line length marker
opt.completeopt = {'menu', 'menuone', 'noselect'}  -- Completion options
opt.expandtab = true                -- Use spaces instead of tabs
opt.swapfile = false                -- Disable swap files
opt.undodir = vim.env.HOME .. '/.vim/undo'
opt.undofile = true
opt.syntax = 'on'
opt.ignorecase = true               -- Ignore case
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 8                   -- Lines of context
opt.shiftwidth = indent             -- Size of an indent
vim.cmd [[set shortmess+=c]]
opt.sidescrolloff = 8               -- Columns of context
opt.signcolumn = 'yes'              -- Show sign column
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = indent                -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.textwidth = width               -- Maximum width of text
opt.updatetime = 100                -- Delay before swap file is saved
opt.wildmode = {'longest', 'list', 'full'}  -- Command-line completion mode
opt.wildmenu = true
opt.wildignore = {'*/cache/*', '*/tmp/*', '*/node_modules/*', '*/.git/*', '*/coverage/*'} -- Wild ignore certain files
opt.wrap = false                    -- Disable line wrap
opt.hlsearch = false
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-------------------- COLORS --------------------------------

cmd 'colorscheme gruvbox'
-- vim.cmd 'au ColorScheme * hi! Normal guibg=none'
cmd 'au ColorScheme * hi! Normal guibg=NONE'
cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
cmd 'au ColorScheme * hi! LineNr guibg=NONE'
cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
g.gruvbox_invert_selection = '0'
g.gruvbox_contrast_dark = 'hard'
g.background= "dark"


-------------------- MAPPINGS ------------------------------
g.mapleader = ' '
map('', '<leader>c', '"+y')
map('n', '<leader>u', ':UndotreeShow<CR>')
map('n', 'Y', 'yg$')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('x', '<Leader_p>', "'_dP")
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', '<Leader>+', ':vertical resize +5<CR>')
map('n', '<Leader>_', ':vertical resize -5<CR>')
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('n', '<leader>ne', ':NERDTreeToggle<CR>')
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<esc>:w<CR>')
map('n', '<Leader>gs', '<cmd>Git<CR>')
map('n', '<leader>fg', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
map('n', '<leader>f', ':lua require("telescope.builtin").git_files()<CR>')
map('n','<leader>ff' ,':lua require("telescope.builtin").find_files()<CR>' )
map('n', '<leader>fw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<Leader>rp', ':resize 100<CR>')
-------------------- LSP -----------------------------------
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").ccls.setup(config())

require("lspconfig").jedi_language_server.setup(config())

require("lspconfig").svelte.setup(config())

require("lspconfig").solang.setup(config())

require("lspconfig").cssls.setup(config())

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

local sumneko_root_path = "/Users/felix/.cache/nvim/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

require("lspconfig").sumneko_lua.setup(config({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))


map('n', '<leader>vp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>vn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>vd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>vf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>vh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>vm', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>vr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>vs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-------------------- TREE-SITTER ---------------------------
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {enable = true},
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer', ['if'] = '@function.inner',
      },
    },
    move = {
      enable = true,
      goto_next_start = {[']a'] = '@parameter.outer', [']f'] = '@function.outer'},
      goto_next_end = {[']A'] = '@parameter.outer', [']F'] = '@function.outer'},
      goto_previous_start = {['[a'] = '@parameter.outer', ['[f'] = '@function.outer'},
      goto_previous_end = {['[A'] = '@parameter.outer', ['[F'] = '@function.outer'},
    },
  },
}

-------------------- COMMANDS ------------------------------
vim.tbl_map(function(c) cmd(fmt('autocmd %s', c)) end, {
  'TextYankPost * silent! lua require"vim.highlight".on_yank({timeout = 40})',
})
vim.cmd[[autocmd BufWritePre *.cs :lua vim.lsp.buf.formatting_sync()]]
vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.vue,*.graphql,*.md,*.mdx,*.svelte,*.yml,*yaml :Neoformat prettier]]

