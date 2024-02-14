return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  ---@class NoiceConfig
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
          { find = "%d fewer lines" },
          { find = "%d more lines" },
        },
      },
      opts = { skip = true },
    })
    return {
      ---@type NoicePresets
      presets = { inc_rename = true, lsp_doc_border = true },
      ---@type NoiceConfigViews
      views = {
        cmdline_popup = {
          position = {
            row = 7,
            col = "55%",
          },
        },
        cmdline_popupmenu = {
          position = {
            row = 7,
            col = "55%",
          },
        },
      },
    }
  end,
}
