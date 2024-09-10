-- Disable "No information available" notification on hover
-- plus define border for hover window
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { "╭", "Comment" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
    }
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

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
        templ = {},
        html = {
          filetypes = { "html", "templ" },
        },
      },
      inlay_hints = {
        enabled = false,
        -- exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
    },
  },
}
