-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   styles = {
--     floats = "transparent",
--     comments = { italic = false },
--     keywords = { italic = false },
--     functions = { italic = false },
--     variables = { italic = false },
--     statements = { italic = false },
--     conditionals = { italic = false },
--     loops = { italic = false },
--     constants = { italic = false },
--     numbers = { italic = false },
--     operators = { italic = false },
--     types = { italic = false },
--   },
--   opts = {
--     style = "night",
--     on_colors = function(colors)
--       colors.comment = "#2ea542"
--     end,
--     transparent = true,
--   },
-- }
-- this is a comment test
return {
  --   -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {
          bright_green = "#a9b665",
          bright_red = "#ea6962",
          bright_orange = "#e78a4e",
          bright_yellow = "#d8a657",
          bright_aqua = "#89b482",
          bright_blue = "#7daea3",
          bright_purple = "#d3869b",
        },
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end,
    opts = {
      on_colors = function(colors)
        colors.comment = "#2ea542"
      end,
    },
  },
  --   {
  --     "f4z3r/gruvbox-material.nvim",
  --     name = "gruvbox-material",
  --     lazy = false,
  --     priority = 1000,
  --     opts = {
  --       on_colors = function(colors)
  --         colors.comment = "#2ea542"
  --       end,
  --       italics = true, -- enable italics in general
  --       contrast = "hard", -- set contrast, can be any of "hard", "medium", "soft"
  --       comments = {
  --         italics = true, -- enable italic comments
  --       },
  --       background = {
  --         transparent = true, -- set the background to transparent
  --       },
  --       float = {
  --         force_background = false, -- force background on floats even when background.transparent is set
  --         background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
  --         -- by the color scheme
  --       },
  --       signs = {
  --         highlight = true, -- whether to highlight signs
  --       },
  --       customize = nil, -- customize the theme in any way you desire, see below what this
  --       -- configuration accepts
  --     },
  --   },

  -- { "wittyjudge/gruvbox-material.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
