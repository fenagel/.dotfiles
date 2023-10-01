return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  opts = function(_, opts)
    opts.formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind]
        end
        return item
      end,
    }
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "NONE", bg = "#000000" })
    vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch]])
    vim.cmd([[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]])
    vim.cmd([[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]])
    vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch]])
    vim.cmd([[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]])
    vim.cmd([[highlight! link CmpItemKindInterface CmpItemKindVariable]])
    vim.cmd([[highlight! link CmpItemKindText CmpItemKindVariable]])
    vim.cmd([[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]])
    vim.cmd([[highlight! link CmpItemKindMethod CmpItemKindFunction]])
    vim.cmd([[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]])
    vim.cmd([[highlight! link CmpItemKindProperty CmpItemKindKeyword]])
    vim.cmd([[highlight! link CmpItemKindUnit CmpItemKindKeyword]])
    -- original LazyVim kind icon formatter
    local format_kinds = opts.formatting.format
    opts.formatting.format = function(entry, item)
      format_kinds(entry, item) -- add icons
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end

    opts.mapping = require("cmp").mapping.preset.insert({
      ["<C-k>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = require("cmp").mapping.select_next_item(), -- next suggestion
      ["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
      ["<C-u>"] = require("cmp").mapping.scroll_docs(4),
      ["<C-Space>"] = require("cmp").mapping.complete(),
      ["<C-e>"] = require("cmp").mapping.abort(),
      ["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
  end,
}
