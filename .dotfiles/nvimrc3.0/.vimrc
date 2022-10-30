nnoremap <C-x><C-f> :<cr>
nnoremap <leader>fc :<cr>
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set isfname+=@-@
set ls=0
set cmdheight=1
set updatetime=50
set shortmess+=c
set colorcolumn=80
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cursorline
set directory=/tmp//,.
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set modelines=2
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set regexpengine=1
set ruler
set scrolloff=0
set shiftwidth=2
set showcmd
set showmatch
set shortmess+=c
set showmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
if !has('nvim')
  set ttymouse=sgr
endif
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap
runtime! macros/matchit.vim
set path+=**
set paste
set pastetoggle=<C-v>
set ww=b,s
set nostartofline
set path=.,,
set cd=,,
set ws
set incsearch
set regexpengine=0
set ignorecase
set smartcase
set cmp=internal,keepascii
set mmp=1000
set define=^\\s*#\\s*define
set inex=
set tbs
set tag=./tags,tags
set tagcase=followic
set scroll=7
set scrolloff=7
set nowrap
set linebreak
set nobreakindent
set briopt=
set sidescroll=0
set sidescrolloff=0
set dy=truncate
set cmdheight=1
set lazyredraw
set redrawtime=2000
set wd=0
set list
set number
set background=dark
set ft=
syntax on
set smc=3000
set nohlsearch
set colorcolumn=100
set spell
set cursorcolumn
set cursorline
set spelllang=en
set laststatus=1
set statusline=
set winheight=1
set sb
set spr
set scb
set crb
set ttyfast
set mouse=a
set shortmess+=c
set noshowmode
set ruler
set verbose=0
set noerrorbells
set clipboard=unnamedplus
set undodir=.undodir
set tabstop=4
set shiftwidth=4
set softtabstop=4
set vartabstop=4
set vsts=4
set smarttab
set expandtab
set autoindent
set smartindent
set cindent
set cinwords=if,else,while,do,for,switch
set pi
set ci
set fen
set fdl=0
set fdls=-1
set fdc=0
set fdt=foldtext()
set fdm=manual
set fde=0
set diff
set dip=internal,filler,closeoff
set remap
set to
set ttimeout
set tm=1000
set ttm=1000
set eol
set ml
set bin
set ff=unix
set ffs=dos,unix
set write
set nobackup
set autoread
set swf
set wim=full
set wmnu
set fic
set cwh=7
set wic
set shell=bash
set warn
set ssl
set encoding=utf-8
set emo
set secure
set exrc
set wildmode=longest,list,full
set wildmenu
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*



call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline-segments'
Plug 'vim-airline/vim-airline-status'
Plug 'vim-airline/vim-airline-colorizer'
Plug 'vim-airline/vim-airline-fonts'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/taglist.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'aben20807/vim-runner'
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'vim-test/vim-test'
Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'flazz/vim-colorschemes'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'yggdroot/indentline'
Plug 'sirver/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'shougo/unite.vim'
Plug 'rking/ag.vim'
Plug 'raimondi/delimitmate'
Plug 'davidhalter/jedi-vim'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'othree/html5.vim'
Plug 'shougo/vimproc.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-unimpaired'
Plug 'dispatch/vim-dispatch'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call plug#end()



"configuration
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0





"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-c> :NERDTreeClose<CR>
nnoremap <C-o> :NERDTreeOpen<CR>
nnoremap <C-s> :NERDTreeFindUp<CR>
nnoremap <C-r> :NERDTreeRefresh<CR>
nnoremap <C-a> :NERDTreeCollapseAll<CR>
nnoremap <C-m> :NERDTreeMark<CR>
nnoremap <C-u> :NERDTreeUnmark<CR>
nnoremap <C-p> :NERDTreePromptExpand<CR>
nnoremap <C-l> :NERDTreePromptFind<CR>
nnoremap <C-d> :NERDTreePromptFindDown<CR>
nnoremap <C-u> :NERDTreePromptFindUp<CR>
nnoremap <C-e> :NERDTreePromptExpand<CR>
nnoremap <C-m> :NERDTreeMark<CR>
nnoremap <C-u> :NERDTreeUnmark<CR>
nnoremap <C-p> :NERDTreePromptExpand<CR>
nnoremap <C-l> :NERDTreePromptFind<CR>
nnoremap <C-d> :NERDTreePromptFindDown<CR>
nnoremap <C-u> :NERDTreePromptFindUp<CR>
nnoremap <C-e> :NERDTreePromptExpand<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>







"gitgutter
let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)
let g:gitgutter_sign_width = 1   " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_sign_width = 2   " default value (otherwise)
let g:gitgutter_sign_text = ' ' " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_sign_text = ' ' " default value (otherwise)
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'M'
let g:gitgutter_sign_deleted = '-'
let g:gitgutter_sign_conflict = 'C'
let g:gitgutter_sign_untracked = '?'
let g:gitgutter_sign_staged = 'S'
let g:gitgutter_sign_staged_deleted = 'D'
let g:gitgutter_sign_staged_conflict = 'C'
let g:gitgutter_sign_staged_modified = 'M'
let g:gitgutter_sign_staged_untracked = '?'
let g:gitgutter_sign_staged_new = 'A'
let g:gitgutter_sign_staged_new_modified = 'AM'
let g:gitgutter_sign_staged_new_deleted = 'AD'
let g:gitgutter_sign_staged_new_conflict = 'AC'
let g:gitgutter_sign_staged_new_untracked = 'A?'
let g:gitgutter_sign_staged_new_modified_untracked = 'AM?'
let g:gitgutter_sign_staged_new_deleted_untracked = 'AD?'
let g:gitgutter_sign_staged_new_conflict_untracked = 'AC?'
let g:gitgutter_sign_staged_new_modified_conflict = 'AMC'
let g:gitgutter_sign_staged_new_deleted_conflict = 'ADC'
let g:gitgutter_sign_staged_new_modified_deleted = 'AMD'
let g:gitgutter_sign_staged_new_deleted_modified = 'ADM'
let g:gitgutter_sign_staged_new_modified_conflict = 'AMC'
let g:gitgutter_sign_staged_new_deleted_conflict = 'ADC'
let g:gitgutter_sign_staged_new_modified_deleted_conflict = 'AMD?'
let g:gitgutter_sign_staged_new_deleted_modified_conflict = 'ADM?'
let g:gitgutter_sign_staged_new_modified_deleted_untracked = 'AMD?'
let g:gitgutter_sign_staged_new_deleted_modified_untracked = 'ADM?'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
let g:gitgutter_show_msg_on_hunk_jumping = 0
let g:gitgutter_show_msg_on_line_change = 0
let g:gitgutter_show_msg_on_line_delete = 0
let g:gitgutter_show_msg_on_line_add = 0
let g:gitgutter_show_msg_on_line_untracked = 0
let g:gitgutter_show_msg_on_line_modified = 0
let g:gitgutter_show_msg_on_line_staged = 0
let g:gitgutter_show_msg_on_line_staged_deleted = 0
let g:gitgutter_show_msg_on_line_staged_conflict = 0
let g:gitgutter_show_msg_on_line_staged_modified = 0
let g:gitgutter_show_msg_on_line_staged_untracked = 0
let g:gitgutter_show_msg_on_line_staged_new = 0
let g:gitgutter_show_msg_on_line_staged_new_modified = 0
let g:gitgutter_show_msg_on_line_staged_new_deleted = 0
let g:gitgutter_show_msg_on_line_staged_new_conflict = 0
let g:gitgutter_show_msg_on_line_staged_new_untracked = 0
command! Gqf GitGutterQuickFix | copen
command! GqfNext GitGutterQuickFixNext | copen
command! GqfPrev GitGutterQuickFixPrev | copen
command! GqfNextHunk GitGutterQuickFixNextHunk | copen
command! GqfPrevHunk GitGutterQuickFixPrevHunk | copen
command! GqfNextLine GitGutterQuickFixNextLine | copen
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
let g:gitgutter_map_keys = 0
let g:gitgutter_ignore_whitespace = 1
let g:gitgutter_diff_options = '-w'
let g:gitgutter_diff_options = '-w --ignore-space-at-eol'
let g:gitgutter_diff_options = '-w --ignore-space-at-eol --ignore-blank-lines'
let g:gitgutter_diff_options = '-w --ignore-space-at-eol --ignore-blank-lines --ignore-space-change'
let g:gitgutter_diff_options = '-w --ignore-space-at-eol --ignore-blank-lines --ignore-space-change --ignore-all-space'
let g:gitgutter_diff_options = '-w --ignore-space-at-eol --ignore-blank-lines --ignore-space-change --ignore-all-space --ignore-trailing-space'
set foldtext=gitgutter#fold#foldtext()
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
highlight! link SignColumn LineNr
set signcolumn=yes
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_background_color = '#f0f0f0'
let g:gitgutter_sign_foreground_color = '#000000'
let g:gitgutter_sign_modified_background_color = '#f0f0f0'
let g:gitgutter_sign_modified_foreground_color = '#000000'
let g:gitgutter_sign_added_background_color = '#f0f0f0'
let g:gitgutter_sign_added_foreground_color = '#000000'
let g:gitgutter_sign_removed_background_color = '#f0f0f0'
let g:gitgutter_sign_removed_foreground_color = '#000000'
let g:gitgutter_sign_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_untracked_foreground_color = '#000000'
let g:gitgutter_sign_conflict_background_color = '#f0f0f0'
let g:gitgutter_sign_conflict_foreground_color = '#000000'
let g:gitgutter_sign_staged_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_modified_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_modified_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_deleted_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_deleted_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_modified_deleted_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_modified_deleted_foreground_color = '#000000'
let g:gitgutter_sign_staged_deleted_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_deleted_foreground_color = '#000000'
let g:gitgutter_sign_staged_modified_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_modified_foreground_color = '#000000'
let g:gitgutter_sign_staged_conflict_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_conflict_foreground_color = '#000000'
let g:gitgutter_sign_staged_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_modified_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_modified_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_deleted_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_deleted_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_modified_deleted_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_modified_deleted_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_deleted_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_deleted_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_modified_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_modified_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_conflict_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_conflict_untracked_foreground_color = '#000000'
let g:gitgutter_sign_staged_new_modified_deleted_untracked_background_color = '#f0f0f0'
let g:gitgutter_sign_staged_new_modified_deleted_untracked_foreground_color = '#000000'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight GitGutterUntracked guifg=#bbbbbb ctermfg=7
highlight GitGutterConflict guifg=#ff0000 ctermfg=1
highlight GitGutterStagedAdd    guifg=#009900 ctermfg=2
highlight GitGutterStagedChange guifg=#bbbb00 ctermfg=3
highlight GitGutterStagedDelete guifg=#ff2222 ctermfg=1
highlight GitGutterStagedUntracked guifg=#bbbbbb ctermfg=7
highlight GitGutterStagedConflict guifg=#ff0000 ctermfg=1
highlight link GitGutterChangeLine DiffText
highlight link GitGutterChangeLineNr Underlined
highlight link GitGutterAddIntraLine DiffAdd
highlight link GitGutterAddIntraLineNr DiffAdd
highlight link GitGutterDeleteIntraLine DiffDelete
highlight link GitGutterDeleteIntraLineNr DiffDelete
let g:gitgutter_diff_relative_to = 'working_tree'
let g:gitgutter_diff_ignore_whitespace = 1
let g:gitgutter_diff_ignore_blank_lines = 1
let g:gitgutter_diff_ignore_space_change = 1
let g:gitgutter_diff_ignore_tab_width_change = 1
let g:gitgutter_diff_ignore_eol_change = 1
let g:gitgutter_diff_ignore_case_change = 1
let g:gitgutter_diff_ignore_all_space = 1
let g:gitgutter_diff_ignore_all_blank_lines = 1
let g:gitgutter_diff_ignore_all_space_change = 1
let g:gitgutter_diff_ignore_all_tab_width_change = 1
let g:gitgutter_diff_ignore_all_eol_change = 1
let g:gitgutter_diff_ignore_all_case_change = 1
let g:gitgutter_diff_base = '<commit SHA>'
let g:gitgutter_diff_base_commit = '<commit SHA>'
let g:gitgutter_diff_base_commit_format = '<commit SHA>'
let g:gitgutter_diff_base_commit_format_string = '<commit SHA>'
let g:gitgutter_git_args = '--git-dir-""'
let g:gitgutter_git_args_string = '--git-dir-""'
let g:gitgutter_git_args_string_with_git_dir = '--git-dir-""'
let g:gitgutter_diff_args = '-w'
let g:gitgutter_diff_args_string = '-w'
let g:gitgutter_diff_args_string_with_git_dir = '-w'
let g:gitgutter_diff_args_string_with_git_dir_and_git_args = '-w'
let g:gitgutter_map_keys = 0
let g:gitgutter_grep = 'grep'








