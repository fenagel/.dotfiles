local vim = vim
local utils = require'fenagel.utils'

local setup_mappings = function()
  -- javascript
  vim.cmd[[autocmd BufWritePre *.cs :lua vim.lsp.buf.formatting_sync()]]
  vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]
  vim.cmd[[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})]]

  -- Base
  utils.key_mapper('n', '<C-f>', '<esc>')
  utils.key_mapper('n', '<C-s>', ':w<CR>')
  utils.key_mapper('i', '<C-s>', '<esc>:w<CR>')
  utils.key_mapper('n', '<leader>u', ':UndotreeShow')

  -- Movement
  utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')
  utils.key_mapper('n', '<leader>h', ':wincmd h<CR>')
  utils.key_mapper('n', '<leader>j', ':wincmd j<CR>')
  utils.key_mapper('n', '<leader>k', ':wincmd k<CR>')
  utils.key_mapper('n', '<leader>l', ':wincmd l<CR>')
  utils.key_mapper('n', '<leader>+', ':vertical resize +5<CR>')
  utils.key_mapper('n', '<leader>-', ':vertical resize -5<CR>')
  utils.key_mapper('n', '<C-S>', ':w<CR>')

  -- Undo breakpoints
  utils.key_mapper('i', ',', ',<c-g>u')
  utils.key_mapper('i', '.', '.<c-g>u')
  utils.key_mapper('i', '!', '!<c-g>u')
  utils.key_mapper('i', '?', '?<c-g>u')

  -- Move Lines
  utils.key_mapper('v', 'J', ':m \'>+1<CR>gv=gv')
  utils.key_mapper('v', 'K', ':m \'<-2<CR>gv=gv')
  utils.key_mapper('n', '<leader>k', ':m .-2<CR>==')
  utils.key_mapper('n', '<leader>j', ':m .+1<CR>==')

  -- keeping the cursor centered
  utils.key_mapper('n', 'n', 'nzzzv')
  utils.key_mapper('n', 'N', 'Nzzzv')
  utils.key_mapper('n', 'J', 'mzJ`z')

  -- Tabs
  utils.key_mapper('n', '<leader>q', ':bp<CR>')
  utils.key_mapper('n', '<leader>e', ':bn<CR>')
  utils.key_mapper('n', '<leader>w', ':bd<CR>')

  -- Telescope
  --utils.key_mapper('n', '<leader>nw', ':Telescope file_browser<CR>')
  utils.key_mapper('n', '<leader>pf', ':lua require"fenagel.telescope".find_files()<CR>')
  utils.key_mapper('n', '<leader>p', ':lua require("fenagel.telescope").git_files()<CR>')
  utils.key_mapper('n', '<leader>fs', ':lua require"fenagel.telescope".live_grep()<CR>')
  utils.key_mapper('n', '<leader>fw', ':lua require"fenagel.telescope".grep_string(vim.fn.expand("<cword>"))<CR>')
  utils.key_mapper('n', '<leader>fh', ':lua require"fenagel.telescope".help_tags()<CR>')
  utils.key_mapper('n', '<leader>fb', ':lua require"fenagel.telescope".buffers()<CR>')
  utils.key_mapper('n', '<leader>fq', ':lua require"fenagel.telescope".quickfix()<CR>')
  utils.key_mapper('n', '<leader>fd', ':lua require"fenagel.telescope".dotfiles()<CR>')

  -- Diagnostics
  utils.key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.key_mapper('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
end

setup_mappings()
