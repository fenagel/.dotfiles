local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
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
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
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
    { name = 'cmp_tabnine' },

		{ name = 'nvim_lsp' },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = 'luasnip' },

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


local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

local lspconfig = require'lspconfig'

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    --defines error in line via keybinding 
    virtual_text = false,
    underline = { severity_limit = "Error" },
    signs = true,
    update_in_insert = false,
  }
)

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(0, mode, left_side, right_side, {noremap=true})           
end

local function default_on_attach(client)
  print('Attaching to ' .. client.name)

  lsp_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  lsp_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  lsp_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  lsp_map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
  lsp_map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
  lsp_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  lsp_map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
  lsp_map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  lsp_map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  lsp_map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
  lsp_map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
  lsp_map('n', '<leader>f',':lua vim.lsp.buf.formatting()<CR>')


end

local default_config = {
  on_attach = default_on_attach,
}

local pid = vim.fn.getpid()
local cache_path = vim.fn.stdpath('cache')
local sumneko_lua_root_path = cache_path .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_lua_binary = sumneko_lua_root_path .. '/bin/macOS/lua-language-server'

-- Language Servers
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.tsserver.setup(default_config)
lspconfig.sumneko_lua.setup({
    cmd = {sumneko_lua_binary, "-E", sumneko_lua_root_path .. '/main.lua'},
    on_attach = default_on_attach,
    settings = {
      Lua ={
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          globals = {'vim'}
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
          }
        }
      }
    }
})
lspconfig.vimls.setup(default_config)
lspconfig.yamlls.setup(default_config)
local gopls_config = vim.tbl_extend('force', default_config, {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})
lspconfig.gopls.setup(gopls_config)
lspconfig.jedi_language_server.setup(default_config)

vim.opt.runtimepath = vim.opt.runtimepath + '~/.config/nvim/plugins/snippets'
require('luasnip/loaders/from_vscode').lazy_load()
