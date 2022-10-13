local ls = require "luasnip"
local types = require "luasnip.util.types"

require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
  -- this tells luasnip to remember to keep around the last snippet.
  -- you can jump back into it even if you move outside of the selection
  history = true,

  -- this one is cool because if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- autosnippets:
  enable_autosnippets = true,

  -- crazy highlights!!
  -- ext_opts = nil
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<--", "Error" } },
      },
    },
  }
}

ls.snippets = {
  all = {
    -- Available in any filetype
    ls.parser.parse_snippet("expand", "-- this is what was expanded")
  },

  lua = {
    -- Lua specific snippets go here
    ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0 \nend"),
  }
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
