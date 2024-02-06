local telescope_git_or_file = function()
  local path = vim.fn.expand("%:p:h")
  local git_dir = vim.fn.finddir(".git", path .. ";")
  if #git_dir > 0 then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end
local function formattedName(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return {
  "telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        pickers = {
          find_files = {
            previewer = false,
            path_display = formattedName,
            layout_config = {
              height = 0.4,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
          git_files = {
            previewer = false,
            path_display = formattedName,
            layout_config = {
              height = 0.4,
              prompt_position = "top",
              preview_cutoff = 120,
            },
          },
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },
          n = {
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["q"] = actions.close,
          },
        },
      },
    }
  end,
  keys = {
    { "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>" },
    {
      "<C-p>",
      function()
        telescope_git_or_file()
      end,
      desc = "Find Files",
    },
  },
}
