return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view_options = { show_hidden = true },
  },
  init = function()
    local oil = require("oil")
    vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })

    -- vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
