" Vim-Kitty Navigator Integration
" Add this to your .vimrc or init.vim

" Navigate between vim splits and kitty windows seamlessly
" Using backtick sequences to avoid conflicts with common shell commands

" Navigate left
nnoremap <silent> <C-`>h :TmuxNavigateLeft<CR>
" Navigate down
nnoremap <silent> <C-`>j :TmuxNavigateDown<CR>
" Navigate up
nnoremap <silent> <C-`>k :TmuxNavigateUp<CR>
" Navigate right
nnoremap <silent> <C-`>l :TmuxNavigateRight<CR>

" Alternative: If you want to use the vim-kitty-navigator plugin
" Install it first with your plugin manager:
" Plug 'knubie/vim-kitty-navigator'
"
" Then configure it to use the same backtick keybindings:
" let g:kitty_navigator_no_mappings = 1
" nnoremap <silent> <C-`>h :KittyNavigateLeft<CR>
" nnoremap <silent> <C-`>j :KittyNavigateDown<CR>
" nnoremap <silent> <C-`>k :KittyNavigateUp<CR>
" nnoremap <silent> <C-`>l :KittyNavigateRight<CR>
