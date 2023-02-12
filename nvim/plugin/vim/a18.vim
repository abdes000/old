
"seven1
let g:yankring_clipboard_monitor=0              " don't worry about the system clipboard, thanks YankRing
let g:yankring_n_keys = 'Y D'                   " by default: 'Y D x X', but I don't like x and X adding chars to my yank history
nnoremap x "_x
nnoremap X "_X

let mapleader=" "                               " set <space> as the leader for mappings
nnoremap <space> <nop>

let g:ctrlp_map = '<leader>jf'                  " open ctrl-p fuzzy finder (mnemonic: 'jump file')
nnoremap <Leader>jt :CtrlPTag<CR>
nnoremap <Leader>jb :CtrlPBuffer<CR>
nnoremap <Leader>jj <c-]>

let g:any_jump_disable_default_keybindings = 1  " open AnyJump (mnemonic: 'jump definition')
nnoremap <leader>jd :AnyJump<CR>
xnoremap <leader>jd :AnyJumpVisual<CR>

if has("nvim")
  set inccommand=nosplit                        " show substitutions incrementally
endif

" make escape work in terminal
tnoremap <Esc> <C-\><C-n>

" buffer and window mappings
nmap <leader>w <c-w>
nmap <leader><tab> <c-^>
nmap <leader>wa <c-w>v:A<CR>
nmap <leader>wC :w \| %bd \| e#<CR>

" git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gph :Gpush<CR>
nmap <leader>gpl :Gpull<CR>

" undo tree
nmap <leader>u :MundoToggle<CR>

" move line mappings
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

" ignore certain patterns when completing file names
set wildignore+=*/node_modules/*,*/tmp/*,*/target/*,*/build/*

" auto format code
au BufWrite *.rs,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
au User ALEFixPost :w
let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'] }
let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'], 'javascript': ['prettier'], 'ruby': ['rubocop', 'standardrb'] }
let g:ale_ruby_rubocop_executable = "bundle"
let g:ale_ruby_standardrb_executable = "bundle"
let g:prettier#exec_cmd_async = 1

" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" custom extensions for file types
autocmd BufNewFile,BufRead *.mal set syntax=lisp filetype=lisp








