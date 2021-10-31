lua require("fenagel")

nnoremap <leader>rr :lua require('fenagel.telescope').refactors()<CR>
vnoremap <leader>rr :lua require('fenagel.telescope').refactors()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('fenagel.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('fenagel.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('fenagel.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('fenagel.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>td :lua require('fenagel.telescope').dev()<CR>
