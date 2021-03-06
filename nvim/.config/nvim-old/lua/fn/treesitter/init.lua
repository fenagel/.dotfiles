local ts = require "nvim-treesitter.configs"

ts.setup {
  context_commentstring = {enable = true},
  ensure_installed = "maintained",
  ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = {enable = false},
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"}
  }
}
