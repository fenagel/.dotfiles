return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
  keys = function()
    local keys = {
      {
        '<s-m>',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<TAB>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    }

    local harpoon = require 'harpoon'
    vim.keymap.set('n', '<leader>h', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>j', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>k', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>l', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<leader>H', function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set('n', '<leader>J', function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set('n', '<leader>K', function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set('n', '<leader>L', function()
      harpoon:list():replace_at(4)
    end)
    return keys
  end,
}
