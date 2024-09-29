-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- disable completion on markdown files by default
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    require("cmp").setup({ enabled = false })
  end,
})

-- Set textwidth to 80 and automatic line breaks for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "pandoc" },
  callback = function()
    require("cmp").setup({ enabled = false })
    vim.opt_local.textwidth = 80
    -- vim.opt_local.formatoptions:append("a")
    vim.opt_local.colorcolumn = "80"
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- change the background color of floating windows and borders.
    -- vim.cmd('highlight NormalFloat guibg=none guifg=none')
    -- vim.cmd('highlight FloatBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight NormalNC guibg=none guifg=none')

    -- vim.cmd('highlight TelescopeBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopePromptBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopeResultsBorder guifg=' .. colors.fg .. ' guibg=none')
    --
    -- vim.cmd('highlight TelescopePromptTitle guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopeResultsTitle guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopePreviewTitle guifg=' .. colors.fg .. ' guibg=none')
    --

    -- change neotree background colors
    -- Default: NeoTreeNormal  xxx ctermfg=223 ctermbg=232 guifg=#d4be98 guibg=#141617
    -- vim.cmd('highlight NeoTreeNormal guibg=#252e33 guifg=none')
    -- vim.cmd('highlight NeoTreeFloatNormal guifg=none guibg=none')
    -- vim.cmd('highlight NeoTreeFloatBorder gui=none guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight NeoTreeEndOfBuffer guibg=#252e33') -- 1d2021

    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

    vim.cmd("highlight Winbar guibg=none")

    -- vim.cmd("highlight Comment guifg=#475558")
    -- vim.cmd("highlight Comment guifg=green")
  end,
})

-- wrap and check for spell in text filetypes
-- added to disable spelling
vim.api.nvim_create_autocmd("FileType", {
  -- group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "pandoc" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd("filetype", {
  -- group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "pandoc" },
  command = "set nospell",
})

-- Go related

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd("filetype", {
  -- group = augroup("wrap_spell"),
  pattern = { "go" },
  command = 'lua require("cmp").setup { enabled = true }',
})
