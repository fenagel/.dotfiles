return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    local servers = {
      "stylua",
      "shfmt",
      "gopls",
      "typescript-language-server",
      "prettier",
      "eslint-lsp",
      "html-lsp",
      "css-lsp",
      "vue-language-server",
      "templ",
    }
    vim.list_extend(opts.ensure_installed, servers)
  end,
}
