local silent = { silent = true }

local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup({})
vim.keymap.set("n", "<leader>er", function() require("harpoon.mark").add_file() end, silent)
vim.keymap.set("n", "<leader>x", function() require("harpoon.ui").toggle_quick_menu() end, silent)
vim.keymap.set("n", "<leader>ea", function() require("harpoon.ui").nav_file(1) end, silent)
vim.keymap.set("n", "<leader>es", function() require("harpoon.ui").nav_file(2) end, silent)
vim.keymap.set("n", "<leader>ed", function() require("harpoon.ui").nav_file(3) end, silent)
vim.keymap.set("n", "<leader>ef", function() require("harpoon.ui").nav_file(4) end, silent)
