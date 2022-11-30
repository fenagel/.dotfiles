-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- if not status then
-- 	print("Colorscheme not found!") -- print error if colorscheme not installed
-- 	return
-- end
vim.g.fenagel_colorscheme = "tokyonight"
require("tokyonight").setup({
	style = "storm",
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
--
-- require("catppuccin").setup({
-- 	transparent_background = true,
-- })
--

-- vim.g.nightflyTransparent = true
--
-- require("rose-pine").setup({
-- 	disable_background = true,
-- 	disable_float_background = true,
-- })
function ColorMyPencils()
	vim.g.everforest_background = "hard"
	vim.g.everforest_transparent_background = "2"
	vim.g.everforest_cursor = "purple"
	vim.g.gruvbox_contrast_dark = "hard"
	vim.g.gruvbox_invert_selection = "0"
	vim.opt.background = "dark"
	vim.cmd("colorscheme " .. vim.g.fenagel_colorscheme)
	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end

	hl("SignColumn", {
		bg = "none",
	})

	hl("ColorColumn", {
		ctermbg = 0,
		bg = "#5d5d5d",
	})

	hl("CursorLineNR", {
		bg = "None",
	})

	hl("Normal", {
		ctermbg = "none",
	})

	hl("LineNr", {
		fg = "#5eacd3",
	})

	hl("netrwDir", {
		fg = "#5eacd3",
	})
end

ColorMyPencils()
-- vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
-- vim.cmd("au ColorScheme * hi! Normal ctermbg=none")
-- -- Transparent LSP Float Windows
-- vim.cmd 'au ColorScheme * highlight! normalfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! errorfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! warningfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! infofloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! hintfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! FloatBorder guifg=#aaaaaa guibg=NONE'
