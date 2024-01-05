local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = true,
    sources = {
      formatting.stylua,
      formatting.prettier.with {
        extra_filetypes = { "toml", "vue" },
        -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      },
      diagnostics.eslint_d,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
