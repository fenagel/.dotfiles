local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
end
--lspconfig.gopls.setup(gopls_config)
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
local lua_rtp = vim.split(package.path, ';')
table.insert(lua_rtp, 'lua/?.lua')
table.insert(lua_rtp, 'lua/?/init.lua')
lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == 'gopls' then
    opts = {
      capabilities = capabilities;
      on_attach = on_attach;
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      }
    }
  end

  -- (optional) Customize the options passed to the server
  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = lua_rtp,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim', 'coq' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
          userThirdParty = {
            'OpenResty',
          },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      }
    }
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig/configs").emmet_ls = {
  default_config = {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = { "html", "css" },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

require("lspconfig").emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").graphql.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").jsonls.setup({
  cmd = { "vscode-json-language-server", "--stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          fileMatch = { "now.json", "vercel.json" },
          url = "https://json.schemastore.org/now.json",
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json",
          },
          url = "http://json.schemastore.org/stylelintrc.json",
        },
      },
    },
  },
})

require("lspconfig").solidity_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Different machine VAR for office
local envMachine = os.getenv("MACHINE")
if envMachine == "work" then
  luaCmd = "/Users/fenagel/lua-language-server"
else
  luaCmd = "/Users/felix/lua-language-server"
end

require("lspconfig").sumneko_lua.setup({
  cmd = { luaCmd .. "/bin/macOS/lua-language-server", "-E", luaCmd .. "/main.lua" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = { globals = { "vim" } },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
})

require("lspconfig").tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    -- "vue"
  },
  capabilities = capabilities,
  on_attach = on_attach,
})
require("lspconfig").solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
require("lspconfig").vuels.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = "",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end
