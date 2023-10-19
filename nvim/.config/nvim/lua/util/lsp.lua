-- local mapkey = require("util.keymapper").mapkey
local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	-- mapkey("gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	-- mapkey("gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	-- mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	-- mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	-- mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	-- mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	-- mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	-- mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	-- mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor
	--
	-- if client.name == "pyright" then
	-- 	mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
	-- end

  -- set keybinds
  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
