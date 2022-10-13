local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("felix.lsp.mason")
require("felix.lsp.handlers").setup()
require("felix.lsp.null-ls")
