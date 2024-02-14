local path = vim.fn.expand("$HOME") .. "/code/fenagel/second-brain"

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. path
      .. "/**.md",
    "BufNewFile " .. path .. "/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "FVault",
        -- path = "~/second-brain",
        path = path,
      },
    },
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,

      -- Trigger completion at 2 chars.
      min_chars = 2,

      -- Where to put new notes created from completion. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",

      -- Control how wiki links are completed with these (mutually exclusive) options:
      --
      -- 1. Whether to add the note ID during completion.
      -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
      prepend_note_id = true,
      -- 2. Whether to add the note path during completion.
      -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
      -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
      -- prepend_note_path = true,
      -- 3. Whether to only use paths during completion.
      -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
      -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
      -- use_path_only = false,
    },
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
      tags = "",
    },
    mappings = {
      -- Obsidian follow"
      ["<leader>of"] = {
        action = function()
          require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle checkboxes "Obsidian done"
      ["<leader>od"] = {
        action = function()
          require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
