function ColorMyPencils()
  vim.g.gruvbox_contrast_dark = 'hard'

  vim.g.gruvbox_invert_selection = '0'
  vim.opt.background = "dark"

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
  })

  hl("CursorLineNR", {
    bg = "None"
  })

  hl("Normal", {
    bg = "none"
  })

  hl("LineNr", {
    fg = "#5eacd3"
  })

  hl("netrwDir", {
    fg = "#5eacd3"
  })

end

ColorMyPencils()
-- vim.cmd 'au ColorScheme * hi! Normal guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! SignColumn guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! LineNr guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! CursorLineNr guibg=NONE'
-- vim.cmd 'au ColorScheme * hi! Normal ctermbg=none'
-- -- Transparent LSP Float Windows
-- vim.cmd 'au ColorScheme * highlight! normalfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! errorfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! warningfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! infofloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! hintfloat guibg=none'
-- vim.cmd 'au ColorScheme * highlight! FloatBorder guifg=#aaaaaa guibg=NONE'
-- vim.g.nightflyTransparent = 1
-- vim.cmd [[colorscheme nightfly]]
-- require('nightfox').setup({
--   options = {
--     transparent = true,
--   }
-- })
-- vim.cmd [[colorscheme nightfox]]
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_colors = {
  bg_float = "none"
}
vim.cmd [[colorscheme tokyonight]]

-- local poimandres = require("poimandres")
-- poimandres.setup({
--   disable_background = true,
--   disable_float_background = true,
-- })
-- vim.cmd('colorscheme poimandres')
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd 'au ColorScheme * hi! Normal guibg=none'
-- vim.g.gruvbox_invert_selection = '0'
-- require("catppuccin").setup({
--   transparent_background = true,
--   coc_nvim = false,
--   lsp_trouble = false,
--   cmp = true,
--   lsp_saga = true,
--   gitgutter = false,
--   gitsigns = true,
--   telescope = true,
--   dashboard = true,
--   neogit = true,
--   symbols_outline = true,
--   nvimtree = {
--     enabled = true,
--     show_root = false,
--     transparent_panel = false,
--   }
-- })
--
