return {
  {
    "aserowy/tmux.nvim",
    enabled = true,
    config = function()
      return require("tmux").setup({
        resize = {
          enable_default_keybindings = false,
        },
      })
    end,
  },
}
