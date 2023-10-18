local function fmt_with_edit()
	local win_state = vim.call("winsaveview")

	vim.lsp.buf.format({ name = "efm" })

	vim.cmd("edit!")
	vim.call("winrestview", win_state)
end

local function efm_fmt(buf)
	local matched_clients = vim.lsp.get_active_clients({ name = "efm", bufnr = buf })

	if vim.tbl_isempty(matched_clients) then
		return
	end

	local efm = matched_clients[1]
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	local formatters = efm.config.settings.languages[ft]

	local matches = vim.tbl_filter(function(fmt)
		return not fmt.formatStdin
	end, formatters)

	if not vim.tbl_isempty(matches) then
		fmt_with_edit()
	else
		vim.lsp.buf.format({ name = "efm" })
	end
end
-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lsp_fmt_group,
	callback = function(ev)
		efm_fmt(ev.buf)
	end,
})
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = lsp_fmt_group,
-- 	callback = function()
-- 		local efm = vim.lsp.get_active_clients({ name = "efm" })
--
-- 		if vim.tbl_isempty(efm) then
-- 			return
-- 		end
--
-- 		vim.lsp.buf.format({ name = "efm", async = true })
-- 	end,
-- })

vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight SignColumn guibg=NONE
autocmd ColorScheme * highlight GitSignsAdd guibg=NONE
autocmd ColorScheme * highlight GitSignsChange guibg=NONE
autocmd ColorScheme * highlight GitSignsDelete guibg=NONE
augroup end
]])

-- highlight yank autocmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timout = 40,
		})
	end,
})