"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_ctags = 1
let g:tagbar_ctags_cmd = 'ctags -R --fields=+Km --extra=+q'
let g:tagbar_ctags_args = '-f -'
let g:tagbar_ctags_args_string = '-f -'
let g:tagbar_ctags_args_string_with_git_dir = '-f -'
let g:tagbar_ctags_args_string_with_git_dir_and_git_args = '-f -'








"airline
let g:airline_theme = 'powerline'
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts_string = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir_and_git_args = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir_and_git_args_and_ctags_cmd = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir_and_git_args_and_ctags_args = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir_and_git_args_and_ctags_args_string = 'Powerline'
let g:airline_powerline_fonts_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir = 'Powerline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter_string = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_cmd = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = 'default'
let g:airline#extensions#tabline#formatter_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string = 'default'
let g:airline#extensions#tabline#tabs_format = 'tabs'
let g:airline#extensions#tabline#tabs_format_string = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_cmd = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd = 'tabs'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = 'tabs'
let g:airline#extensions#tabline#tabs_format_string = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_cmd = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd = '%s'
let g:airline#extensions#tabline#tabs_format_string_with_git_dir_and_git_args_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_string_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = '%s'








"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_map_with_count = '<c-p>'
let g:ctrlp_map_with_count_and_count = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd_with_count = 'CtrlP'
let g:ctrlp_args = '--noselect'
let g:ctrlp_args_with_count = '--noselect'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode_with_count = 'ra'
let g:ctrlp_working_path_mode_string = 'ra'
let g:ctrlp_working_path_mode_string_with_count = 'ra'
let g:ctrlp_working_path_mode_string_with_git_dir = 'ra'
let g:ctrlp_working_path_mode_string_with_git_dir_and_git_args = 'ra'
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
  let g:ctrlp_user_command = 'ls -a %s'  " MacOSX/Linux
  let g:ctrlp_user_command = 'ls -a %s'  " Linux
  let g:ctrlp_user_command = 'ls -a %s'  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']







"emmet
let g:emmet#enable_auto_pair = 1
let g:emmet#enable_auto_pair_text_objects = 1
let g:emmet#enable_auto_close_tag = 1
let g:emmet#enable_auto_close_tag_text_objects = 1
let g:emmet#enable_new_line_indent = 1
let g:emmet#enable_new_line_indent_text_objects = 1
let g:emmet#enable_completion = 1
let g:emmet#enable_completion_text_objects = 1
let g:emmet#enable_snippets = 1
let g:emmet#enable_snippets_text_objects = 1
let g:emmet#enable_surround_text_objects = 1
let g:emmet#enable_surround_text_objects_text_objects = 1
let g:emmet#enable_yank_emmet_style_paste = 1
let g:emmet#enable_yank_emmet_style_paste_text_objects = 1
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_mode='b'    "enable all function in all mode, but disable
                              "the functions which is not supported by
                              "the current mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))








"vim-abolish
let g:abolish_enable_mappings = 1
let g:abolish_enable_operators = 1
let g:abolish_enable_functions = 1
let g:abolish_enable_aliases = 1
let g:abolish_enable_key_mappings = 1
let g:abolish_enable_key_operators = 1
let g:abolish_enable_key_functions = 1
let g:abolish_enable_key_aliases = 1







"vim-git
let g:git_diff_options = '-w'
let g:git_diff_options_with_count = '-w'
let g:git_diff_options_with_git_dir = '-w'
let g:git_diff_options_with_git_dir_and_git_args = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd_and_ctags_args = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd = '-w'
let g:git_diff_options_with_git_dir_and_git_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd_and_ctags_args_and_ctags_cmd_and_ctags_args = '-w'







"vim-repeat
let g:repeat_map = '<C-R>'
let g:repeat_interval = 1
let g:repeat_interval_type = 'char'
let g:repeat_interval_type_string = 'char'
let g:repeat_interval_type_string_with_git_dir = 'char'
let g:repeat_interval_type_string_with_git_dir_and_git_args = 'char'
let g:repeat_interval_type_string_with_git_dir_and_git_args_and_repeat_interval = 'char'








"ale
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_set_highlights = 0
highlight ALEWarning ctermbg=DarkMagenta
let g:airline#extensions#ale#enabled = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let b:ale_linter_aliases = ['css', 'javascript']
let b:ale_linters = ['stylelint', 'eslint']
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']
" Select the eslint and vls linters.
let b:ale_linters = ['eslint', 'vls']
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_list_window_size = 5
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_floating_window_border = repeat([''], 6)
let g:ale_disable_lsp = 1








"easymotion
map <Leader>J <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)








"fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#vim#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()







"indentline
let g:indentLine_setColors = 0
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0








"lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ }
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:lightline = {
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \ },
      \ }

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction
let g:lightline = {
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
let g:lightline = {
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
let g:lightline = {
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ }






"auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'







"coc
let g:coc_use_preview_window = 1
let g:coc_preview_window_height = 0.5
let g:coc_preview_window_width = 0.5
let g:coc_preview_window_position = 'right'
let g:coc_preview_window_border = 0
let g:coc_preview_window_border_width = 0
let g:coc_preview_window_border_color = '#000000'
let g:coc_preview_window_border_radius = 0
let g:coc_preview_window_border_type = 'solid'
let g:coc_preview_window_background = '#000000'
let g:coc_preview_window_transparent = 0
let g:coc_preview_window_opacity = 0.5
let g:coc_preview_window_zoom = 0
let g:coc_preview_window_zoom_transition = 'ease'
let g:coc_preview_window_zoom_duration = 0.5
let g:coc_preview_window_zoom_scale = 1.5
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>







"code-runner
" Use key mappings setting from this plugin by default.
let g:runner_use_default_mapping = 1

" Save file first before compile and run by default.
let g:runner_is_save_first = 1

" Print a timestamp on the top of output by default.
let g:runner_print_timestamp = 1

" Print time usage of do all actions by default.
let g:runner_print_time_usage = 1

" Show the comment information by default.
let g:runner_show_info = 1

" Not auto remove tmp file by default.
let g:runner_auto_remove_tmp = 0

" Use <F5> to compile and run code by default.
" Feel free to change mapping you like.
let g:runner_run_key = "<F5>"

" Set tmp dir for output.
let g:runner_tmp_dir = "/tmp/vim-runner/"

" Section: work with other plugins
" w0rp/ale
let g:runner_is_with_ale = 0
" iamcco/markdown-preview.vim
let g:runner_is_with_md = 0

" Section: executable settings
let g:runner_c_executable = "gcc"
let g:runner_cpp_executable = "g++"
let g:runner_rust_executable = "cargo"
let g:runner_python_executable = "python3"

" Section: compile options settings
let g:runner_c_compile_options = "-std=c11 -Wall"
let g:runner_cpp_compile_options = "-std=c++11 -Wall"
let g:runner_rust_compile_options = ""

" Section: run options settings
let g:runner_c_run_options = ""
let g:runner_cpp_run_options = ""
let g:runner_rust_run_backtrace = 1
let g:runner_rust_run_options = ""







"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map gt <Plug>(incsearch-nohl-gt)
map gT <Plug>(incsearch-nohl-gT)
map gd <Plug>(incsearch-nohl-gd)
map gD <Plug>(incsearch-nohl-gD)
map gc <Plug>(incsearch-nohl-gc)
map gC <Plug>(incsearch-nohl-gC)
map gs <Plug>(incsearch-nohl-gs)
map gS <Plug>(incsearch-nohl-gS)
map gm <Plug>(incsearch-nohl-gm)
map gM <Plug>(incsearch-nohl-gM)
function! s:noregexp(pattern) abort
  return '\V' . escape(a:pattern, '\')
endfunction

function! s:config() abort
  return {'converters': [function('s:noregexp')]}
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config())







"youcompleteme
let g:ycm_max_diagnostics_to_display = 100
let g:ycm_auto_popup_errors = 0
let g:ycm_semantic_triggers = [{'event': 'InsertLeave', 'pattern': '^\s*$'}]
let g:ycm_global_ycm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['*.ycm_extra_conf.py', '*.ycm_extra_conf.pyc']
let g:ycm_extra_conf_globlist_recursive = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_omnifunc_auto_popup = 1
let g:ycm_omnifunc_auto_popup_max_height = 0
let g:ycm_omnifunc_auto_popup_min_height = 0
let g:ycm_omnifunc_auto_popup_max_width = 0
let g:ycm_omnifunc_auto_popup_min_width = 0
let g:ycm_omnifunc_auto_popup_delay = 0
let g:ycm_omnifunc_auto_popup_delay_msec = 0
let g:ycm_omnifunc_auto_popup_delay_sec = 0
let g:ycm_omnifunc_auto_popup_delay_usec = 0
let g:ycm_omnifunc_auto_popup_delay_nsec = 0
let g:ycm_omnifunc_auto_popup_delay_min = 0
let g:ycm_omnifunc_auto_popup_delay_max = 0
let g:ycm_omnifunc_auto_popup_delay_inc = 0
let g:ycm_omnifunc_auto_popup_delay_dec = 0
let g:ycm_omnifunc_auto_popup_delay_inc_msec = 0
let g:ycm_omnifunc_auto_popup_delay_inc_sec = 0
let g:ycm_omnifunc_auto_popup_delay_inc_usec = 0
let g:ycm_omnifunc_auto_popup_delay_inc_nsec = 0
let g:ycm_omnifunc_auto_popup_delay_dec_msec = 0
let g:ycm_omnifunc_auto_popup_delay_dec_sec = 0
let g:ycm_omnifunc_auto_popup_delay_dec_usec = 0
let g:ycm_omnifunc_auto_popup_delay_dec_nsec = 0
let g:ycm_omnifunc_auto_popup_delay_inc_min = 0
let g:ycm_omnifunc_auto_popup_delay_inc_max = 0
let g:ycm_omnifunc_auto_popup_delay_dec_min = 0
let g:ycm_omnifunc_auto_popup_delay_dec_max = 0
let g:ycm_omnifunc_auto_popup_delay_inc_inc = 0
let g:ycm_omnifunc_auto_popup_delay_dec_dec = 0




"test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}
let g:test#preserve_screen = 1
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
let g:test#echo_command = 0
let g:test#echo_command_on_failure = 0
let g:test#echo_command_on_success = 0
let g:test#echo_command_on_skip = 0
let g:test#echo_command_on_todo = 0
let g:test#echo_command_on_xfail = 0
let g:test#echo_command_on_xpass = 0
let g:test#echo_command_on_xfail_skip = 0
let g:test#echo_command_on_xfail_todo = 0
let g:test#echo_command_on_xpass_skip = 0
let g:test#echo_command_on_xpass_todo = 0
let g:test#echo_command_on_xfail_xfail = 0
let g:test#echo_command_on_xpass_xpass = 0
let g:test#echo_command_on_xfail_xpass = 0
let g:test#echo_command_on_xpass_xfail = 0
let g:test#echo_command_on_xfail_xpass_skip = 0
let g:test#echo_command_on_xpass_xfail_skip = 0
let g:test#echo_command_on_xfail_xpass_todo = 0
let g:test#echo_command_on_xpass_xfail_todo = 0
let g:test#echo_command_on_xfail_xpass_skip_todo = 0
let g:test#echo_command_on_xpass_xfail_skip_todo = 0
let g:test#echo_command_on_xfail_xpass_skip_todo_todo = 0
let g:test#echo_command_on_xpass_xfail_skip_todo_todo = 0
let g:dispatch_compilers = {}
let g:dispatch_compilers['./vendor/bin/'] = ''
let g:dispatch_compilers['phpunit'] = 'phpunit2'
let g:dispatch_compilers['phpunit3'] = 'phpunit3'
let g:dispatch_compilers['phpunit4'] = 'phpunit4'
let g:dispatch_compilers['phpunit5'] = 'phpunit5'
let g:dispatch_compilers['phpunit6'] = 'phpunit6'
let g:dispatch_compilers['phpunit7'] = 'phpunit7'
function! EchoStrategy(cmd)
  echo 'It works! Command for running tests: ' . a:cmd
endfunction

let g:test#custom_strategies = {'echo': function('EchoStrategy')}
let g:test#strategy = 'echo'
let g:test#strategy_args = ['echo']
let g:test#strategy_args_echo = ['echo']
let g:test#strategy_args_neovim = ['neovim']
let g:test#strategy_args_dispatch = ['dispatch']
let g:test#strategy_args_basic = ['basic']
let g:test#strategy_args_neovim_dispatch = ['neovim', 'dispatch']
let g:test#strategy_args_dispatch_basic = ['dispatch', 'basic']
let g:test#strategy_args_neovim_basic = ['neovim', 'basic']
let g:test#strategy_args_neovim_dispatch_basic = ['neovim', 'dispatch', 'basic']
let g:test#strategy_args_neovim_dispatch_basic_neovim = ['neovim', 'dispatch', 'basic', 'neovim']
let g:test#strategy_args_neovim_dispatch_basic_dispatch = ['neovim', 'dispatch', 'basic', 'dispatch']
let g:test#strategy_args_neovim_dispatch_basic_basic = ['neovim', 'dispatch', 'basic', 'basic']
let g:test#strategy_args_neovim_dispatch_basic_neovim_basic = ['neovim', 'dispatch', 'basic', 'neovim', 'basic']
let g:test#strategy_args_neovim_dispatch_basic_neovim_dispatch_basic = ['neovim', 'dispatch', 'basic', 'neovim', 'dispatch', 'basic']
function! VagrantTransform(cmd) abort
  let vagrant_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
endfunction

let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}
let g:test#transformation = 'vagrant'
let g:test#transformation_args = ['vagrant']
let g:test#transformation_args_vagrant = ['vagrant']
let g:test#transformation_args_vagrant_vagrant = ['vagrant', 'vagrant']
let g:test#transformation_args_vagrant_vagrant_vagrant = ['vagrant', 'vagrant', 'vagrant']
let g:test#runner_commands = ['Minitest', 'Mocha']
let g:test#runner_commands_Minitest = ['Minitest']
let g:test#runner_commands_Mocha = ['Mocha']
let g:test#runner_commands_Minitest_Minitest = ['Minitest', 'Minitest']
let g:test#runner_commands_Mocha_Mocha = ['Mocha', 'Mocha']
let g:test#runner_commands_Minitest_Mocha = ['Minitest', 'Mocha']
let g:test#runner_commands_Mocha_Minitest = ['Mocha', 'Minitest']
let g:test#runner_commands_Minitest_Minitest_Minitest = ['Minitest', 'Minitest', 'Minitest']
let test#ruby#minitest#options = '--verbose'
let test#ruby#minitest#options_verbose = '--verbose'
let test#ruby#minitest#options_verbose_verbose = '--verbose'
let test#ruby#minitest#options_verbose_verbose_verbose = '--verbose'
let test#ruby#rspec#options = {
  \ 'nearest': '--backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}
let test#ruby#rspec#options = {
  \ 'all':   '--backtrace',
  \ 'suite': '--tag ~slow',
\}
" for neovim
let test#neovim#term_position = "topleft"
let test#neovim#term_position = "vert"
let test#neovim#term_position = "vert botright 30"
" or for Vim8
let test#vim#term_position = "belowright"
let test#ruby#rspec#executable = 'foreman run rspec'
let test#ruby#minitest#executable = 'foreman run minitest'
let test#ruby#minitest#file_pattern = '_spec\.rb' " the default is '\v(((^|/)test_.+)|_test)(spec)@<!\.rb$'
let test#filename_modifier = ':.' " test/models/user_test.rb (default)
let test#filename_modifier = ':p' " /User/janko/Code/my_project/test/models/user_test.rb
let test#filename_modifier = ':~' " ~/Code/my_project/test/models/user_test.rb
let test#python#runner = 'pytest'
" Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'
let test#java#runner = 'gradletest'
command! -nargs=* -bar IntegrationTest call test#run('integration', split(<q-args>))
nnoremap <silent><leader>itf :IntegrationTest -Dtest=foo -DfailIfNoTests=false -am -Dpmd.skip=true -Dcheckstyle.skip=true<CR>
let test#scala#runner = 'blooptest'
let g:test#scala#blooptest#project_name = 'custom-project'
let test#go#runner = 'ginkgo'
" Runners available are 'gotest', 'ginkgo', 'richgo', 'delve'
nmap <silent> t<C-n> :TestNearest<CR>
function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nmap <silent> t<C-d> :call DebugNearest()<CR>
let test#go#runner = 'gotest'
let test#go#gotest#options = '-v'
let test#go#gotest#options = '-v -cover'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out -coverpkg=github.com/janko-m/test-vim/test'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out -coverpkg=github.com/janko-m/test-vim/test -covermode=atomic'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out -coverpkg=github.com/janko-m/test-vim/test -covermode=atomic -coverpkg=github.com/janko-m/test-vim/test/...'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out -coverpkg=github.com/janko-m/test-vim/test -covermode=atomic -coverpkg=github.com/janko-m/test-vim/test/... -covermode=atomic'
let test#go#gotest#options = '-v -cover -coverprofile=coverage.out -coverpkg=github.com/janko-m/test-vim/test -covermode=atomic -coverpkg=github.com/janko-m/test-vim/test/... -covermode=atomic -coverpkg=github.com/janko-m/test-vim/test/...'
let test#ruby#bundle_exec = 0
let test#ruby#bundle_exec = 1
let test#ruby#bundle_exec = 2
let test#ruby#bundle_exec = 3
let test#ruby#bundle_exec = 4
let test#ruby#bundle_exec = 5
let test#ruby#bundle_exec = 6
let test#ruby#bundle_exec = 7
let test#ruby#use_binstubs = 0
let test#ruby#use_binstubs = 1
let test#ruby#use_binstubs = 2
let test#ruby#use_binstubs = 3
let test#ruby#use_binstubs = 4
let test#ruby#use_binstubs = 5
let test#ruby#use_binstubs = 6
let test#ruby#use_binstubs = 7
let test#ruby#use_spring_binstub = 0
let test#ruby#use_spring_binstub = 1
let test#ruby#use_spring_binstub = 2
let test#ruby#use_spring_binstub = 3
let test#ruby#use_spring_binstub = 4
let test#ruby#use_spring_binstub = 5
let test#ruby#use_spring_binstub = 6
let test#ruby#use_spring_binstub = 7
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#options = '--verbose'
let g:test#javascript#jest#options = '--verbose --coverage'
let g:test#javascript#jest#options = '--verbose --coverage --coveragePath=coverage'
let g:test#javascript#jest#options = '--verbose --coverage --coveragePath=coverage --coverageReporters=text-summary'
let g:test#javascript#jest#options = '--verbose --coverage --coveragePath=coverage --coverageReporters=text-summary --coverageDirectory=coverage'
let test#php#phpunit#executable = 'phpunit'
let test#php#phpunit#options = '--verbose'
let test#php#phpunit#options = '--verbose --coverage-text'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage --coverage-php=coverage.php'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage --coverage-php=coverage.php --coverage-src=src'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage --coverage-php=coverage.php --coverage-src=src --coverage-src-exclude=src/vendor'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage --coverage-php=coverage.php --coverage-src=src --coverage-src-exclude=src/vendor --coverage-src-exclude=src/vendor/symfony'
let test#php#phpunit#options = '--verbose --coverage-text --coverage-clover=coverage.xml --coverage-html=coverage --coverage-php=coverage.php --coverage-src=src --coverage-src-exclude=src/vendor --coverage-src-exclude=src/vendor/symfony --coverage-src-exclude=src/vendor/symfony/...'
let test#php#phpunit#executable = 'php artisan test'
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END
let g:test#no_alternate = 0
let g:test#no_alternate = 1
let g:test#no_alternate = 2
let g:test#no_alternate = 3
let g:test#no_alternate = 4
let g:test#no_alternate = 5
let g:test#no_alternate = 6
let g:test#no_alternate = 7
let g:test#no_alternate = 8
let g:test#no_alternate = 9
" First letter of runner's name must be uppercase
let test#custom_runners = {'MyLanguage': ['MyRunner']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7', 'MyRunner8']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7', 'MyRunner8', 'MyRunner9']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7', 'MyRunner8', 'MyRunner9', 'MyRunner10']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7', 'MyRunner8', 'MyRunner9', 'MyRunner10', 'MyRunner11']}
let test#custom_runners = {'MyLanguage': ['MyRunner', 'MyRunner2', 'MyRunner3', 'MyRunner4', 'MyRunner5', 'MyRunner6', 'MyRunner7', 'MyRunner8', 'MyRunner9', 'MyRunner10', 'MyRunner11', 'MyRunner12']}
" Returns true if the given file belongs to your test runner
function! test#mylanguage#myrunner#test_file(file)
  return a:file =~ '^test/mylanguage/myrunner/'
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#mylanguage#myrunner#build_position(type, position)
  return '--test-mylanguage-myrunner'
