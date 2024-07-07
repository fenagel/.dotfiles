return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        bashls = {},
        gopls = {},
        -- bicep = {},
        yamlls = {},
        marksman = {},
        -- powershell_es = {},
        -- azure_pipelines_ls = {},
        -- terraformls = {},
        -- helm_ls = {},
        -- csharp_ls = {},
      },
      inlay_hints = {
        enabled = false,
        -- exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
    },
  },
}
