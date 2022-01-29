-- Nightfox config
local nightfox = require("nightfox")
nightfox.setup({
  fox = "nightfox",
  transparent = true, -- Disable setting the background color
  alt_nc = true,
  terminal_colors = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    visual = true,
    search = true,
    match_paren = true,
  },
  colors = {
    bg         = "#192330",

    fg         = "#F8F1FF",
    fg_gutter  = "#6d6d6d",

    black      = "#15141b",
    red        = "#ff6767",
    green      = "#0AFFAD",
    yellow     = "#ffca85",
    blue       = "#82e2ff",
    magenta    = "#a277ff",
    cyan       = "#0AFFAD",
    white      = "#edecee",
    orange     = "#ffca85",
    pink       = "#f694ff",

    black_br      = "#15141b",
    red_br        = "#ff6767",
    green_br      = "#0AFFAD",
    yellow_br     = "#ffca85",
    blue_br       = "#82e2ff",
    magenta_br    = "#a277ff",
    cyan_br       = "#0AFFAD",
    white_br      = "#f8f1ff",
    orange_br     = "#ffca85",
    pink_br       = "#f694ff",

    -- -15 brightness -15 saturation
    black_dm      = "#15141b",
    red_dm        = "#ff6767",
    green_dm      = "#0AFFAD",
    yellow_dm     = "#ffca85",
    blue_dm       = "#82e2ff",
    magenta_dm    = "#a277ff",
    cyan_dm       = "#0AFFAD",
    white_dm      = "#f8f1ff",
    orange_dm     = "#ffca85",
    pink_dm       = "#f694ff",

    comment    = "#526175",

    git = {
      add      = "#0AFFAD",
      change   = "#ffca85",
      delete   = "#ff6767",
      conflict = "#f694ff",
    },

    gitSigns = {
      add    = "#164846",
      change = "#394b70",
      delete = "#823c41",
    },
  },
})
nightfox.load()
-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override