endfunction

" Returns processed args (if you need to do any processing)
function! test#mylanguage#myrunner#build_args(args)
  return a:args
endfunction

" Returns the executable of your test runner
function! test#mylanguage#myrunner#executable()
  return 'myrunner'
endfunction
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber", "ruby#minitest_reporters"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber", "ruby#minitest_reporters", "ruby#minitest_reporters_json"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber", "ruby#minitest_reporters", "ruby#minitest_reporters_json", "ruby#minitest_reporters_tap"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber", "ruby#minitest_reporters", "ruby#minitest_reporters_json", "ruby#minitest_reporters_tap", "ruby#minitest_reporters_json_junit"]
let test#enabled_runners = ["mylanguage#myrunner", "ruby#rspec", "ruby#minitest", "ruby#test_unit", "ruby#bundler", "ruby#rake", "ruby#spinach", "ruby#cucumber", "ruby#minitest_reporters", "ruby#minitest_reporters_json", "ruby#minitest_reporters_tap", "ruby#minitest_reporters_json_junit", "ruby#minitest_reporters_json_junit_teamcity"]







"shtuff
let g:shtuff_receiver = 'devrunner'
let g:shtuff_sender = 'devrunner'
let g:shtuff_sender_port = '1234'
let g:shtuff_receiver_port = '1234'
let g:shtuff_receiver_host = 'localhost'
let g:shtuff_sender_host = 'localhost'
let g:shtuff_sender_timeout = '0.1'
let g:shtuff_receiver_timeout = '0.1'
let g:shtuff_sender_retry_count = '0'
let g:shtuff_receiver_retry_count = '0'
let g:shtuff_sender_retry_delay = '0.1'
let g:shtuff_receiver_retry_delay = '0.1'
let g:shtuff_sender_retry_delay_max = '0.1'
let g:shtuff_receiver_retry_delay_max = '0.1'
let g:shtuff_sender_retry_delay_min = '0.1'
let g:shtuff_receiver_retry_delay_min = '0.1'
let g:shtuff_sender_retry_delay_inc = '0.1'
let g:shtuff_receiver_retry_delay_inc = '0.1'
let g:shtuff_sender_retry_delay_dec = '0.1'
let g:shtuff_receiver_retry_delay_dec = '0.1'
let g:shtuff_sender_retry_delay_inc_msec = '0.1'
let g:shtuff_receiver_retry_delay_inc_msec = '0.1'
let g:shtuff_sender_retry_delay_inc_sec = '0.1'
let g:shtuff_receiver_retry_delay_inc_sec = '0.1'
let g:shtuff_sender_retry_delay_inc_usec = '0.1'
let g:shtuff_receiver_retry_delay_inc_usec = '0.1'
let g:shtuff_sender_retry_delay_inc_nsec = '0.1'
let g:shtuff_receiver_retry_delay_inc_nsec = '0.1'
let g:shtuff_sender_retry_delay_dec_msec = '0.1'
let g:shtuff_receiver_retry_delay_dec_msec = '0.1'
let g:shtuff_sender_retry_delay_dec_sec = '0.1'
let g:shtuff_receiver_retry_delay_dec_sec = '0.1'
let g:shtuff_sender_retry_delay_dec_usec = '0.1'
let g:shtuff_receiver_retry_delay_dec_usec = '0.1'






"supertab
let g:supertab_always_use_supertab = 1
let g:supertab_min_width = 2
let g:supertab_max_width = 20
let g:supertab_min_colors = 2
let g:supertab_max_colors = 20
let g:supertab_max_tabs = 20
let g:supertab_max_tabs_per_group = 20
let g:supertab_max_groups = 20
let g:supertab_max_groups_per_tab = 20
let g:supertab_max_tabs_per_group_in_tabline = 20
let g:supertab_max_groups_in_tabline = 20
let g:supertab_max_groups_per_tab_in_tabline = 20
let g:supertab_max_tabs_in_tabline = 20
let g:supertab_max_tabs_per_group_in_tabline = 20
let g:supertab_max_groups_in_tabline = 20
let g:supertab_max_groups_per_tab_in_tabline = 20
let g:supertab_max_tabs_in_tabline = 20







"ack
let g:ack_ignore_case = 1
let g:ack_smart_case = 1
let g:ack_smart_case_regexp = '^[A-Z]$'
let g:ack_smart_case_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^[a-z]$'
let g:ack_smart_case_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^[a-z]$'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A :Ack!<Space>






"vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_jsdoc_tag_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_jsdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_ngdoc_tag_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_ngdoc_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow = 1
let g:javascript_plugin_flow_tag_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp = '^@[a-zA-Z]+$'
let g:javascript_plugin_flow_tag_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not_regexp_not = '^@[a-zA-Z]+$'
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
let g:javascript_conceal_arrow_function_with_arguments = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype_and_static = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype = "🞅"
let g:javascript_conceal_arrow_function_with_arguments_and_return_and_this_and_arguments_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype_and_static_and_super_and_prototype = "🞅"
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>






"easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
map  <Leader>F <Plug>(easymotion-f)
map  <Leader>t <Plug>(easymotion-t)
map  <Leader>T <Plug>(easymotion-T)
map  <Leader>w <Plug>(easymotion-w)
map  <Leader>W <Plug>(easymotion-W)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
nmap S <Plug>(easymotion-f2)
nmap t <Plug>(easymotion-t2)
nmap T <Plug>(easymotion-T2)
nmap w <Plug>(easymotion-w2)
nmap W <Plug>(easymotion-W2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_endofline = 1 " keep cursor column when JK motion
let g:EasyMotion_wrapAround = 1 " wrap around
let g:EasyMotion_useArrowKeys = 1 " use arrow keys
let g:EasyMotion_useMarks = 1 " use marks
let g:EasyMotion_useNumericMarks = 1 " use numeric marks
let g:EasyMotion_smartcase = 1
let g:EasyMotion_useFuzzy = 1
let g:EasyMotion_useFuzzyInner = 1
let g:EasyMotion_useFuzzyOuter = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
" or
let g:EasyMotion_use_smartsign_jp = 1 " JP layout
let g:EasyMotion_use_smartsign_cn = 1 " CN layout
let g:EasyMotion_use_smartsign_kr = 1 " KR layout
let g:EasyMotion_use_smartsign_fr = 1 " FR layout
let g:EasyMotion_use_smartsign_de = 1 " DE layout
let g:EasyMotion_use_smartsign_it = 1 " IT layout
let g:EasyMotion_use_smartsign_ru = 1 " RU layout
let g:EasyMotion_use_smartsign_es = 1 " ES layout
let g:EasyMotion_use_smartsign_pt = 1 " PT layout
let g:EasyMotion_use_smartsign_sv = 1 " SV layout
let g:EasyMotion_use_smartsign_no = 1 " NO layout
let g:EasyMotion_use_smartsign_fi = 1 " FI layout
let g:EasyMotion_use_smartsign_fr = 1 " FR layout
let g:EasyMotion_use_smartsign_nl = 1 " NL layout
let g:EasyMotion_use_smartsign_pl = 1 " PL layout
let g:EasyMotion_use_smartsign_tr = 1 " TR layout
let g:EasyMotion_use_smartsign_el = 1 " EL layout
let g:EasyMotion_use_smartsign_hu = 1 " HU layout
let g:EasyMotion_use_smartsign_cs = 1 " CS layout
let g:EasyMotion_use_smartsign_sk = 1 " SK layout
let g:EasyMotion_use_smartsign_bg = 1 " BG layout
let g:EasyMotion_use_smartsign_zh = 1 " ZH layout
let g:EasyMotion_use_smartsign_zh_TW = 1 " ZH_TW layout
let g:EasyMotion_use_smartsign_zh_CN = 1 " ZH_CN layout
let g:EasyMotion_use_smartsign_zh_HK = 1 " ZH_HK layout
let g:EasyMotion_use_smartsign_zh_MO = 1 " ZH_MO layout
let g:EasyMotion_use_smartsign_zh_SG = 1 " ZH_SG layout
let g:EasyMotion_use_smartsign_zh_TW = 1 " ZH_TW layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE = 1 " ZH_TW_STROKE layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H = 1 " ZH_TW_STROKE_H layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_V = 1 " ZH_TW_STROKE_V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_HV = 1 " ZH_TW_STROKE_HV layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V = 1 " ZH_TW_STROKE_H2V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_HV2 = 1 " ZH_TW_STROKE_HV2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V2 = 1 " ZH_TW_STROKE_H2V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V = 1 " ZH_TW_STROKE_H3V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_HV3 = 1 " ZH_TW_STROKE_HV3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V3 = 1 " ZH_TW_STROKE_H2V3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_HV2V = 1 " ZH_TW_STROKE_HV2V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V2V = 1 " ZH_TW_STROKE_H2V2V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V2 = 1 " ZH_TW_STROKE_H3V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V3V = 1 " ZH_TW_STROKE_H2V3V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V3 = 1 " ZH_TW_STROKE_H3V3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V3V2 = 1 " ZH_TW_STROKE_H2V3V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V3V = 1 " ZH_TW_STROKE_H3V3V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V3V3 = 1 " ZH_TW_STROKE_H2V3V3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H4V = 1 " ZH_TW_STROKE_H4V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4 = 1 " ZH_TW_STROKE_H2V4 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4 = 1 " ZH_TW_STROKE_H3V4 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V = 1 " ZH_TW_STROKE_H2V4V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V = 1 " ZH_TW_STROKE_H3V4V layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V2 = 1 " ZH_TW_STROKE_H2V4V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V2 = 1 " ZH_TW_STROKE_H3V4V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V3 = 1 " ZH_TW_STROKE_H2V4V3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V3 = 1 " ZH_TW_STROKE_H3V4V3 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V4 = 1 " ZH_TW_STROKE_H2V4V4 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V4 = 1 " ZH_TW_STROKE_H3V4V4 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V5 = 1 " ZH_TW_STROKE_H2V4V5 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V5 = 1 " ZH_TW_STROKE_H3V4V5 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V6 = 1 " ZH_TW_STROKE_H2V4V6 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V6 = 1 " ZH_TW_STROKE_H3V2V2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V7 = 1 " ZH_TW_STROKE_H2V4V7 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V7 = 1 " ZH_TW_STROKE_H3V4V7 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V8 = 1 " ZH_TW_STROKE_H2V4V8 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V8 = 1 " ZH_TW_STROKE_H3V4V8 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V9 = 1 " ZH_TW_STROKE_H2V4V9 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V9 = 1 " ZH_TW_STROKE_H3V4V9 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V10 = 1 " ZH_TW_STROKE_H2V4V10 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V10 = 1 " ZH_TW_STROKE_H3V4V10 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V11 = 1 " ZH_TW_STROKE_H2V4V11 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V11 = 1 " ZH_TW_STROKE_H3V4V11 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V12 = 1 " ZH_TW_STROKE_H2V4V12 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V12 = 1 " ZH_TW_STROKE_H2V2_HV2 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V13 = 1 " ZH_TW_STROKE_H2V4V13 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V13 = 1 " ZH_TW_STROKE_H3V4V13 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V14 = 1 " ZH_TW_STROKE_H2V4V14 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V14 = 1 " ZH_TW_STROKE_H3V4V14 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V15 = 1 " ZH_TW_STROKE_H2V4V15 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V15 = 1 " ZH_TW_STROKE_H3V4V15 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V16 = 1 " ZH_TW_STROKE_H2V4V16 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V16 = 1 " ZH_TW_STROKE_H3V4V16 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V17 = 1 " ZH_TW_STROKE_H2V4V17 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V17 = 1 " ZH_TW_STROKE_H3V4V17 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V18 = 1 " ZH_TW_STROKE_H2V4V18 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V18 = 1 " ZH_TW_STROKE_H3V4V18 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V19 = 1 " ZH_TW_STROKE_H2V4V19 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V19 = 1 " ZH_TW_STROKE_H3V4V19 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V20 = 1 " ZH_TW_STROKE_H2V4V20 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V20 = 1 " ZH_TW_STROKE_H3V4V20 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V21 = 1 " ZH_TW_STROKE_H2V4V21 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V21 = 1 " ZH_TW_STROKE_H3V4V21 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V22 = 1 " ZH_TW_STROKE_H2V4V22 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V22 = 1 " ZH_TW_STROKE_H3V4V22 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V23 = 1 " ZH_TW_STROKE_H2V4V23 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V23 = 1 " ZH_TW_STROKE_H3V4V23 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V24 = 1 " ZH_TW_STROKE_H2V4V24 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V24 = 1 " ZH_TW_STROKE_H3V4V24 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H2V4V25 = 1 " ZH_TW_STROKE_H2V4V25 layout
let g:EasyMotion_use_smartsign_zh_TW_STROKE_H3V4V25 = 1 " ZH_TW_STROKE_H3V4V25 layout
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_use_migemo_ja = 1
let g:EasyMotion_use_migemo_ja_H2V2 = 1
let g:EasyMotion_use_migemo_ja_H2V3 = 1
let g:EasyMotion_use_migemo_ja_H2V4 = 1
let g:EasyMotion_use_migemo_ja_H2V5 = 1
let g:EasyMotion_use_migemo_ja_H3V2 = 1
let g:EasyMotion_use_migemo_ja_H3V3 = 1
let g:EasyMotion_use_migemo_ja_H3V4 = 1
let g:EasyMotion_use_migemo_ja_H3V5 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV2 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV2 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV2 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV2 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV2 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV2 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV2 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV2 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV3 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV3 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV3 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV3 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV3 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV3 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV3 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV3 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV4 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV4 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV4 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV4 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV4 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV4 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV4 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV4 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV5 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV5 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV5 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV5 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV5 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV5 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV5 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV5 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV7V2 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV2V2 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV2V3 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV2V4 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV2V5 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H2V4_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H2V5_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H3V2_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H3V3_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H3V4_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H3V5_HV3V2 = 1
let g:EasyMotion_use_migemo_ja_H2V2_HV3V3 = 1
let g:EasyMotion_use_migemo_ja_H2V3_HV3V3 = 1
" Gif config

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
" Use `g` as a prefix to select the first match
let g:EasyMotion_use_g_for_preview = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-l)
map <Leader>h <Plug>(easymotion-h)
map <Leader>jk <Plug>(easymotion-jk)
map <Leader>jh <Plug>(easymotion-jh)
map <Leader>kl <Plug>(easymotion-kl)
map <Leader>kh <Plug>(easymotion-kh)
map <Leader>jl <Plug>(easymotion-jl)
map <Leader>jh <Plug>(easymotion-jh)
map <Leader>jkl <Plug>(easymotion-jkl)
map <Leader>jkh <Plug>(easymotion-jkh)
map <Leader>jjl <Plug>(easymotion-jjl)
map <Leader>jjh <Plug>(easymotion-jjh)
map <Leader>jkl <Plug>(easymotion-jkl)
map <Leader>jkh <Plug>(easymotion-jkh)
map <Leader>jjl <Plug>(easymotion-jjl)
map <Leader>jjh <Plug>(easymotion-jjh)
map <Leader>jkl <Plug>(easymotion-jkl)






