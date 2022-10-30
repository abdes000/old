colorscheme gruvbox
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tabs_format = 'tabs'
let g:airline#extensions#tabline#tabs_format_string = '%s'

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_args = '--noselect'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode_string = 'ra'
let g:ctrlp_working_path_mode_string_with_git_dir = 'ra'
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
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