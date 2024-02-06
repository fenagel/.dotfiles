return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      local icons = require("config.icons")
      require("gitsigns").setup({
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = icons.ui.TriangleShortArrowRight,
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = icons.ui.BoldLineLeft,
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        status_formatter = nil,
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = { enable = false },
      })
    end,
    keys = {
      {
        "<leader>gg",
        "<cmd>:G<cr>",
        { desc = "Fugitive" },
      },
      {
        "<leader>gk",
        "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
        { desc = "Prev Hunk" },
      },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" } },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" } },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" } },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" } },
      {
        "<leader>gj",
        "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
        { desc = "Next Hunk" },
      },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" } },
      {
        "<leader>gu",
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        { desc = "Undo Stage Hunk" },
      },
      { "<leader>go", require("telescope.builtin").git_status, { desc = "Open changed file" } },
      { "<leader>gb", require("telescope.builtin").git_branches, { desc = "Checkout branch" } },
      { "<leader>gc", require("telescope.builtin").git_commits, { desc = "Checkout commit" } },
      {
        "<leader>gC",
        require("telescope.builtin").git_bcommits,
        { desc = "Checkout commit(for current file)" },
      },
      {
        "<leader>gS",
        "<cmd>Gitsigns diffthis HEAD<cr>",
        { desc = "Git Diff" },
      },
      { "<leader>gU", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" } },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- not git, but it's okay
  "mbbill/undotree",
}