"vim-multiple-cursors
let g:mc_insert_cursor_skip_empty_lines = 1
let g:mc_insert_cursor_skip_newlines = 1
let g:mc_insert_cursor_skip_sel = 1
let g:mc_insert_cursor_skip_whitespace = 1
let g:mc_insert_cursor_skip_comments = 1
let g:mc_insert_cursor_skip_quotes = 1
let g:mc_insert_cursor_skip_tag = 1
let g:mc_insert_cursor_skip_tag_content = 1
let g:mc_insert_cursor_skip_tag_content_recursive = 1
let g:mc_insert_cursor_skip_tag_recursive = 1
let g:mc_insert_cursor_skip_tag_content_recursive = 1
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_exit_key            = '<C-c>'
let g:multi_cursor_down_key            = 'j'
let g:multi_cursor_up_key              = 'k'
let g:multi_cursor_right_key           = 'l'
let g:multi_cursor_left_key            = 'h'
let g:multi_cursor_down_key            = 'j'
let g:multi_cursor_up_key              = 'k'
let g:multi_cursor_right_key           = 'l'
let g:multi_cursor_left_key            = 'h'
let g:multi_cursor_end_key             = 'G'
let g:multi_cursor_beginning_of_line_key = '0'
let g:multi_cursor_end_of_line_key      = '$'
let g:multi_cursor_select_all_key       = '<A-n>'
let g:multi_cursor_start_of_word_key    = '<C-n>'
let g:multi_cursor_end_of_word_key      = '<C-p>'
let g:multi_cursor_select_word_key      = '<A-n>'
let g:multi_cursor_select_line_key      = '<A-p>'
let g:multi_cursor_select_end_of_line_key = '<A-n>'
let g:multi_cursor_select_beginning_of_line_key = '<A-p>'
let g:multi_cursor_select_end_of_word_key = '<A-n>'
let g:multi_cursor_select_beginning_of_word_key = '<A-p>'
let g:multi_cursor_select_end_of_buffer_key = '<A-n>'
let g:multi_cursor_select_beginning_of_buffer_key = '<A-p>'
let g:multi_cursor_select_next_char_key = '<A-n>'
let g:multi_cursor_select_previous_char_key = '<A-p>'
let g:multi_cursor_select_end_of_next_word_key = '<A-n>'
let g:multi_cursor_select_beginning_of_next_word_key = '<A-p>'
let g:multi_cursor_select_end_of_previous_word_key = '<A-n>'
let g:multi_cursor_select_beginning_of_previous_word_key = '<A-p>'
let g:multi_cursor_select_end_of_buffer_key = '<A-n>'
let g:multi_cursor_select_beginning_of_buffer_key = '<A-p>'
let g:multi_cursor_select_next_line_key = '<A-n>'
let g:multi_cursor_select_previous_line_key = '<A-p>'
let g:multi_cursor_select_next_page_key = '<A-n>'
let g:multi_cursor_select_previous_page_key = '<A-p>'
let g:multi_cursor_select_next_word_key = '<A-n>'
let g:multi_cursor_select_previous_word_key = '<A-p>'
let g:multi_cursor_select_next_word_beginning_key = '<A-n>'
let g:multi_cursor_select_previous_word_beginning_key = '<A-p>'
let g:multi_cursor_select_next_word_end_key = '<A-n>'
let g:multi_cursor_select_previous_word_end_key = '<A-p>'
let g:multi_cursor_select_next_paragraph_key = '<A-n>'
let g:multi_cursor_select_previous_paragraph_key = '<A-p>'
let g:multi_cursor_select_next_sentence_key = '<A-n>'
let g:multi_cursor_select_previous_sentence_key = '<A-p>'
let g:multi_cursor_select_next_section_key = '<A-n>'
let g:multi_cursor_select_previous_section_key = '<A-p>'
let g:multi_cursor_select_next_function_key = '<A-n>'
let g:multi_cursor_select_previous_function_key = '<A-p>'
let g:multi_cursor_select_next_class_key = '<A-n>'
let g:multi_cursor_select_previous_class_key = '<A-p>'
let g:multi_cursor_select_next_constant_key = '<A-n>'
let g:multi_cursor_select_previous_constant_key = '<A-p>'
let g:multi_cursor_select_next_include_key = '<A-n>'
let g:multi_cursor_select_previous_include_key = '<A-p>'
let g:multi_cursor_select_next_page_key = '<A-n>'
let g:multi_cursor_select_previous_page_key = '<A-p>'
let g:multi_cursor_select_next_paragraph_key = '<A-n>'
let g:multi_cursor_select_previous_paragraph_key = '<A-p>'
let g:multi_cursor_select_next_sentence_key = '<A-n>'
let g:multi_cursor_select_previous_sentence_key = '<A-p>'
let g:multi_cursor_select_next_section_key = '<A-n>'
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
if !has('gui_running')
  map "in Insert mode, type Ctrl+v Alt+n here" <A-n>
endif
augroup MultipleCursorsSelectionFix
    autocmd User MultipleCursorsPre  if &selection ==# 'exclusive' | let g:multi_cursor_save_selection = &selection | set selection=inclusive | endif
    autocmd User MultipleCursorsPost if exists('g:multi_cursor_save_selection') | let &selection = g:multi_cursor_save_selection | unlet g:multi_cursor_save_selection | endif
augroup END
  func! Multiple_cursors_before()
      if deoplete#is_enabled()
        call deoplete#disable()
        let g:deoplete_is_enable_before_multi_cursors = 1
      else
        let g:deoplete_is_enable_before_multi_cursors = 0
      endif
    endfunc
    func! Multiple_cursors_after()
      if g:deoplete_is_enable_before_multi_cursors
        call deoplete#enable()
      endif
    endfunc
  nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>






"vim-coffee-script
augroup CoffeeBufNew
  autocmd User * set wrap
augroup END
" Switch back to the source buffer after updating.
augroup CoffeeBufUpdate
  autocmd User CoffeeCompile,CoffeeRun exec bufwinnr(b:coffee_src_buf) 'wincmd w'
augroup END
function! s:RemoveGeneratedBy()
  " If there was an error compiling, there's no comment to remove.
  if v:shell_error
    return
  endif

  " Save cursor position.
  let pos = getpos('.')

  " Remove first line.
  set modifiable
  1 delete _
  set nomodifiable

  " Restore cursor position.
  call setpos('.', pos)
endfunction

augroup CoffeeBufUpdate
  autocmd User CoffeeCompile,CoffeeWatch call s:RemoveGeneratedBy()
