-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     local lualine = require 'lualine'
--     local lazy_status = require 'lazy.status' -- to configure lazy pending updates count
--
--     -- local colors = {
--     --   blue = "#65D1FF",
--     --   green = "#3EFFDC",
--     --   violet = "#FF61EF",
--     --   yellow = "#FFDA7B",
--     --   red = "#FF4A4A",
--     --   fg = "#c3ccdc",
--     --   bg = "#112638",
--     --   inactive_bg = "#2c3043",
--     -- }
--     --
--     -- local my_lualine_theme = {
--     --   normal = {
--     --     a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
--     --     b = { bg = colors.bg, fg = colors.fg },
--     --     c = { bg = colors.bg, fg = colors.fg },
--     --   },
--     --   insert = {
--     --     a = { bg = colors.green, fg = colors.bg, gui = "bold" },
--     --     b = { bg = colors.bg, fg = colors.fg },
--     --     c = { bg = colors.bg, fg = colors.fg },
--     --   },
--     --   visual = {
--     --     a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
--     --     b = { bg = colors.bg, fg = colors.fg },
--     --     c = { bg = colors.bg, fg = colors.fg },
--     --   },
--     --   command = {
--     --     a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
--     --     b = { bg = colors.bg, fg = colors.fg },
--     --     c = { bg = colors.bg, fg = colors.fg },
--     --   },
--     --   replace = {
--     --     a = { bg = colors.red, fg = colors.bg, gui = "bold" },
--     --     b = { bg = colors.bg, fg = colors.fg },
--     --     c = { bg = colors.bg, fg = colors.fg },
--     --   },
--     --   inactive = {
--     --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
--     --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
--     --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
--     --   },
--     -- }
--
--     -- configure lualine with modified theme
--     lualine.setup {
--       -- options = {
--       --   theme = my_lualine_theme,
--       -- },
--       sections = {
--         lualine_x = {
--           {
--             lazy_status.updates,
--             cond = lazy_status.has_updates,
--             color = { fg = '#ff9e64' },
--           },
--           { 'encoding' },
--           { 'fileformat' },
--           { 'filetype' },
--         },
--       },
--     }
--   end,
-- }

-- adibana lualinereturn {
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'meuter/lualine-so-fancy.nvim',
  },
  enabled = true,
  lazy = false,
  event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
  config = function()
    -- local icons = require("config.icons")
    require('lualine').setup {
      options = {
        theme = 'auto',
        -- theme = "catppuccin",
        globalstatus = true,
        icons_enabled = true,
        -- component_separators = { left = "│", right = "│" },
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {
            'alfa-nvim',
            'help',
            'neo-tree',
            'Trouble',
            'spectre_panel',
            'toggleterm',
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          'fancy_branch',
        },
        lualine_c = {
          {
            'filename',
            path = 1, -- 2 for full path
            symbols = {
              modified = '  ',
              -- readonly = "  ",
              -- unnamed = "  ",
            },
          },
          { 'fancy_diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ' } },
          { 'fancy_searchcount' },
        },
        lualine_x = {
          'fancy_lsp_servers',
          'fancy_diff',
          'progress',
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        -- lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'neo-tree', 'lazy' },
    }
  end,
}
