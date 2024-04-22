return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-tree/nvim-web-devicons',
    'folke/todo-comments.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
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
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    -- keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    keymap.set('n', '<leader>k', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    keymap.set('n', '<leader>F', builtin.find_files, { desc = '[S]earch [F]iles' })
    -- keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    -- keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    keymap.set('n', '<leader>s', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    keymap.set('n', '<leader>d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    -- keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    keymap.set('n', '<leader>f', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    -- keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files' })
    -- keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
    keymap.set('n', '<leader>t', '<cmd>TodoTelescope<cr>', { desc = 'Find todos' })
    keymap.set('n', '<leader>p', builtin.lsp_document_symbols, { desc = 'Find symbols' })
  end,
}