augroup END
let coffee_indent_keep_current = 1
let coffee_indent_level = 2
let coffee_indent_char = ' '
let coffee_indent_size = 2
let coffee_indent_char_nbsp = ' '
let coffee_indent_size_nbsp = 2
let coffee_indent_char_tab = '\t'
let coffee_indent_size_tab = 1
let coffee_indent_char_ret = '\r'
let coffee_indent_size_ret = 1
let coffee_indent_char_nret = '\n'
let coffee_indent_size_nret = 1
let coffee_indent_char_nret_nbsp = '\n'
let coffee_indent_size_nret_nbsp = 1
let coffee_indent_char_nret_tab = '\n\t'
let coffee_indent_size_nret_tab = 1
let coffee_indent_char_nret_ret = '\n\r'
let coffee_indent_size_nret_ret = 1
let coffee_compiler = '/usr/bin/coffee'
let coffee_make_options = '--bare'
let coffee_cake = '/opt/bin/cake'
let coffee_cake_options = 'build'
let coffee_cake_build_dir = './tmp/'
let coffee_cake_build_dir_relative = './tmp/'
let coffee_cake_build_dir_absolute = '/tmp/'
let coffee_cake_build_dir_relative_absolute = '/tmp/'
let coffee_cake_build_dir_relative_absolute_with_trailing_slash = '/tmp/'
let coffee_cake_build_dir_absolute_with_trailing_slash = '/tmp/'
let coffee_cake_build_dir_relative_absolute_with_trailing_slash_and_spaces = '/tmp/'
let coffee_cake_build_dir_absolute_with_trailing_slash_and_spaces = '/tmp/'
let coffee_cake_build_dir_relative_absolute_with_trailing_slash_and_spaces_and_spaces = '/tmp/'
let coffee_cake_build_dir_absolute_with_trailing_slash_and_spaces_and_spaces = '/tmp/'
let coffee_cake_build_dir_relative_absolute_with_trailing_slash_and_spaces_and_spaces_and_spaces = '/tmp/'
let coffee_linter = '/opt/bin/coffeelint'
let coffee_lint_options = '-f lint.json'
let coffee_compile_vert = 1
let coffee_watch_vert = 1
let coffee_run_vert = 1
hi link coffeeSpaceError NONE
hi link coffeeSemicolonError NONE
hi link coffeeReservedError NONE
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab





"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey






"vim-endwise
let g:endwise_enable_on_vim_startup = 1
let g:endwise_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi EndwiseOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi EndwiseEven guibg=green ctermbg=4
hi EndwiseOdd  guibg=red   ctermbg=3
hi EndwiseEven guibg=green ctermbg=4
hi EndwiseOdd  ctermbg=black
hi EndwiseEven ctermbg=darkgrey
hi EndwiseOdd  ctermbg=white
hi EndwiseEven ctermbg=lightgrey




"vim-ruby
let g:ruby_enable_on_vim_startup = 1
let g:ruby_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi RubyOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi RubyEven guibg=green ctermbg=4
hi RubyOdd  guibg=red   ctermbg=3
hi RubyEven guibg=green ctermbg=4
hi RubyOdd  ctermbg=black
hi RubyEven ctermbg=darkgrey
hi RubyOdd  ctermbg=white
hi RubyEven ctermbg=lightgrey





"vim-jsx
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1




"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_level = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['csharp=cs']
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1
let g:vim_markdown_auto_extension_ext = 'txt'
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_edit_url_in = 'tab'
map asdf <Plug>Markdown_MoveToParentHeader
map <Plug> <Plug>Markdown_MoveToParentHeader





"indent-lines
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0






"ultisnipa
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"





"vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1




""editorconfig
let g:editorconfig_auto_apply = 1
let g:editorconfig_auto_apply_on_save = 1
let g:editorconfig_auto_apply_on_visit = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']






"Unite.vim
let g:unite_enable_on_vim_startup = 1
let g:unite_enable_on_vim_startup = 2
let g:unite_enable_on_vim_startup = 3
let g:unite_enable_on_vim_startup = 4
let g:unite_enable_on_vim_startup = 5
let g:unite_enable_on_vim_startup = 6
let g:unite_enable_on_vim_startup = 7
let g:unite_enable_on_vim_startup = 8
let g:unite_enable_on_vim_startup = 9
let g:unite_enable_on_vim_startup = 10
let g:unite_enable_on_vim_startup = 11
let g:unite_enable_on_vim_startup = 12
let g:unite_enable_on_vim_startup = 13
let g:unite_enable_on_vim_startup = 14
let g:unite_enable_on_vim_startup = 15
let g:unite_enable_on_vim_startup = 16
let g:unite_enable_on_vim_startup = 17
let g:unite_enable_on_vim_startup = 18
let g:unite_enable_on_vim_startup = 19
let g:unite_enable_on_vim_startup = 20
let g:unite_enable_on_vim_startup = 21
let g:unite_enable_on_vim_startup = 22
let g:unite_enable_on_vim_startup = 23
let g:unite_enable_on_vim_startup = 24
let g:unite_enable_on_vim_startup = 25
let g:unite_enable_on_vim_startup = 26
let g:unite_enable_on_vim_startup = 27
let g:unite_enable_on_vim_startup = 28
let g:unite_enable_on_vim_startup = 29
let g:unite_enable_on_vim_startup = 30
let g:unite_enable_on_vim_startup = 31
let g:unite_enable_on_vim_startup = 32
let g:unite_enable_on_vim_startup = 33
let g:unite_enable_on_vim_startup = 34
let g:unite_enable_on_vim_startup = 35
let g:unite_enable_on_vim_startup = 36
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>






"ag.vim
let g:ag_use_agignore = 1
let g:ag_use_agignore = 2
let g:ag_use_agignore = 3
let g:ag_use_agignore = 4
let g:ag_use_agignore = 5
let g:ag_use_agignore = 6
let g:ag_use_agignore = 7
let g:ag_use_agignore = 8
let g:ag_use_agignore = 9
let g:ag_use_agignore = 10
let g:ag_use_agignore = 11
let g:ag_use_agignore = 12
let g:ag_use_agignore = 13
let g:ag_use_agignore = 14
let g:ag_use_agignore = 15
let g:ag_use_agignore = 16
let g:ag_use_agignore = 17
let g:ag_use_agignore = 18
let g:ag_use_agignore = 19
let g:ag_use_agignore = 20
let g:ag_use_agignore = 21
let g:ag_use_agignore = 22
let g:ag_use_agignore = 23
let g:ag_use_agignore = 24
let g:ag_use_agignore = 25
let g:ag_use_agignore = 26
let g:ag_use_agignore = 27
let g:ag_use_agignore = 28
let g:ag_use_agignore = 29
let g:ag_use_agignore = 30
let g:ag_use_agignore = 31
let g:ag_use_agignore = 32
let g:ag_use_agignore = 33
let g:ag_use_agignore = 34
let g:ag_use_agignore = 35
let g:ag_use_agignore = 36
let g:ag_use_agignore = 37
let g:ag_use_agignore = 38
let g:ag_use_agignore = 39
let g:ag_use_agignore = 40
let g:ag_use_agignore = 41
let g:ag_use_agignore = 42
let g:ag_use_agignore = 43
let g:ag_use_agignore = 44
let g:ag_use_agignore = 45
let g:ag_use_agignore = 46
let g:ag_use_agignore = 47
let g:ag_use_agignore = 48
let g:ag_use_agignore = 49
let g:ag_use_agignore = 50
let g:ag_use_agignore = 51
let g:ag_use_agignore = 52
let g:ag_use_agignore = 53
let g:ag_use_agignore = 54
let g:ag_use_agignore = 55
let g:ag_use_agignore = 56
let g:ag_use_agignore = 57
let g:ag_use_agignore = 58
let g:ag_use_agignore = 59
let g:ag_use_agignore = 60
let g:ag_use_agignore = 61
let g:ag_use_agignore = 62
let g:ag_use_agignore = 63
let g:ag_use_agignore = 64
let g:ag_use_agignore = 65
let g:ag_use_agignore = 66
let g:ag_use_agignore = 67
let g:ag_use_agignore = 68
let g:ag_use_agignore = 69
let g:ag_use_agignore = 70
let g:ag_use_agignore = 71
let g:ag_use_agignore = 72
let g:ag_use_agignore = 73
let g:ag_use_agignore = 74
let g:ag_use_agignore = 75
let g:ag_use_agignore = 76
let g:ag_use_agignore = 77
let g:ag_use_agignore = 78
let g:ag_use_agignore = 79
let g:ag_use_agignore = 80
let g:ag_use_agignore = 81
let g:ag_use_agignore = 82
let g:ag_use_agignore = 83
let g:ag_use_agignore = 84
let g:ag_use_agignore = 85
let g:ag_use_agignore = 86
let g:ag_use_agignore = 87
let g:ag_use_agignore = 88
let g:ag_use_agignore = 89
let g:ag_use_agignore = 90
let g:ag_use_agignore = 91
let g:ag_use_agignore = 92
let g:ag_use_agignore = 93
let g:ag_use_agignore = 94
let g:ag_use_agignore = 95
let g:ag_use_agignore = 96
let g:ag_use_agignore = 97
let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"
let g:ag_working_path_mode="r"





"delimitmate
let g:delimitmate_highlight_current_line = 1
let g:delimitmate_highlight_current_line = 2
let g:delimitmate_highlight_current_line = 3
let g:delimitmate_highlight_current_line = 4
let g:delimitmate_highlight_current_line = 5
let g:delimitmate_highlight_current_line = 6
let g:delimitmate_highlight_current_line = 7
let g:delimitmate_highlight_current_line = 8
let g:delimitmate_highlight_current_line = 9
let g:delimitmate_highlight_current_line = 10
let g:delimitmate_highlight_current_line = 11
let g:delimitmate_highlight_current_line = 12
let g:delimitmate_highlight_current_line = 13
let g:delimitmate_highlight_current_line = 14
let g:delimitmate_highlight_current_line = 15
let g:delimitmate_highlight_current_line = 16
let g:delimitmate_highlight_current_line = 17
let g:delimitmate_highlight_current_line = 18
let g:delimitmate_highlight_current_line = 19
let g:delimitmate_highlight_current_line = 20
let g:delimitmate_highlight_current_line = 21
let g:delimitmate_highlight_current_line = 22
let g:delimitmate_highlight_current_line = 23
let g:delimitmate_highlight_current_line = 24
let g:delimitmate_highlight_current_line = 25
let g:delimitmate_highlight_current_line = 26
let g:delimitmate_highlight_current_line = 27
let g:delimitmate_highlight_current_line = 28
let g:delimitmate_highlight_current_line = 29
let g:delimitmate_highlight_current_line = 30
let g:delimitmate_highlight_current_line = 31
let g:delimitmate_highlight_current_line = 32
let g:delimitmate_highlight_current_line = 33
let g:delimitmate_highlight_current_line = 34
let g:delimitmate_highlight_current_line = 35
let g:delimitmate_highlight_current_line = 36
let g:delimitmate_highlight_current_line = 37
let g:delimitmate_highlight_current_line = 38
let g:delimitmate_highlight_current_line = 39
let g:delimitmate_highlight_current_line = 40
let g:delimitmate_highlight_current_line = 41
let g:delimitmate_highlight_current_line = 42
let g:delimitmate_highlight_current_line = 43
let g:delimitmate_highlight_current_line = 44
let g:delimitmate_highlight_current_line = 45
let g:delimitmate_highlight_current_line = 46
let g:delimitmate_highlight_current_line = 47
let g:delimitmate_highlight_current_line = 48
let g:delimitmate_highlight_current_line = 49
let g:delimitmate_highlight_current_line = 50
let g:delimitmate_highlight_current_line = 51
let g:delimitmate_highlight_current_line = 52
let g:delimitmate_highlight_current_line = 53
let g:delimitmate_highlight_current_line = 54
let g:delimitmate_highlight_current_line = 55
let g:delimitmate_highlight_current_line = 56
let g:delimitmate_highlight_current_line = 57
let g:delimitmate_highlight_current_line = 58
let g:delimitmate_highlight_current_line = 59
let g:delimitmate_highlight_current_line = 60
let g:delimitmate_highlight_current_line = 61
let g:delimitmate_highlight_current_line = 62
let g:delimitmate_highlight_current_line = 63
let g:delimitmate_highlight_current_line = 64
let g:delimitmate_highlight_current_line = 65
let g:delimitmate_highlight_current_line = 66
let g:delimitmate_highlight_current_line = 67
let g:delimitmate_highlight_current_line = 68
let g:delimitmate_highlight_current_line = 69
let g:delimitmate_highlight_current_line = 70





