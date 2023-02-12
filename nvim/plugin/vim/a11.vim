
" color scheme list
" solarized
" gruvbox
" dracula
" check if remote connection
if($SSH_CLIENT || $SSH_TTY)
    "set t_Co=256
    set background=dark
    if has("gui_running")
        syntax on
        colorscheme gruvbox
        hi cursorline guibg=#5f0000
        set guifont=DejaVu\ Sans\ Mono\ 10
        set lines=32
        set columns=128
        set mousemodel=popup
        set guioptions+=b
        set guioptions-=m
        set guioptions-=T
    endif
else
    syntax on
    set t_Co=256
    set background=dark
    colorscheme gruvbox
    if has("gui_running")
        hi cursorline guibg=#5f0000
        set guifont=DejaVu\ Sans\ Mono\ 10
        set lines=32
        set columns=128
        set mousemodel=popup
        set guioptions+=b
        set guioptions-=m
        set guioptions-=T
    endif
endif

" self config {
    set nocompatible
    set scrolloff=4  " 4 lines above/below cursor when scrolling
    "set ignorecase  " case insensitive
    "set smartcase   " but become case sensitive if typr uppercase
    "set number      " show line number
    set number relativenumber
    set ruler       " show cursor position in status bar
    set title       " show file in titlebar
    set incsearch
    set hlsearch
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set backspace=2
    set mouse=a
    "set mouse=v
    set showmatch
    set matchtime=2
    set cursorline
    set laststatus=2    "statusline always on
    set encoding=utf-8  " Necessary to show unicode glyphs
    set fileencodings=ucs-bom,utf-8,latin1,chinese
if has('unnamedplus')
    " By default, Vim will not use the system clipboard when yanking/pasting to
    " the default register. This option makes Vim use the system default
    " clipboard.
    " Note that on X11, there are _two_ system clipboards: the "standard" one, and
    " the selection/mouse-middle-click one. Vim sees the standard one as register
    " '+' (and this option makes Vim use it by default) and the selection one as
    " '*'.
    " See :h 'clipboard' for details.
    set clipboard=unnamedplus,unnamed
else
    " Vim now also uses the selection system clipboard for default yank/paste.
    set clipboard+=unnamed
endif
    set updatetime=100
"}


" EOL whitespace
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" ctags {
    set tags=./tags,tags;
"}

" plugin config
" gutentags {
    " enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']

    " config project root markers.
    let g:gutentags_project_root = ['.root', '.git']

    " generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " forbid gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0

    " switch to quickfix window automaticlly
    let g:gutentags_plus_switch=1
"}

" status line config
" Air-line {
"    let g:airline#extensions#tabline#enabled = 1
"}

" tmuxline {
"    let g:tmuxline_powerline_separators = 0
"    let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}
"}

" YCM {
"   let g:ycm_extra_conf_globlist = ['~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
"    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"}

" deoplete {
    let g:deoplete#enable_at_startup = 1
"}

" ALE {
    let g:ale_linters = {
    \   'c':['gcc', 'cppcheck'],
    \   'bash':['shellcheck'],
    \}
    let g:ale_echo_msg_format = '[%linter%][%severity%]%code: %%s'
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_c_gcc_options = '-Wall -O2 -std=gnu99'
    let g:ale_sign_error = 'x'
    let g:ale_sign_warning = '!'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_set_loclist = 0
    "let g:ale_set_quickfix = 1
"}

" FZF {
    "let g:fzf_layout = { 'window': 'enew' }
    "let g:fzf_layout = { 'window': '-tabnew' }
    "let g:fzf_layout = { 'window': '10split enew' }
"}

" Ack and Ag {
    " use ag as the search engine
    if executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif
"}

" Easymotion {
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <leader><leader>h <Plug>(easymotion-linebackward)
    map <leader><leader>j <Plug>(easymotion-j)
    map <leader><leader>k <Plug>(easymotion-k)
    map <leader><leader>l <Plug>(easymotion-lineforward)
    map <leader><leader>. <Plug>(easymotion-repeat)

    " <leader>f{char} to move to {char}
    map  <leader><leader>c <Plug>(easymotion-bd-f)
    nmap <leader><leader>c <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <leader>L <Plug>(easymotion-bd-jk)
    nmap <leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <leader><leader>w <Plug>(easymotion-bd-w)
    nmap <leader><leader>w <Plug>(easymotion-overwin-w)

    " n-char search
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)

    " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    " Without these mappings, `n` & `N` works fine. (These mappings just provide
    " different highlight method and have some other features )
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)
"}

" ultisnips {
"    let g:UltiSnipsExpandTrigger="<c-e>"
"    let g:UltiSnipsJumpForwardTrigger="<c-b>"
"    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"    let g:UltiSnipsEditSplit="horizontal"
"}

" key mapping {
    " current map leadr change to space
    let mapleader="\<Space>"
    noremap <leader>r :new $MYVIMRC<CR>
    noremap <silent> <leader>R :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

    " FZF mapping
    nmap <leader>f :FZF<cr>

    " leaderF mapping
    nmap <leader>F :LeaderfFunction!<cr>

    " Ack,  don't jump to first result automatically
    nnoremap <leader>a :Ack!<Space><C-R>=expand("<cword>")<CR><CR>

    "inoremap <A-h> <C-o>h
    "inoremap <A-j> <C-o>j
    "inoremap <A-k> <C-o>k
    "inoremap <A-l> <C-o>l
    " use jj/hh/hj/jh to switch back to normal mode
    inoremap jj <Esc>
    inoremap hh <Esc>
    inoremap hj <Esc>
    inoremap jh <Esc>

    nmap <C-h> :noh<cr>
    nmap <leader>7 :bp<cr>
    nmap <leader>8 :bn<cr>

    " abt quickfix
    " :cw       open matched window
    " :cclose   close matched window
    nmap <leader>3 :cw<cr>
    nmap <leader>4 :cclose<cr>
    nmap <leader>5 :cp<cr>
    nmap <leader>6 :cn<cr>

    nmap <silent> <leader>e :call <SID>StripTrailingWhitespace()<CR>:exe ":echo 'Strip EOL whitespace'"<CR>
    nmap <leader>wn :match ErrorMsg /\s\+$/<CR>
    nmap <leader>tn :match ErrorMsg /\t/<CR>
"}

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r < ./inp.txt <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>
syntax on
set nu
set clipboard=unnamedplus
set mouse=a
set tabstop=2
set autoindent
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set smartcase
set backspace=indent,eol,start
set t_Co=256
set background=dark
let qq='TEST'
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
autocmd filetype java nnoremap <F5> :w <bar> !javac % && java -enableassertions %:r <CR>
autocmd BufNewFile  *.cpp 0r ~/.vim/template/template.cpp 
autocmd BufNewFile *.c 0r ~/.vim/template/template.c 
autocmd filetype python nnoremap <F5> :w <bar> !python3 % < ./inp.txt <CR>
autocmd filetype perl nnoremap <F5> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <F5> :w <bar> !go build % && ./%:r <CR>

set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>

" CtrlP Stuff

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap ,2  :call AddDependency()<cr>

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
