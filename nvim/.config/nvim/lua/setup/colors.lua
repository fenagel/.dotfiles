vim.g.fenagel_colorscheme = "gruvbox"

function ColorMyPencils()
  -- vim.g.gruvbox_contrast_dark = 'hard'
  -- vim.g.tokyonight_transparent_sidebar = false
  -- vim.g.tokyonight_transparent = false
  -- vim.g.catppuccin_flavour = "macchiato"
  -- require('catppuccin').setup({
  --   transparent_background = true
  -- })
  -- vim.g.tokyonight_colors = {
  --   bg_float = "none"
  -- }
  -- vim.g.gruvbox_invert_selection = '0'
  -- vim.opt.background = "dark"

  vim.cmd("colorscheme " .. vim.g.fenagel_colorscheme)

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