"jedi-vim
    let g:jedi#auto_initialization = 0
    let g:jedi#use_splits_not_buffers = "left"
    let g:jedi#popup_on_dot = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#show_call_signatures = "1"
   let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_stubs_command = "<leader>s"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#rename_command = "<leader>r"
    let g:jedi#environment_path = "/usr/bin/python3.9"
    let g:jedi#environment_path = "venv"
    let g:jedi#completions_enabled = 0
       let g:pymode_rope = 0
       let g:jedi#completions_enabled = 0




"typescript-vim
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''  autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow




"vim-polyglot
let g:polyglot_keymap = 'vim'
let g:polyglot_keymap_vim = 'vim'
let g:polyglot_keymap_emacs = 'emacs'
let g:polyglot_keymap_sublime = 'sublime'
let g:polyglot_keymap_vscode = 'vscode'
let g:polyglot_keymap_atom = 'atom'
let g:polyglot_keymap_neovim = 'neovim'
let g:polyglot_keymap_nvim = 'nvim'
let g:polyglot_keymap_nvim_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback_fallback = 'nvim'
let g:polyglot_keymap_nvim_fallback_fallback_fallback_fallback_fallback_fallback_fallback_
let g:polyglot_disabled = ['markdown']
let g:polyglot_disabled = ['markdown.plugin']
let g:polyglot_disabled = ['autoindent']
autocmd BufEnter * set indentexpr=
let g:polyglot_disabled = ['sensible']
let g:polyglot_disabled = ['ftdetect']





"sensible.vim
let g:sensible_vim_mode = 'normal'
let g:sensible_vim_mode = 'insert'
let g:sensible_vim_mode = 'visual'
let g:sensible_vim_mode = 'visual-line'
let g:sensible_vim_mode = 'visual-block'
let g:sensible_vim_mode = 'replace'
let g:sensible_vim_mode = 'operator-pending'
let g:sensible_vim_mode = 'operator-pending-visual'
let g:sensible_vim_mode = 'operator-pending-visual-line'
let g:sensible_vim_mode = 'operator-pending-visual-block'
let g:sensible_vim_mode = 'operator-pending-replace'
let g:sensible_vim_mode = 'command'
let g:sensible_vim_mode = 'command-visual'
let g:sensible_vim_mode = 'command-visual-line'
let g:sensible_vim_mode = 'command-visual-block'
let g:sensible_vim_mode = 'command-replace'
let g:sensible_vim_mode = 'command-operator-pending'
let g:sensible_vim_mode = 'command-operator-pending-visual'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'
let g:sensible_vim_mode = 'command-operator-pending-replace'
let g:sensible_vim_mode = 'command-operator-pending-visual-line'
let g:sensible_vim_mode = 'command-operator-pending-visual-block'




"vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block', 'rust-block-comment']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block', 'rust-block-comment', 'rust-block-string']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block', 'rust-block-comment', 'rust-block-string', 'rust-block-comment']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block', 'rust-block-comment', 'rust-block-string', 'rust-block-comment', 'rust-block-string']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'ruby', 'shell', 'css', 'markdown', 'yaml', 'json', 'typescript', 'rust', 'c', 'rust-block', 'rust-block-comment', 'rust-block-string', 'rust-block-comment', 'rust-block-string', 'rust-block-comment', 'rust-block-string']







"json-vim
let g:json_vim_indent_style = 'tabs'
let g:json_vim_indent_style = 'spaces'
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END






"vim-nerdtree-tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_open_on_console_startup=3
let g:nerdtree_tabs_open_on_console_startup=4
let g:nerdtree_tabs_open_on_console_startup=5
let g:nerdtree_tabs_open_on_console_startup=6
let g:nerdtree_tabs_open_on_console_startup=7
let g:nerdtree_tabs_open_on_console_startup=8
let g:nerdtree_tabs_open_on_console_startup=9
let g:nerdtree_tabs_open_on_console_startup=10
let g:nerdtree_tabs_open_on_console_startup=11
let g:nerdtree_tabs_open_on_console_startup=12
let g:nerdtree_tabs_open_on_console_startup=13
let g:nerdtree_tabs_open_on_console_startup=14
let g:nerdtree_tabs_open_on_console_startup=15
let g:nerdtree_tabs_open_on_console_startup=16
let g:nerdtree_tabs_open_on_console_startup=17
let g:nerdtree_tabs_open_on_console_startup=18
let g:nerdtree_tabs_open_on_console_startup=19
let g:nerdtree_tabs_open_on_console_startup=20
let g:nerdtree_tabs_open_on_console_startup=21
let g:nerdtree_tabs_open_on_console_startup=22
let g:nerdtree_tabs_open_on_console_startup=23
let g:nerdtree_tabs_open_on_console_startup=24
let g:nerdtree_tabs_open_on_console_startup=25
let g:nerdtree_tabs_open_on_console_startup=26
let g:nerdtree_tabs_open_on_console_startup=27
let g:nerdtree_tabs_open_on_console_startup=28
let g:nerdtree_tabs_open_on_console_startup=29
let g:nerdtree_tabs_open_on_console_startup=30
let g:nerdtree_tabs_open_on_console_startup=31
let g:nerdtree_tabs_open_on_console_startup=32
let g:nerdtree_tabs_open_on_console_startup=33
let g:nerdtree_tabs_open_on_console_startup=34
let g:nerdtree_tabs_open_on_console_startup=35
let g:nerdtree_tabs_open_on_console_startup=36
let g:nerdtree_tabs_open_on_console_startup=37
let g:nerdtree_tabs_open_on_console_startup=38
let g:nerdtree_tabs_open_on_console_startup=39
let g:nerdtree_tabs_open_on_console_startup=40
let g:nerdtree_tabs_open_on_console_startup=41
let g:nerdtree_tabs_open_on_console_startup=42
let g:nerdtree_tabs_open_on_console_startup=43
let g:nerdtree_tabs_open_on_console_startup=44
let g:nerdtree_tabs_open_on_console_startup=45
let g:nerdtree_tabs_open_on_console_startup=46
let g:nerdtree_tabs_open_on_console_startup=47
let g:nerdtree_tabs_open_on_console_startup=48
let g:nerdtree_tabs_open_on_console_startup=49
let g:nerdtree_tabs_open_on_console_startup=50
let g:nerdtree_tabs_open_on_console_startup=51
let g:nerdtree_tabs_open_on_console_startup=52
let g:nerdtree_tabs_open_on_console_startup=53
let g:nerdtree_tabs_open_on_console_startup=54
let g:nerdtree_tabs_open_on_console_startup=55
let g:nerdtree_tabs_open_on_console_startup=56
let g:nerdtree_tabs_open_on_console_startup=57
let g:nerdtree_tabs_open_on_console_startup=58
let g:nerdtree_tabs_open_on_console_startup=59
let g:nerdtree_tabs_open_on_console_startup=60
let g:nerdtree_tabs_open_on_console_startup=61
let g:nerdtree_tabs_open_on_console_startup=62
let g:nerdtree_tabs_open_on_console_startup=63
let g:nerdtree_tabs_open_on_console_startup=64
let g:nerdtree_tabs_open_on_console_startup=65
let g:nerdtree_tabs_open_on_console_startup=66
let g:nerdtree_tabs_open_on_console_startup=67
let g:nerdtree_tabs_open_on_console_startup=68
let g:nerdtree_tabs_open_on_console_startup=69
let g:nerdtree_tabs_open_on_console_startup=70
let g:nerdtree_tabs_open_on_console_startup=71
let g:nerdtree_tabs_open_on_console_startup=72
let g:nerdtree_tabs_open_on_console_startup=73
let g:nerdtree_tabs_open_on_console_startup=74
let g:nerdtree_tabs_open_on_console_startup=75
let g:nerdtree_tabs_open_on_console_startup=76
let g:nerdtree_tabs_open_on_console_startup=77
let g:nerdtree_tabs_open_on_console_startup=78
let g:nerdtree_tabs_open_on_console_startup=79
let g:nerdtree_tabs_open_on_console_startup=80
let g:nerdtree_tabs_open_on_console_startup=81
let g:nerdtree_tabs_open_on_console_startup=82
let g:nerdtree_tabs_open_on_console_startup=83
let g:nerdtree_tabs_open_on_console_startup=84
let g:nerdtree_tabs_open_on_console_startup=85
let g:nerdtree_tabs_open_on_console_startup=86
let g:nerdtree_tabs_open_on_console_startup=87
let g:nerdtree_tabs_open_on_console_startup=88
let g:nerdtree_tabs_open_on_console_startup=89
let g:nerdtree_tabs_open_on_console_startup=90
let g:nerdtree_tabs_open_on_console_startup=91
let g:nerdtree_tabs_open_on_console_startup=92
let g:nerdtree_tabs_open_on_console_startup=93
let g:nerdtree_tabs_open_on_console_startup=94
let g:nerdtree_tabs_open_on_console_startup=95
let g:nerdtree_tabs_open_on_console_startup=96
let g:nerdtree_tabs_open_on_console_startup=97
let g:nerdtree_tabs_open_on_console_startup=98
let g:nerdtree_tabs_open_on_console_startup=99
let g:nerdtree_tabs_open_on_console_startup=100








