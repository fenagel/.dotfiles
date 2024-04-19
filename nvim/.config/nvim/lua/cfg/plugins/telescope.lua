return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local transform_mod = require('telescope.actions.mt').transform_mod

    local trouble = require 'trouble'
    local trouble_telescope = require 'trouble.providers.telescope'

    -- or create your custom action
    local custom_actions = transform_mod {
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle 'quickfix'
      end,
    }

    telescope.setup {
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ['<C-t>'] = trouble_telescope.smart_open_with_trouble,
          },
          n = {
            ['j'] = actions.move_selection_next,
            ['k'] = actions.move_selection_previous,
            ['q'] = actions.close,
            ['<C-t>'] = trouble_telescope.smart_open_with_trouble,
          },
        },
        layout_config = {
          prompt_position = 'top',
          preview_cutoff = 120,
        },
        file_ignore_patterns = { 'node_modules', 'package-lock.json' },
        initial_mode = 'insert',
        select_strategy = 'reset',
        sorting_strategy = 'ascending',
      },
    }

    telescope.load_extension 'fzf'

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require 'telescope.builtin'

    keymap.set('n', '<leader>F', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' })
    -- keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
    keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd' })
    -- keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
    keymap.set('n', '<leader>t', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })
    keymap.set('n', '<leader>k', '<cmd>Telescope keymaps<cr>', { desc = 'Find keymaps' })
    keymap.set('n', '<leader>p', builtin.lsp_document_symbols, { desc = 'Find symbols' })
  end,
}
