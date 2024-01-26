return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  -- config = true,
  -- enable this for color highlighting in tailwind classes
  opts = {
    user_default_options = {
      tailwind = true,
    },
  },
}