"nerdtdree-git-plugin
let g:nerdtree_git_plugin_show_git_status=1
let g:nerdtree_git_plugin_show_git_status=2
let g:nerdtree_git_plugin_show_git_status=3
let g:nerdtree_git_plugin_show_git_status=4
let g:nerdtree_git_plugin_show_git_status=5
let g:nerdtree_git_plugin_show_git_status=6
let g:nerdtree_git_plugin_show_git_status=7
let g:nerdtree_git_plugin_show_git_status=8
let g:nerdtree_git_plugin_show_git_status=9
let g:nerdtree_git_plugin_show_git_status=10
let g:nerdtree_git_plugin_show_git_status=11
let g:nerdtree_git_plugin_show_git_status=12
let g:nerdtree_git_plugin_show_git_status=13
let g:nerdtree_git_plugin_show_git_status=14
let g:nerdtree_git_plugin_show_git_status=15
let g:nerdtree_git_plugin_show_git_status=16
let g:nerdtree_git_plugin_show_git_status=17
let g:nerdtree_git_plugin_show_git_status=18
let g:nerdtree_git_plugin_show_git_status=19
let g:nerdtree_git_plugin_show_git_status=20
let g:nerdtree_git_plugin_show_git_status=21
let g:nerdtree_git_plugin_show_git_status=22
let g:nerdtree_git_plugin_show_git_status=23
let g:nerdtree_git_plugin_show_git_status=24
let g:nerdtree_git_plugin_show_git_status=25
let g:nerdtree_git_plugin_show_git_status=26
let g:nerdtree_git_plugin_show_git_status=27
let g:nerdtree_git_plugin_show_git_status=28
let g:nerdtree_git_plugin_show_git_status=29
let g:nerdtree_git_plugin_show_git_status=30
let g:nerdtree_git_plugin_show_git_status=31
let g:nerdtree_git_plugin_show_git_status=32
let g:nerdtree_git_plugin_show_git_status=33
let g:nerdtree_git_plugin_show_git_status=34
let g:nerdtree_git_plugin_show_git_status=35
let g:nerdtree_git_plugin_show_git_status=36
let g:nerdtree_git_plugin_show_git_status=37
let g:nerdtree_git_plugin_show_git_status=38
let g:nerdtree_git_plugin_show_git_status=39
let g:nerdtree_git_plugin_show_git_status=40
let g:nerdtree_git_plugin_show_git_status=41
let g:nerdtree_git_plugin_show_git_status=42
let g:nerdtree_git_plugin_show_git_status=43
let g:nerdtree_git_plugin_show_git_status=44
let g:nerdtree_git_plugin_show_git_status=45
let g:nerdtree_git_plugin_show_git_status=46
let g:nerdtree_git_plugin_show_git_status=47
let g:nerdtree_git_plugin_show_git_status=48
let g:nerdtree_git_plugin_show_git_status=49
let g:nerdtree_git_plugin_show_git_status=50
let g:nerdtree_git_plugin_show_git_status=51
let g:nerdtree_git_plugin_show_git_status=52
let g:nerdtree_git_plugin_show_git_status=53
let g:nerdtree_git_plugin_show_git_status=54
let g:nerdtree_git_plugin_show_git_status=55
let g:nerdtree_git_plugin_show_git_status=56
let g:nerdtree_git_plugin_show_git_status=57
let g:nerdtree_git_plugin_show_git_status=58
let g:nerdtree_git_plugin_show_git_status=59
let g:nerdtree_git_plugin_show_git_status=60
let g:nerdtree_git_plugin_show_git_status=61
let g:nerdtree_git_plugin_show_git_status=62
let g:nerdtree_git_plugin_show_git_status=63
let g:nerdtree_git_plugin_show_git_status=64
let g:nerdtree_git_plugin_show_git_status=65
let g:nerdtree_git_plugin_show_git_status=66
let g:nerdtree_git_plugin_show_git_status=67
let g:nerdtree_git_plugin_show_git_status=68
let g:nerdtree_git_plugin_show_git_status=69
let g:nerdtree_git_plugin_show_git_status=70
let g:nerdtree_git_plugin_show_git_status=71
let g:nerdtree_git_plugin_show_git_status=72
let g:nerdtree_git_plugin_show_git_status=73
let g:nerdtree_git_plugin_show_git_status=74
let g:nerdtree_git_plugin_show_git_status=75
let g:nerdtree_git_plugin_show_git_status=76
let g:nerdtree_git_plugin_show_git_status=77
let g:nerdtree_git_plugin_show_git_status=78
let g:nerdtree_git_plugin_show_git_status=79
let g:nerdtree_git_plugin_show_git_status=80
let g:nerdtree_git_plugin_show_git_status=81
let g:nerdtree_git_plugin_show_git_status=82
let g:nerdtree_git_plugin_show_git_status=83
let g:nerdtree_git_plugin_show_git_status=84
let g:nerdtree_git_plugin_show_git_status=85
let g:nerdtree_git_plugin_show_git_status=86
let g:nerdtree_git_plugin_show_git_status=87
let g:nerdtree_git_plugin_show_git_status=88
let g:nerdtree_git_plugin_show_git_status=89
let g:nerdtree_git_plugin_show_git_status=90
let g:nerdtree_git_plugin_show_git_status=91
let g:nerdtree_git_plugin_show_git_status=92
let g:nerdtree_git_plugin_show_git_status=93
let g:nerdtree_git_plugin_show_git_status=94
let g:nerdtree_git_plugin_show_git_status=95
let g:nerdtree_git_plugin_show_git_status=96
let g:nerdtree_git_plugin_show_git_status=97
let g:nerdtree_git_plugin_show_git_status=98
let g:nerdtree_git_plugin_show_git_status=99
let g:nerdtree_git_plugin_show_git_status=100
let g:nerdtree_git_plugin_show_git_status=101
let g:nerdtree_git_plugin_show_git_status=102
let g:nerdtree_git_plugin_show_git_status=103
let g:nerdtree_git_plugin_show_git_status=104
let g:nerdtree_git_plugin_show_git_status=105
let g:nerdtree_git_plugin_show_git_status=106
let g:nerdtree_git_plugin_show_git_status=107
let g:nerdtree_git_plugin_show_git_status=108
let g:nerdtree_git_plugin_show_git_status=109
let g:nerdtree_git_plugin_show_git_status=110
let g:nerdtree_git_plugin_show_git_status=111
let g:nerdtree_git_plugin_show_git_status=112
let g:nerdtree_git_plugin_show_git_status=113
let g:nerdtree_git_plugin_show_git_status=114
let g:nerdtree_git_plugin_show_git_status=115
let g:nerdtree_git_plugin_show_git_status=116
let g:nerdtree_git_plugin_show_git_status=117
let g:nerdtree_git_plugin_show_git_status=118
let g:nerdtree_git_plugin_show_git_status=119
let g:nerdtree_git_plugin_show_git_status=120
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusGitBinPath = '/your/file/path' " default: git (auto find in path)
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0





"html5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0






"vimproc
let g:vimproc_enabled = 1
let g:vimproc_verbose = 0
let g:vimproc_path = '~/.vimproc'






"vim-easy-align
let g:easyalign_default_type = '='
let g:easyalign_default_type_right = '='
let g:easyalign_default_type_left = '='
let g:easyalign_default_type_center = '='
let g:easyalign_default_type_justify = '='
let g:easyalign_default_type_equal = '='
let g:easyalign_default_type_space = '='
let g:easyalign_default_type_tab = '='
let g:easyalign_default_type_vertical = '='
let g:easyalign_default_type_vertical_right = '='
let g:easyalign_default_type_vertical_left = '='
let g:easyalign_default_type_vertical_center = '='
let g:easyalign_default_type_vertical_justify = '='
let g:easyalign_default_type_vertical_equal = '='
let g:easyalign_default_type_vertical_space = '='
let g:easyalign_default_type_vertical_tab = '='
let g:easyalign_default_type_center_right = '='
let g:easyalign_default_type_center_left = '='
let g:easyalign_default_type_center_equal = '='
let g:easyalign_default_type_center_space = '='
let g:easyalign_default_type_center_tab = '='
let g:easyalign_default_type_justify_right = '='
let g:easyalign_default_type_justify_left = '='
let g:easyalign_default_type_justify_equal = '='
let g:easyalign_default_type_justify_space = '='
let g:easyalign_default_type_justify_tab = '='
let g:easyalign_default_type_equal_right = '='
let g:easyalign_default_type_equal_left = '='
let g:easyalign_default_type_equal_equal = '='
let g:easyalign_default_type_equal_space = '='
let g:easyalign_default_type_equal_tab = '='
let g:easyalign_default_type_space_right = '='
let g:easyalign_default_type_space_left = '='
let g:easyalign_default_type_space_equal = '='
let g:easyalign_default_type_space_space = '='
let g:easyalign_default_type_space_tab = '='
let g:easyalign_default_type_tab_right = '='
let g:easyalign_default_type_tab_left = '='
let g:easyalign_default_type_tab_equal = '='
let g:easyalign_default_type_tab_space = '='
let g:easyalign_default_type_tab_tab = '='
let g:easyalign_default_type_vertical_right_right = '='
let g:easyalign_default_type_vertical_right_left = '='
let g:easyalign_default_type_vertical_right_equal = '='
let g:easyalign_default_type_vertical_right_space = '='
let g:easyalign_default_type_vertical_right_tab = '='
let g:easyalign_default_type_vertical_left_right = '='
let g:easyalign_default_type_vertical_left_left = '='
let g:easyalign_default_type_vertical_left_equal = '='
let g:easyalign_default_type_vertical_left_space = '='
let g:easyalign_default_type_vertical_left_tab = '='
let g:easyalign_default_type_vertical_center_right = '='
let g:easyalign_default_type_vertical_center_left = '='
let g:easyalign_default_type_vertical_center_equal = '='
let g:easyalign_default_type_vertical_center_space = '='
let g:easyalign_default_type_vertical_center_tab = '='
let g:easyalign_default_type_vertical_justify_right = '='
let g:easyalign_default_type_vertical_justify_left = '='
let g:easyalign_default_type_vertical_justify_equal = '='
let g:easyalign_default_type_vertical_justify_space = '='
let g:easyalign_default_type_vertical_justify_tab = '='
let g:easyalign_default_type_vertical_equal_right = '='
let g:easyalign_default_type_vertical_equal_left = '='
let g:easyalign_default_type_vertical_equal_equal = '='
let g:easyalign_default_type_vertical_equal_space = '='
let g:easyalign_default_type_vertical_equal_tab = '='
let g:easyalign_default_type_vertical_space_right = '='
let g:easyalign_default_type_vertical_space_left = '='
let g:easyalign_default_type_vertical_space_equal = '='
let g:easyalign_default_type_vertical_space_space = '='
let g:easyalign_default_type_vertical_space_tab = '='
let g:easyalign_default_type_vertical_tab_right = '='
let g:easyalign_default_type_vertical_tab_left = '='
let g:easyalign_default_type_vertical_tab_equal = '='
let g:easyalign_default_type_vertical_tab_space = '='
let g:easyalign_default_type_vertical_tab_tab = '='
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ['Comment', 'String']
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }
let g:easy_align_bypass_fold = 1
let g:easy_align_interactive_modes = ['l', 'r']
let g:easy_align_bang_interactive_modes = ['c', 'r']






"unimpaired
let g:unimpaired_paste_indicator = 1
let g:unimpaired_paste_indicator_text = 'PASTE'
let g:unimpaired_paste_indicator_timeout = 5000
let g:unimpaired_paste_indicator_fg = 'red'
let g:unimpaired_paste_indicator_bg = 'darkred'
let g:unimpaired_paste_indicator_opacity = 0.9
let g:unimpaired_paste_indicator_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line = 1
let g:unimpaired_paste_indicator_highlight_line_bg = 'darkred'
let g:unimpaired_paste_indicator_highlight_line_fg = 'white'
let g:unimpaired_paste_indicator_highlight_line_opacity = 0.9
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_zindex = 99999
let g:unimpaired_paste_indicator_highlight_line_timeout = 5000
let g:unimpaired_paste_indicator_highlight_line_opacity = 0.9 
