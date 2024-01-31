return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>m", "<cmd>TroubleToggle<CR>" },
    {
      "<leader>j",
      function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "<leader>k",
      function()
        require("trouble").next({ skip_groups = true, jump = true })
      end,
      desc = "Next trouble item",
    },
  },
}
