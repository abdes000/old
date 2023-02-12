

" Basic {{{
set nocompatible
syntax on
filetype plugin indent on
let mapleader = " "
let g:mapleader = " "
set exrc
set number
set relativenumber
set wildmenu
set wildmode=full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set guicursor=
set history=5000
set noerrorbells
set formatoptions-=cro
set foldlevel=99
set foldmethod=indent
set smartindent
set splitbelow
set splitright
set nowrap
" }}}

" Tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}

" Backup & Swap {{{
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" }}}

" Search {{{
set incsearch
set nohlsearch
set smartcase
set ignorecase
" }}}

" Visual {{{
set cursorline
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:bluedrake_256=1
let g:molokai_original = 0
set termguicolors
set scrolloff=8
set signcolumn=yes
" colorscheme solarized
" colorscheme PaperColor
" colorscheme molokai
" colorscheme simple-dark
" colorscheme gruvbox
" colorscheme lucius
" let g:airline_theme='lucius'
"}}}

" Syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_shell = "/bin/sh"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open  = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_debug=0
" let g:syntastic_puppet_puppetlint_quiet_messages = { "level" : "warnings" }
" }}}

" NERDTree settings {{{
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=0
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.zip$', '\.pdf$', '\.jpg$', '\.doc$', '\.xls.$']
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" Mapping {{{
set pastetoggle=<F2>
nnoremap <F5> :UndotreeToggle<CR>
nmap <leader>w :w!<cr>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Leader>e :e $MYVIMRC<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>
" }}}

" Navigation {{{
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Buffer Navigation
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-l> :bnext<CR>
" }}}

" augroups {{{
augroup default
    autocmd!
    autocmd FileType * setlocal background=dark
    " autocmd FileType * colo simple-dark
augroup END

augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    " autocmd BufWritePost ~/.vimrc    source ~/.vimrc
    autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
    autocmd BufWritePost augroup.vim so ~/.vim/augroup.vim
augroup END

augroup whitespace
    autocmd!
    autocmd BufWritePre * :call DeleteTrailingWS()
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown set textwidth=80
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal background=light
    autocmd FileType markdown colo lucius
    autocmd FileType markdown setlocal conceallevel=2
augroup END
" }}}

" Functions {{{
" -------------------------
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Make VIM remember position in file after reopen
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}


filetype plugin indent on
syntax enable

let mapleader = ","
let maplocalleader = "-"

let g:afterglow_blackout=1
" colorscheme harlequin
set termguicolors

" set background=light

" tab settings -------------------------------------------------------------->
set autoindent " Uses indent from current line as indent for new line
set expandtab " Inserts spaces instead of actual tabs
set shiftwidth=4 " The number of columns to use when auto-indenting lines
set tabstop=4 " Determines the number of columns to use when showing actual
              " tab characters
" set softtabstop=4 " Determines the number of columns that will be inserted or
                  " deleted when you hit the tab key. Will use a mixture of
                  " spaces and tabs when expandtab is not set.
set smarttab " Uses the value of shiftwidth when inserting or deleting tabs
             " at the beginnings of lines (in more practical terms, it allows
             " you to treat tabs that were expanded into spaces as tabs, but
             " only when they are at the beginning of a line).
             " When using softtabstop and expand tab, smarttab doesn't need
             " to be used
" From my understand, the fundamental difference between tabstop and
" softtabstop is that tabstop determines the behavior of actual tab characters
" (<Tab>). If neither expandtab nor softtabstop are set, then using the tab
" key will just insert the <Tab> character and use the value of tabstop to
" determine how wide the tab will be.
" On the other hand, softtabstop takes over when the tab key on your keyboard
" is pressed. If your softtabstop is set to 4 and tabstop is set to 8, then
" hitting tab will insert 4 columns for you (the value of softtabstop).
" However, since this isn't enough to be a tab character, it will use spaces
" to achieve those 4 columns.
" <---------------------------------------------------------------------------

" See :help 'option' for details on any option below

set rnu
set bs=2
set laststatus=2
set hidden
set list
set listchars=tab:>\ ,trail:.
set incsearch
set hlsearch
set ignorecase
set smartcase
set mouse=
set splitbelow
set splitright
" set noswapfile
set completeopt=menu,preview
set complete-=t,i
" set colorcolumn=80
set wildmenu
set formatoptions+=j
" set cursorline
" set cursorcolumn
set nojoinspaces
set modeline

set statusline=%f\ %m%r " filename, modified flag, and readonly flag
set statusline+=%= " left/right separator
set statusline+=[%{strlen(&ft)?&ft:'none'}] " filetype
set statusline+=[%{&ff}] " file format (ie. line endings)
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " encoding
set statusline+=\ \|\ " a separator
set statusline+=col\ %c\  " column number
set statusline+=line\ %l\ of\ %L " line number
" for more about customizing the status bar, see
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html

" autocmd BufEnter * set list " make sure visual whitespace is always shown

set conceallevel=0
set history=2000


" jump to last position on previous close
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

autocmd FileType php set keywordprg=pman

" Start in insert mode when using the command window. See :help q:
autocmd CmdwinEnter [/?]  startinsert

" general key mappings --------------------------------------------------------

nnoremap <Leader>p :set paste<cr>
nnoremap <Leader>P :set nopaste<cr>
nmap <leader>l :e#<cr>

" Change 'Y' to copy to end of line to be similar to D and C
nnoremap Y y$

" Keys for more efficient saving
nmap <F12> :wa<CR>

