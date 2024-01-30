return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {},
      eslint = {},
      html = {
        filetypes = { "html", "templ" },
      },
      cssls = {},
      volar = {},
      templ = {
        filetypes = { "templ" },
      },
      {
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtml" },
        },
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
