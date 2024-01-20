return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({})
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
  "xiyaowong/nvim-transparent",
}
