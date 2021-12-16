local lualine = require "lualine"
local oceanic_next = require "fn.statusline.oceanic_next"

lualine.setup(
  {
    options = {
      theme = oceanic_next
    },
    sections = {
      lualine_a = {""},
      lualine_b = {"branch"},
      lualine_c = {"filename"},
      lualine_x = {"b:gitsigns_status"},
      lualine_y = {"filetype"},
      lualine_z = {
        "location",
        {
          "diagnostics",
          sources = {"nvim_lsp"},
          symbols = {error = " ", warn = " ", info = " "}
        }
      }
    }
  }
)
