local vim = vim
local uv = vim.loop
local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local mapBuf = require "fn.mappings".mapBuf
local autocmd = require "fn.autocmds".autocmd

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      menu = ({
        buffer = "[Buffer]",
        cmp_tabnine = "[T9]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        treesitter = "[TS]",
        vsnip = "[VSnip]",
      }),
      with_text = true
    }),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'vsnip' },
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false})

local function completionItemResolveCB(err, _, result)
  if err or not result then
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  if result.additionalTextEdits then
    vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
  end
end
local function requestCompletionItemResolve(bufnr, item)
  vim.lsp.buf_request(bufnr, "completionItem/resolve", item, completionItemResolveCB)
end
function M.on_complete_done()
  local bufnr = vim.api.nvim_get_current_buf()
  local completed_item_var = vim.v.completed_item
  if
    completed_item_var and completed_item_var.user_data and completed_item_var.user_data.nvim and
      completed_item_var.user_data.nvim.lsp and
      completed_item_var.user_data.nvim.lsp.completion_item
   then
    local item = completed_item_var.user_data.nvim.lsp.completion_item
    requestCompletionItemResolve(bufnr, item)
  end
  if
    completed_item_var and completed_item_var.user_data and completed_item_var.user_data and
      completed_item_var.user_data.lsp and
      completed_item_var.user_data.lsp.completion_item
   then
    local item = completed_item_var.user_data.lsp.completion_item
    requestCompletionItemResolve(bufnr, item)
  end
end

local on_attach = function(client, bufnr)
  -- completion.on_attach()

  mapBuf(bufnr, "n", "<Leader>gdc", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  mapBuf(bufnr, "n", "<Leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")

  --Hover
  -- mapBuf(bufnr, "n", "<Leader>gh", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  mapBuf(bufnr, "n", "<Leader>gh", '<Cmd>lua vim.lsp.buf.hover()<CR>')

  mapBuf(bufnr, "n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  mapBuf(bufnr, "n", "<Leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  mapBuf(bufnr, "n", "<Leader>gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>")

  -- rename
  mapBuf(bufnr, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- mapBuf(bufnr, "n", "<Leader>rn", "<cmd>lua require('lspsaga.rename').rename()<cr>")

  mapBuf(bufnr, "n", "<Leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")

  mapBuf(bufnr, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  mapBuf(bufnr, "v", "<Leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
  -- mapBuf(bufnr, "n", "<Leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<cr>")
  -- mapBuf(bufnr, "v", "<Leader>ca", "<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>")

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "•"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "•"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "•"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "•"})

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
    vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
  end

end
local servers = {"pylsp", "bashls", "sourcekit"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
lspconfig.vuels.setup {
  on_attach = on_attach
}
lspconfig.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

configs.emmet_ls = {
  default_config = {
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {"html", "css"},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
    -- "vue"
  },
  on_attach = on_attach,
  capabilities = capabilities
}

local vs_code_extracted = {
  html = "vscode-html-language-server",
  cssls = "vscode-css-language-server",
  vimls = "vim-language-server"
}

for ls, cmd in pairs(vs_code_extracted) do
  lspconfig[ls].setup {
    cmd = {cmd, "--stdio"},
    on_attach = on_attach,
    capabilities = capabilities
  }
end

local lua_lsp_loc = "/Users/felix/lua-language-server"

lspconfig.jsonls.setup {
  cmd = {"vscode-json-language-server", "--stdio"},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"},
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
        },
        {
          fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = {"lerna.json"},
          url = "https://json.schemastore.org/lerna.json"
        },
        {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json"
          },
          url = "http://json.schemastore.org/stylelintrc.json"
        }
      }
    }
  }
}

local ngls_cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  default_node_modules,
  "--ngProbeLocations",
  default_node_modules,
  "--experimental-ivy"
}


lspconfig.sumneko_lua.setup {
  cmd = {lua_lsp_loc .. "/bin/macOS/lua-language-server", "-E", lua_lsp_loc .. "/main.lua"},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      diagnostics = {globals = {"vim"}},
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true
        }
      }
    }
  }
}
return M
