-- highlight keys after f/t
return {
  "jinh0/eyeliner.nvim",
  event = "VeryLazy",
  config = function()
    require("eyeliner").setup({
      highlight_on_key = true,
    })
  end,
}
