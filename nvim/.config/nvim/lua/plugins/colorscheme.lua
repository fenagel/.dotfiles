return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  styles = {
    floats = "transparent",
    comments = { italic = false },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
    statements = { italic = false },
    conditionals = { italic = false },
    loops = { italic = false },
    constants = { italic = false },
    numbers = { italic = false },
    operators = { italic = false },
    types = { italic = false },
  },
  opts = {
    style = "night",
    on_colors = function(colors)
      colors.comment = "#2ea542"
    end,
    transparent = true,
  },
}
-- this is a comment test