" line movement mappings from http://vim.wikia.com/wiki/Moving_lines_up_or_down
" Use Alt-j or Alt-k to move lines up or down, respectively
" The "execute" lines based on: https://stackoverflow.com/a/27206531/683436
if !has('nvim')
    execute "set <M-j>=\ej"
    execute "set <M-k>=\ek"
endif
nnoremap <M-j> :m+<CR>==
inoremap <M-j> <Esc>:m+<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=gv
nnoremap <M-k> :m-2<CR>==
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-k> :m-2<CR>gv=gv

" Proper Ctrl+C -> Esc map
map <C-c> <Esc>
imap <C-c> <Esc>

" Remove trailing whitespace
nmap <Leader>w :%s/\s\+$//<CR>

" Will put you insert mode on the next line (like doing just 'o', but will
" also put an extra blank line below this new line.
nnoremap <Leader>o o<esc>O

autocmd BufNewFile,BufRead *.clj,*.c,*.html,*.js,*.coffee,*.json,*.rb,*.tf,*.tfvars,*.vue setlocal shiftwidth=2
autocmd BufNewFile,BufRead Makefile,*.php,*.go setlocal noexpandtab
autocmd BufNewFile,BufRead *.pp,Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.edn set filetype=clojure
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.ino set filetype=c
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.sibilant set filetype=lisp
" autocmd BufEnter * setlocal cursorline
" autocmd BufLeave * setlocal nocursorline
" autocmd InsertEnter * set nocursorline
" autocmd InsertLeave * set cursorline
autocmd BufWritePre * :%s/\s\+$//e

" -----------------------------------------------------------------------------
" from https://stackoverflow.com/a/25327689/683436
" use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
let &t_EI = "\<Esc>]12;red\x7"

" from https://stackoverflow.com/a/42118416/683436
" Change cursor in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" -----------------------------------------------------------------------------
" Plugin settings and mappings
" -----------------------------------------------------------------------------

" NERDTree settings and mappings
let NERDTreeIgnore=['\.swp$', '\.orig$', '\.pyc$', '\.class$', '__pycache__',
                \   '\.swo$', '\.sass-cache', '\.egg-info', '^node_modules$', '^dist$',
                \   '\local-m2']
let NERDTreeShowHidden=1 " show hidden files
let NERDTreeChDirMode=2 " change directory whenever NERDTree does
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
nnoremap <F5> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

let g:ftplugin_sql_omni_key = '<C-j>'

" bufexplorer ----------------------------------------------------------------
let g:bufExplorerShowRelativePath=1

" ctrlp ----------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.venv$\|build$\|\.compiled$\|\.awesomo$\|node_modules$\|bower.*$\|\.cljs_rhino_repl\|target\|\.pelican\.*\|berks-cookbooks\|venv\|local-m2\|mdapi_output_dir',
    \ 'file': '\.swp$\|\.pyc$\|resources.*compiled',
    \ }
" let g:ctrlp_by_filename = 1 " default to filename search instead of full path
" let g:ctrlp_regexp = 1 " default to regexp search
let g:ctrlp_working_path_mode = 0

" surround -------------------------------------------------------------------
let g:surround_no_insert_mappings = 1

" taglist --------------------------------------------------------------------
let Tlist_Use_Right_Window = 1 " place taglist window on the right
let Tlist_Display_Prototype = 1 " show prototypes instead of tags
" mapping to open taglist
nmap <F7> :TlistToggle<CR>

" UltiSnips ------------------------------------------------------------------
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "bucks_snippets"]
let g:UltiSnipsExpandTrigger = "<c-g>"
let g:UltiSnipsJumpForwardTrigger = "<c-g>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" neomake --------------------------------------------------------------------
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_python_pep8_exe = 'python3'

" Tagbar ---------------------------------------------------------------------
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" indentLine -----------------------------------------------------------------
let g:indentLine_fileType = ['json']
let g:indentLine_char = '⎸'
let g:indentLine_concealcursor = ""
let g:indentLine_conceallevel=0

" vim-tmux-navigator ---------------------------------------------------------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-n> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" more tmux integration
nmap <leader>. :!tmux send-keys -t :0.1 C-p C-j <CR><CR>

function! ClojureClasspath()
    let l:classpath = system("lein classpath")
    let g:JavaComplete_LibsPath = l:classpath
endfunction

" jedi -----------------------------------------------------------------------
let g:jedi#rename_command = ""

" vim-iced -------------------------------------------------------------------
let g:iced#buffer#stdout#mods = "vertical"
let g:iced_enable_auto_indent = v:false
let g:iced_formatter = "zprint"

" terraform ------------------------------------------------------------------
" let g:terraform_fold_sections = 1
let g:terraform_remap_spacebar = 1
let g:terraform_fmt_on_save = 1
autocmd FileType terraform setlocal commentstring=#%s

let g:clj_fmt_autosave = 0


let g:rainbow_active = 1

" vim-fireplace - run test under expression
nmap cps :.RunTests<cr>

let g:iced_enable_default_key_mappings = v:true
let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded = v:true

" nmap <buffer> <Leader>e! <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_list)``





aug MyClojureSetting
  au!
  au FileType clojure nmap <buffer> <Leader>epe
      \ <Plug>(iced_eval_and_print)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>ept
      \ <Plug>(iced_eval_and_print)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>eae
      \ <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>eat
      \ <Plug>(iced_eval_and_tap)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>ere
      \ <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>ert
      \ <Plug>(iced_eval_and_replace)<Plug>(sexp_outer_top_list)``

  au FileType clojure nmap <buffer> <Leader>ece
      \ <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_list)``
  au FileType clojure nmap <buffer> <Leader>ect
      \ <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_top_list)``
aug END


map gF :e <cfile><CR>
