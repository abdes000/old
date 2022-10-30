"sets
noremap <leader>i :set insertmode<cr>
noremap <leader>ni :set noinsertmode<cr>
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
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp//,.
set clipboard=unnamedplus,unnamed
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
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*


"plugins

call plug#begin('~/.vim/plugged')

"primeagen
Plug 'ambv/black'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-projectionist'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-rfc'
Plug 'sbdchd/neoformat'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'hoob3rt/lualine.nvim'


"nickjj
Plug 'rakr/vim-one'
Plug 'gruvbox-community/gruvbox'
Plug '$XDG_DATA_HOME/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-zoom'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-mapping-mark-children.vim'
Plug 'tpope/vim-eunuch'
Plug 'will133/vim-dirdiff'
Plug 'AndrewRadev/linediff.vim'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
Plug 'machakann/vim-highlightedyank'
Plug 'unblevable/quick-scope'
Plug 'nelstrom/vim-visual-star-search'
Plug 'haya14busa/is.vim'
Plug 'mhinz/vim-grepper'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'Konfekt/FastFold'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/AutoComplPop'
Plug 'janko/vim-test'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails'
Plug 'vim-python/python-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'towolf/vim-helm'

"benawad
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax


"jeremyckahn
Plug 'vim-scripts/CSS-one-line--multi-line-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'MobiusHorizons/fugitive-stash.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'itchyny/lightline.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'bogado/file-line'
Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'moll/vim-node'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pechorin/any-jump.vim'
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-pug'
Plug 'jacquesbh/vim-showmarks'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'RRethy/vim-illuminate'
Plug 'rhysd/git-messenger.vim'
Plug 'voldikss/vim-floaterm'
Plug 'antoinemadec/coc-fzf'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'keith/swift.vim'
Plug 'chr4/nginx.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'sindrets/diffview.nvim' , { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}


"shawn
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

"sharifee
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'


"neuralnine
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors


"devaslife
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'hoob3rt/lualine.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'

"nvie
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'ElmCast/elm-vim'
Plug 'FooSoft/vim-argwrap'
Plug 'Lokaltog/vim-powerline'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'alunny/pegjs-vim'
Plug 'bling/vim-bufferline'
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'nvie/vim-align'
Plug 'nvie/vim-nox'
Plug 'nvie/vim-oceanic-next'
Plug 'nvie/vim-rule-of-law'
Plug 'othree/html5-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'scy/vim-mkdir-on-write'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tsl0922/vim-nginx'
Plug 'vim-scripts/YankRing.vim'
Plug 'nvie/python-mode'
Plug 'nvie/vim-flake8'

"gerardbm
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'preservim/nerdcommenter', { 'commit': 'a5d1663' }
Plug 'preservim/nerdtree'
Plug 'valloric/listtoggle'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim', { 'commit': '17ffeb9' }
Plug 'Shougo/neosnippet.vim', { 'commit': '037b7a7' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'ervandew/supertab'
Plug 'deoplete-plugins/deoplete-clang', { 'commit': '30f17cb' }
Plug 'fatih/vim-go', { 'tag': 'v1.19' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'deoplete-plugins/deoplete-go', { 'commit': 'fa73f06'}
Plug 'c9s/perlomni.vim'
Plug 'deoplete-plugins/deoplete-jedi', { 'commit': '46121d9' }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-liquid'
Plug 'shawncplus/phpcomplete.vim'
Plug 'eagletmt/neco-ghc'
Plug 'racer-rust/vim-racer'
Plug 'deoplete-plugins/deoplete-zsh', { 'commit': '12141ad' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'othree/jspc.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'Shougo/neco-vim', { 'commit' : '4c0203b' }
Plug 'othree/html5.vim'
Plug 'vim-language-dept/css-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/neco-syntax', { 'commit': '98cba4a' }
Plug 'mboughaba/i3config.vim'
Plug 'aklt/plantuml-syntax'
Plug 'gerardbm/asy.vim'
Plug 'gerardbm/eukleides.vim'
Plug 'zaid/vim-rec'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock'
Plug 'wellle/targets.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'terryma/vim-expand-region'
Plug 'Valloric/MatchTagAlways'
Plug 'FooSoft/vim-argwrap'
Plug 'gerardbm/vim-md-headings'
Plug 'matze/vim-move'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-characterize'
Plug 'tyru/open-browser.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'master' }
Plug 'gerardbm/vim-atomic'


"furion
Plug 'voldikss/vim-floaterm'
Plug 'reedes/vim-pencil'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'TaDaa/vimade'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'tpope/vim-fugitive'
Plug 'henrik/vim-indexed-search'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'rust' }
Plug 'jalvesaq/Nvim-R', { 'for': 'R' }
Plug 'chrisbra/csv.vim'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'gaalcaras/ncm-R'
Plug 'w0rp/ale'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go'
Plug 'vim-scripts/c.vim'
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


"makc
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/fountain.vim' | Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'

"jokao
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'safv12/andromeda.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'norcalli/nvim-colorizer.lua'
Plug 'terryma/vim-multiple-cursors'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'psliwka/vim-smoothie'


call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sjl/gundo.vim'
Plugin 'sjl/clam.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'junkblocker/patchreview-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mhinz/vim-signify'
Plugin 'int3/vim-extradite'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'millermedeiros/vim-esformatter'
Plugin 'leafgarland/typescript-vim'
Plugin 'prettier/vim-prettier'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'millermedeiros/vim-statline'
Plugin 'tomasr/molokai'
Plugin 'rakr/vim-one'
Plugin 'vim-scripts/summerfruit256.vim'
call vundle#end()


"configuration
"primeagen
" Adding local modules
let &runtimepath.=',' . expand("$HOME") . '/personal/harpoon/master'
let &runtimepath.=',' . expand("$HOME") . '/personal/vim-with-me/ui'
let &runtimepath.=',' . expand("$HOME") . '/personal/git-worktree.nvim/master'
let &runtimepath.=',' . expand("$HOME") . '/personal/refactoring.nvim/get-locals-2'

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <silent> Q <nop>
nnoremap <silent> <C-m> :silent !tmux neww bash -c "tmux-cht.sh"<CR>
inoremap <silent> <C-m> :silent !tmux neww bash -c "tmux-cht.sh"<CR>
nnoremap <silent> <C-f> :silent lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\n"); require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>gt <Plug>PlenaryTestFile
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vim-with-me").disconnect()<CR>
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

let g:theprimeagen_colorscheme = "gruvbox"
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:theprimeagen_colorscheme])
    else
        " TODO: What the way to use g:theprimeagen_colorscheme
        colorscheme gruvbox
    endif

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd
endfun
call ColorMyPencils()

" Vim with me
nnoremap <leader>cmp :call ColorMyPencils()<CR>
nnoremap <leader>vwb :let g:theprimeagen_colorscheme =

nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>

set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
    " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

augroup THE_PRIMEAGEN_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true

inoremap <silent><expr> <CR>      compe#confirm('<CR>')

nnoremap <C-Left> :call AfPPAlternatePluthPluth()<CR>
nnoremap <C-Up> :call AfPPAlternate()<CR>
inoremap <C-Left> <esc>:call AfPPAlternatePluthPluth()<CR>
inoremap <C-Up> <esc>:call AfPPAlternate()<CR>
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

nmap <leader>tt <Plug>PlenaryTestFile

nnoremap <leader>rr :lua require('theprimeagen.telescope').refactors()<CR>
vnoremap <leader>rr :lua require('theprimeagen.telescope').refactors()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF











"nickjj
" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Enable syntax highlighting.
syntax on

" Specific colorscheme settings (must come before setting your colorscheme).
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme.
colorscheme gruvbox
set background=dark

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "
" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Copy the current buffer's path to your clipboard.
nmap cp :let @+ = expand("%")<CR>

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>
cnoremap <F7> <C-c>:set list!<CR>

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" Convert the selected text's title case using the external tcc script.
"   Requires: https://github.com/nickjj/title-case-converter
vnoremap <Leader>tc c<C-r>=system('tcc', getreg('"'))[:-2]<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*aliases* set ft=sh

" Make sure Kubernetes yaml files end up being set as helm files.
au BufNewFile,BufRead *.{yaml,yml} if getline(1) =~ '^apiVersion:' || getline(2) =~ '^apiVersion:' | setlocal filetype=helm | endif

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Mappings to make Vim more friendly towards presenting slides.
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function! SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction

" ----------------------------------------------------------------------------
" Basic commands
" ----------------------------------------------------------------------------

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR>

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys.
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" Only underline the highlights instead of using custom colors.
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" .............................................................................
" ntpeters/vim-better-whitespace
" .............................................................................

let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" .............................................................................
" Konfekt/FastFold
" .............................................................................

let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=fnameescape($HOME).'/.local/lib/github-markdown-css/github-markdown.css'

" .............................................................................
" SirVer/ultisnips
" .............................................................................

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" .............................................................................
" janko/vim-test
" .............................................................................

if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

let test#python#pytest#executable='docker-compose exec web py.test'

let test#ruby#rails#executable='docker-compose exec -e RAILS_ENV=test webpacker rails test'

let test#elixir#exunit#executable='docker-compose exec -e MIX_ENV=test web mix test'

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>











"benawad
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }


let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

colorscheme gruvbox

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>










"jeremyckahn
syntax enable
set number
set hlsearch
set incsearch
set nocp
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set smartcase
set autoread
setlocal spelllang=en_us

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline

set cursorline

" https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile
set undodir=~/.vim/undodir

set sessionoptions-=blank
set sessionoptions-=buffers
set sessionoptions-=winsize

filetype plugin indent on    " required

function! InstallCocPlugins()
  CocInstall coc-tsserver coc-eslint coc-prettier coc-json coc-html coc-css coc-floaterm
endfunction

colo vim-monokai-tasty

" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
highlight Comment cterm=italic

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/comment-page-1/
" set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

" Ensure that :Reload-ing the file doesn't define redundant autocmds
" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup standard_group
  autocmd!

  " Force some file types to be other file types
  autocmd BufRead,BufNewFile *.ejs,*.mustache setfiletype html
  autocmd BufRead,BufNewFile *.json setfiletype json
  autocmd BufRead,BufNewFile *.json.* setfiletype json
  autocmd BufEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

  " http://www.reddit.com/r/vim/comments/2x5yav/markdown_with_fenced_code_blocks_is_great/
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  autocmd BufNewFile,BufReadPost *.dockerfile set filetype=Dockerfile
  autocmd BufNewFile,BufReadPost *.jenkinsfile set filetype=groovy

  " Don't fold automatically https://stackoverflow.com/a/8316817
  autocmd BufRead * normal zR

  " Open Ggrep results in a quickfix window
  autocmd QuickFixCmdPost *grep* cwindow

  " Resize splits in all tabs upon window resize
  " https://vi.stackexchange.com/a/206
  autocmd VimResized * Tabdo wincmd =

  " Disable line numbers in :term
  " https://stackoverflow.com/a/63908546
  autocmd TermOpen * setlocal nonumber norelativenumber

  " Reload file on focus/enter. This seems to break in Windows.
  " https://stackoverflow.com/a/20418591
  if !has("win32")
    autocmd FocusGained,BufEnter * :silent! !
  endif
augroup END

let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'sql']

set wildignore+=**/bower_components/**,**/node_modules/**,**/dist/**,**/bin/**,**/tmp/**

let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp_search = 0
let g:ctrlp_use_caching = 1

" https://github.com/xolox/vim-shell#the-gshell_fullscreen_items-option
let g:shell_fullscreen_items = "mT"
let g:shell_fullscreen_always_on_top = 0

if has("macunix") || has('win32')
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
endif

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

let mapleader = "\<Space>"

" Make it easier to use marks
nmap ' `

nmap <leader>E :Error<CR><C-w>j

" Toggle line numbers
nmap <leader>N :set number!<CR>

" Requires ripgrep
" https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

if has('win32')
  " Disable preview on Windows since it doesn't really work
  let g:fzf_preview_window = ''
else
  " Show file previews
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


  " Show mark previews
  " https://github.com/junegunn/fzf.vim/issues/184#issuecomment-575571950
  command! -bang -nargs=? Marks
    \ call fzf#vim#marks({'options': ['--preview', 'cat -n {-1} | egrep --color=always -C 10 ^[[:space:]]*{2}[[:space:]]']})
endif

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

" https://github.com/junegunn/fzf.vim/issues/162
let g:fzf_commands_expect = 'enter'

" Find files with fzf
nmap <leader>p :Files<CR>

" Shows Git history for the current buffer
command! FileHistory execute ":BCommits"

" Delete buffers
" https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

nmap bd :bd<CR>
nmap BD :Bdelete hidden<CR>

" Open every loaded buffer into a new tab
nmap bt :tab sball<CR>

let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1

let g:NERDSpaceDelims = 1

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

nmap <leader>n :call ToggleNERDTree()<CR>
nmap gt :NERDTreeFind<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :qa!<CR>
nmap mk :mks!<CR>

" Enable or disable auto width-formatting.
noremap <leader>f :call UnsetGutter()<CR>
noremap <leader>F :call SetGutter()<CR>


function! FormatFile()
  call CocAction('runCommand', 'prettier.formatFile')
  call CocAction('runCommand', 'eslint.executeAutofix')
endfunction

nmap <leader>b :call FormatFile()<CR>

" Format selected code.
xmap <leader>b  <Plug>(coc-format-selected)

nmap <leader>d :CocDiagnostics<cr>
nmap <leader>D :CocList diagnostics<cr>

" Disable Ex mode
nmap Q <Nop>

" Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

function! SetGutter()
  set tw=79
  exec 'set colorcolumn=' . join(range(80, 500), ',')
endfunction

function! UnsetGutter()
  set tw=0
  set colorcolumn=0
endfunction

if has('mouse')
  " https://vi.stackexchange.com/a/521
  set mouse=a
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

" allow buffer switching without saving
set hidden

"Case insensitive search.
set ic

" Gui stuff
if has("gui_running")
  set lines=150 columns=230 " Maximize gvim window.

  set guioptions-=T " Get rid of the toolbar
  set guioptions-=e " Get rid of the GUI tabs
  set guioptions-=r " Get rid of the right scrollbar
  set guioptions-=R " Get rid of the right scrollbar
  set guioptions-=l " Get rid of the left scrollbar
  set guioptions-=L " Get rid of the left scrollbar
  set guioptions-=b " Get rid of the bottom scrollbar
  set guifont=Ubuntu_Mono:h14

endif

:set backspace=indent,eol,start

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db


" --- remove sounds effects ---
set noerrorbells
" set visualbell


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

set t_Co=256

" show hidden whitespace
highlight ExtraWhitespace ctermbg=red guibg=red

" hitting jj will jump out of insert mode
inoremap jj <esc>

nmap ss :set syntax=off<CR>
nmap SS :set syntax=on<CR>
nmap sp :set spell!<CR>
nmap cl :set cursorline!<CR>
nmap cd :CocDisable<CR>
nmap ce :CocEnable<CR>

" quick vertical split
noremap <leader>v :vsp<CR><C-w><C-w>

" Quickly get rid of highlighting
noremap <leader>h :noh<CR>

" Make j and k work normally for soft wrapped lines
noremap <buffer> j gj
noremap <buffer> k gk

" Make the arrow keys work like TextMate in insert mode
inoremap <down> <C-C>gja
inoremap <up> <C-C>gka

" Insert common snippets
inoremap <C-c> console.log(
inoremap <C-d> describe('', () => {});<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
inoremap <C-t> test('', () => {});<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
inoremap <C-b> beforeEach(() => {});<Left><Left><Left>

nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>c :CtrlSFFocus<CR>
nmap <leader>C :CtrlSFToggle<CR>

if has("macunix")
  let g:ctrlsf_ackprg = '/usr/local/bin/rg'
elseif has("unix")
  let g:ctrlsf_ackprg = '/usr/bin/rg'
endif

let g:ctrlsf_winsize = '33%'
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }

" Fix Vim's ridiculous line wrapping model
set ww=<,>,[,],h,l

noremap <C-h> :tabp<CR>
noremap - :tabm -1<CR>
noremap <C-l> :tabn<CR>
noremap = :tabm +1<CR>
noremap <C-j> :tabc<CR>
noremap <C-k> :tabe <Bar> Startify<CR>

if has('win32')
  nmap <leader>t :tab term<CR>
else
  nmap <leader>t :FloatermNew<CR>
endif

tmap <C-h> <C-w>:tabp<CR>
tmap <C-y> <C-w>:tabm -1<CR>
tmap <C-l> <C-w>:tabn<CR>
tmap <C-p> <C-w>:tabm +1<CR>
tmap <C-j> <C-w><C-c>
tmap <C-k> <C-w>:tabe <Bar> Startify<CR>

let g:startify_change_to_dir=0

" Map <leader> + 1-9 to jump to respective tab
let i = 1
while i < 10
  execute ":nmap <leader>" . i . " :tabn " . i . "<CR>"
  let i += 1
endwhile

noremap <leader>M :LivedownPreview<CR>

" Open the current buffer in a new tab
noremap <leader>z :tab split<CR>

" Always show the status line (for vim-powerline)
set laststatus=2

" Necessary to show Unicode glyphs
set encoding=utf-8

set foldmethod=indent
set foldlevelstart=99 "start file with all folds opened

let g:javascript_plugin_jsdoc = 1

" https://github.com/mxw/vim-jsx#usage
let g:jsx_ext_required = 0

" https://medium.com/@rahul11061995/autocomplete-in-vim-for-js-developer-698c6275e341
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

noremap <leader>r :YcmRestartServer<CR>
noremap <leader>R :source ~/.vimrc<CR>

vmap <C-s> :'<,'>sort<CR>

nmap <leader>/ :BLines<CR>
nmap <leader>? :Rg<CR>
nmap bu :Buffers<CR>
nmap cc :Commands<CR>
nmap cm :Commits<CR>

nmap gb :GitMessenger<CR>

" Copy the GitHub deeplink for the selected lines (requires Fugitive/Rhubarb)
vmap gb :'<,'>GBrowse!<CR>

" Navigate to the GitHub deeplink for the selected lines (requires Fugitive/Rhubarb)
vmap gB :'<,'>GBrowse<CR>

command! Reload execute "source ~/.vimrc"

" This is handled by lightline
set noshowmode

" WebDevIcons
"
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! LightLineFilename()
  return WebDevIconsGetFileTypeSymbol(expand('%')) . ' ' . expand('%')
endfunction

" Show file path in lightline
" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-119130738
"
" Show devicons in tabs
" https://github.com/itchyny/lightline.vim/issues/469#issuecomment-630597998
let g:lightline = {
  \ 'colorscheme': 'darcula',
  \ 'active': {
  \   'right': [['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'], ['lineinfo'], ['fileformat', 'filetype']]
  \ },
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ },
  \ 'component': {
  \   'lineinfo': "[%l:%-v] [%{printf('%03d/%03d',line('.'),line('$'))}]",
  \ },
  \ 'tab_component_function': {
  \   'tabnum': 'LightlineWebDevIcons',
  \ }
  \ }

call lightline#coc#register()

let g:highlightedyank_highlight_duration = 200

command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" Go to definition and type definition in new tab
nmap <silent> gD :tab split<CR><Plug>(coc-definition)
nmap <silent> gY :tab split<CR><Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap \ :CocList --auto-preview floaterm<CR><Tab>p

nnoremap <silent> gl :CocFzfListResume<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>

" Print the number of occurrences of the current word under the cursor
" (comma + *)
map ,* *<C-O>:%s///gn<CR>

" Run a command on all tabs and return to the current tab
" https://vim.fandom.com/wiki/Run_a_command_in_multiple_buffers#Restoring_position
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

let g:git_messenger_always_into_popup=v:true
let g:git_messenger_include_diff="current"

let g:floaterm_autoclose=1
let g:floaterm_height=0.95
let g:floaterm_width=0.95

let g:floaterm_keymap_toggle = '<C-f>'

" tnoremap <silent> <C-h> <C-\><C-n>:FloatermPrev<CR>
" tnoremap <silent> <C-l> <C-\><C-n>:FloatermNext<CR>
" tnoremap <silent> <C-j> <C-\><C-n>:FloatermKill<CR>
" tnoremap <silent> <C-k> <C-\><C-n>:FloatermNew<CR>

" Break floaterm execution into Normal mode
tnoremap <silent> <C-b> <C-\><C-n>









"shawn
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
    set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
  endif
endif

" Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>









"sharifee
filetype plugin on

let mapleader = "-"
let maplocalleader = "\\"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

" open files with ctrl-p
nnoremap <c-p> :Files<cr>

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

set encoding=utf-8

syntax on

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

highlight Comment cterm=italic gui=italic

set laststatus=2
" set showtabline=2

" true colours
set background=dark
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"colorscheme jellybeans

set nu rnu " relative line numbering
set clipboard=unnamed " public copy/paste register
set ruler
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches

"clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" update changes into current buffer
nnoremap <leader>sv :source $MYVIMRC<cr>
" enable or disable line wrapping in current buffer
nnoremap <buffer> <localleader>w :set wrap!<cr>

" c++11 support in syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'


" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
augroup END










"neuralnine
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

":colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"










"devaslife
set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
"   runtime ./colors/NeoSolarized.vim
"   colorscheme NeoSolarized
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

lua << EOF
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})



local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}

EOF

"completion
if !exists('g:loaded_completion') | finish | endif

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
let g:completion_chain_complete_list = {
        \ 'default' : {
        \   'default': [
        \       {'complete_items': ['lsp', 'snippet', 'path']},
        \       {'mode': '<c-p>'},
        \       {'mode': '<c-n>'}],
        \   'comment': []
        \   }
        \}

lua <<EOF
local remap = vim.api.nvim_set_keymap
local status, npairs = pcall(require, "nvim-autopairs")
if (not status) then return end

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
      require'completion'.confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
EOF

"defx
if !exists('g:loaded_defx') | finish | endif

" Define mappings
"cnoreabbrev sf Defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })



"fugitive

" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

cnoreabbrev g Git
cnoreabbrev gopen GBrowse

"lsp-color
if !exists('#LspColors') | finish | endif

lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF

"lspconfig
if !exists('g:lspconfig')
  finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  require'completion'.on_attach(client, bufnr)

  --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

nvim_lsp.flow.setup {
  on_attach = on_attach
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

EOF

"lspsaga
if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

"tabline
" Description: My custom tabline settings

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i + 1 == tabpagenr()
      let s .= '%#TabLineSep#'
    elseif i + 2 == tabpagenr()
      let s .= '%#TabLineSep2#'
    else
      let s .= ''
    endif
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  let label = fnamemodify(name, ':t')
  return len(label) == 0 ? '[No Name]' : label
endfunction

set tabline=%!MyTabLine()

"telescope
if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

"treesitter
if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

"devicons
if !exists('g:loaded_devicons') | finish | endif

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF










"sebberkarlson
set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8

filetype plugin indent on

set omnifunc=syntaxComplete#Complete

" ==== Colors and other basic settings
colorscheme gruvbox
" colorscheme C64
set guifont=Inconsolata\ 14
" set guifont=C64\ Pro\ Mono\ 8
set fillchars+=vert:\|
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=2 sw=2 et
set shiftwidth=2
set tabstop=2
let g:vim_json_syntax_conceal = 0
set colorcolumn=80
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:set lines=999 columns=999

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint', 'tslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'flake8', 'python' ]
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_flake8_config_file='.flake8'

" === typescript
let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript noremap <silent> <C-]> :TsuDefinition<CR>
autocmd FileType typescriptreact noremap <silent> <C-]> :TsuDefinition<CR>

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'] }
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" === generate ctags
" echo "generating tags..."
" call system('ctags -R . ')

let g:pymode_indent = 0
" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"
set secure









"seven1
syntax on                                       " enable syntax highlighting
set background=dark                             " we like it dark!
try | colorscheme gruvbox | catch | endtry      " use this awesome theme if possible
highlight Pmenu ctermbg=black guibg=black     | " fix popup color so it's easier to read
filetype plugin on                              " load plugins based on file type
filetype indent on                              " load indent settings based on file type
set shiftwidth=2                                " number of spaces to use for indenting
set softtabstop=2                               " number of spaces to use when inserting a tab
set tabstop=2                                   " show tabs as 2 spaces
set expandtab                                   " convert tabs into spaces
set autoindent                                  " copy indent from previous line
set nowrap                                      " don't wrap long lines
set ignorecase smartcase                        " search case-insensitively unless uppercase characters are used
set hidden                                      " allow unsaved buffers to be hidden
set ruler                                       " show cursor line and column in status
set showcmd                                     " show current command in status line
set notimeout                                   " disable timeout for finishing a mapping key sequence
set visualbell                                  " visual bell = no sounds
set undofile                                    " store undo info in a file
set undodir=~/.vim-undo                         " where to store undo info
set dir=~/tmp,/tmp                              " store swap files in $HOME/tmp or /tmp, whichever is available
set scrolloff=3                                 " keep 3 lines visible above/below the cursor when scrolling
set sidescrolloff=7                             " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                                " scroll left/right one character at a time
set splitbelow splitright                       " put new windows below or to the right

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

" where to find headers/src files
let g:alternateSearchPath = 'sfr:../src,sfr:../../src,sfr:../include'









"makc
"General Settings
set encoding=UTF-8 nobackup nowritebackup nocursorline splitbelow splitright wildmode=longest,list,full
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab spell spelllang=en_us
au BufRead,BufNewFile *.fountain set filetype=fountain

"Status Line
set statusline=
set statusline+=%#NonText#
set statusline+=%=
set statusline+=\ %f
set statusline+=\
set statusline+=%#CursorLineNr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#IncSearch#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Key-bindings
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <leader>n :Lex!<CR>
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <leader><C-l> :set nofoldenable<CR>
nnoremap <C-l> :set foldmethod=indent<CR>
nnoremap <C-k> :set foldmethod=syntax<CR>
nnoremap Q <nop>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"Color Settings
colorscheme gruvbox
set background=dark
set termguicolors
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"Goyo Settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()










"jokao
set guioptions-=T
set guioptions-=L
"Get out of insert mode
"Salir de modo insertar
imap jk <Esc>
imap <C-c> <Esc>l
"mueve bloques de codigo en modo visual o V-Line
"Moves Blocks of code in visual mode or V-Line xnoremap K :move '<-2<CR>gv-gv xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" Better indenting
" Mejor Indentación
vnoremap < <gv
vnoremap > >gv

"save file
"guardar archivo
nmap <leader>w :w <CR>
"cerrar ventana
"close current  window
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"search commands
"comandos de busqueda
nmap <leader>gs  :CocSearch
nmap <leader>fs :FZF<CR>
nmap <leader>rg :Rg<CR>
"configuracion de tabs
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]

"abrir Nerdtree
"open nerdtree
nmap <Leader>e :NERDTree<CR>

"open cocExplorer
"Buscar dos carácteres con easymotion
"Search for two chars with easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" TAB in general mode will move to text buffer
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" SHIFT-TAB va para atras
nnoremap <silent> <S-TAB> :bprevious<CR>
"close buffer
"cerrar buffer
nmap <leader>bd :bdelete<CR>
"--gruvbox config--
"colorscheme onedark
"let g:gruvbox_contrast_dark = "medium"

set cmdheight=1
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
"colorscheme tokyonight
"Close tags automatically
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
"-----------------------------------------------------------------

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
if has("patch-8.1.1564")
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
  nnoremap <slent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" use CTRL-S for selections ranges.
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
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>i

" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:ariline_powerline_fonts = 1
let g:ariline_theme='onedark'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

"Git integration config
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'










"millermedeiros
syntax on
filetype plugin indent on   " enable detection, plugins and indent


" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps


" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
                            "   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.


" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
                            "   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set esckeys                     " Allow cursor keys in insert mode.
set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others


" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif




" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

let g:molokai_original=0
"colorscheme molokai
" make 'var' keyword easier to spot
hi link javascriptType Keyword
" default ColorColumn is too distractive
hi clear ColorColumn
hi link ColorColumn FoldColumn
" defaul line number is too distractive
hi clear LineNr
hi link LineNr Comment
hi link OverLength Error

" --- UI settings ---


if has('gui_running')
    "set guifont=Menlo:h13
    set gfn:Monaco:h14
    set transp=0

    " toolbar and scrollbars
    set guioptions-=T       " remove toolbar
    set guioptions-=L       " left scroll bar
    set guioptions-=r       " right scroll bar
    set guioptions-=b       " bottom scroll bar
    set guioptions-=h      " only calculate bottom scroll size of current line
    set shortmess=atI       " Don't show the intro message at start and
                            "   truncate msgs (avoid press ENTER msgs).
endif


set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
                            "   horizontally.

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" use relative line number by default
" if exists('+relativenumber')
  " set relativenumber
" endif

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set wildignore+=*/coverage


" --- diff ---
set diffopt=filler          " Add vertical spaces to keep right
                            "   and left aligned.
set diffopt+=iwhite         " Ignore whitespace changes.


" --- folding---
set foldmethod=manual       " manual fold
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list


" --- remove sounds effects ---
set noerrorbells
set visualbell




" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=120
"set colorcolumn=+1              " Show large lines
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.



" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggle<CR>


" --- NERDCommenter ---

let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
\ }


" --- Syntastic : Linting / Error check ---
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
" close/open location list (errors)
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :Errors<CR> :lw<CR>
noremap <silent><leader>ln :lnext<CR>
noremap <silent><leader>lp :lprev<CR>

" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslintme'
" let g:syntastic_javascript_eslint_generic = 1


" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" see [autocommands] at the end for more autocomplete settings

" nodejs-complete / jscomplete
let g:node_usejscomplete = 1
let g:jscomplete_use = ['dom', 'moz']

let g:SuperTabMappingForward = '<s-Tab>'
let g:SuperTabMappingBackward = '<s-c-Tab>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabDefaultCompletionType = "<c-p>"


" --- snipmate ---
let g:snips_author = 'Miller Medeiros'


" --- EasyMotion ---
let g:EasyMotion_leader_key = '<Leader>m'
" lets make <leader>F and <leader>f use easymotion by default
let g:EasyMotion_mapping_f = '<leader>f'
let g:EasyMotion_mapping_F = '<leader>F'



" --- Strip trailing whitespace ---
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Trailing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>


" --- matchit ---
runtime macros/matchit.vim          " enable matchit (better '%' key mapping)


" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1


" --- vim-signify ---
let g:signify_update_on_focusgained = 1


" --- Command-T ---
" let g:CommandTMaxFiles=2000
" let g:CommandTMaxHeight=12
" noremap <silent> <leader>tt :CommandT<CR>
" noremap <silent> <leader>bt :CommandTBuffer<CR>
" noremap <silent> <leader>tf :CommandTFlush<CR>

" --- Ctrl-P ---
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
noremap <silent> <leader>tt :CtrlP<CR>
noremap <silent> <leader>bt :CtrlPBuffer<CR>
noremap <silent> <leader>tf :CtrlPClearCache<CR>



" --- LustyJuggler ---
let g:LustyJugglerSuppressRubyWarning = 1  " avoid error if running on terminal


" --- statline ---
" errors color
hi User3 guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
let g:statline_mixed_indent_string = '[mix]'


" --- gundo ---
nnoremap <leader>gu :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1


" --- toggle indentation mode ---

function! ToggleExpandTab()
    if &et
        set noet softtabstop=0
    else
        execute "set et softtabstop=". &tabstop
    endif
endfunction

noremap <silent> <leader>et :call ToggleExpandTab()<CR>


" --- Show syntax highlighting groups for word under cursor ---
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
nnoremap <leader>sh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" faster when opening files with large lines
set synmaxcol=300


" --- Highlight word under cursor ---
" hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
" nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr>


" --- Tabular.vim ---
noremap <silent> <leader>t: :Tabularize /:<CR>
noremap <silent> <leader>t= :Tabularize /=<CR>
noremap <silent> <leader>t, :Tabularize /,<CR>
noremap <silent> <leader>t{ :Tabularize /{<CR>
noremap <silent> <leader>t" :Tabularize /"<CR>
noremap <silent> <leader>t' :Tabularize /'<CR>
noremap <silent> <leader>t[ :Tabularize /[<CR>
noremap <silent> <leader>t/ :Tabularize ///<CR>
noremap <silent> <leader>t\| :Tabularize /\|<CR>


" --- include content of static files ---
" borrowed from: http://vim.1045645.n5.nabble.com/vim-counterpart-for-persistent-includes-td4276915.html

function! IncludeStatic()
 :g/<!-- #include "[^"]*" -->\_.\{-}<!-- end include -->/let fname = matchstr(getline('.'),'<!-- #include "\zs[^"]*\ze" -->')|exec '+,/<!-- end include -->/-!cat '.fnameescape(fname)
endfunction

noremap <silent> <leader>ic :call IncludeStatic()<CR>



" --- convert selected text from markdown to HTML ---
vnoremap <silent> <leader>md :! mdown<CR>

function! SanitizeMdown()
    %s/<\/\?p>//
    %s/<br \?\/\?>/ /
    %s/<pre><code>/<pre class="brush:js">\r/
    %s/<\/code><\/pre>/<\/pre>/
endfunc
noremap <silent> <leader>mds :call SanitizeMdown()<CR>



" --- format JavaScript source code using esformatter --

nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>



" --- toggle autocomplete behavior and word delimiters ---

" better auto complete for CSS class names
" more info: http://blog.millermedeiros.com/vim-css-complete/

function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc


" --- visual block move ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=35m10

let g:DVB_TrimWS = 1
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D          DVB_Duplicate()


" --- transform lists ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=17m30

nmap <leader>ls :call ListTrans_toggle_format()<CR>
vmap <leader>ls :call ListTrans_toggle_format('visual')<CR>



" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" mapleader set at the top of the file to avoid conflicts


" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" next tab
nnoremap <C-Tab> :tabn<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Bubble single lines, similar to Eclipse (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Duplicate lines, similar to Eclipse
noremap <C-S-Up> YP
noremap <C-S-Down> YP

" 'fix' search regexp to be compatible with Perl format
" nmap / /\v
" vmap / /\v

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll()<CR> *
nnoremap # :silent call KeywordsAll()<CR> #


" --- COMMON STUFF / HELPERS ---

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" Open file (useful for HTML)
noremap <silent> <leader>o :!open %<CR>

" Reformat code
nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Pull word under cursor into LHS of a substitute (find and replace)
nnoremap <leader>rr :silent call KeywordsAll()<CR> :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Insert/append a single character
" noremap ,, i_<esc>r
" noremap ;; a_<esc>r

" Visually select the text that was last edited/pasted
nnoremap <leader>v `[v`]

" fast Ack
nnoremap <leader>a :tab split<CR>:Ack<Space>
nnoremap <leader>aw :silent call KeywordsAll()<CR> :tab split<CR>:Ack<cword><CR> :silent call KeywordsBasic()<CR>

" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>


" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Move windows around (only works on same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
map <leader>bp :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" add spaces inside current parenthesis
map <leader>( vi(xi  P



" -----------------------------------------------------------------------------
" FILE HANDLING
" -----------------------------------------------------------------------------

" [autocommands] borrowed from @bit-theory vimfiles and edited
augroup mm_buf_cmds
    " clear commands before resetting
    autocmd!

    " when vimrc is edited, reload it
    autocmd bufwritepost .gvimrc source %
    autocmd bufwritepost .vimrc source %

    " Only show cursorline in the current window and in normal mode
    au WinLeave,InsertEnter * set nocul
    au WinEnter,InsertLeave * set cul

    " filetype
    autocmd BufNewFile,BufRead *.json setf json
    autocmd BufNewFile,BufRead *.hx setf haxe

    autocmd FileType mustache runtime! ftplugin/html/sparkup.vim

    " Enable omnicomplete for supported filetypes
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " jscomplete is a separate plugin
    autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " make `gf` search for .js files
    autocmd FileType javascript,javascript.jsx setlocal suffixesadd=.js
    autocmd FileType javascript,javascript.jsx setlocal path+=js,scripts,src

    " make sure `complete` works as expected for CSS class names without
    " messing with motions (eg. '.foo-bar__baz') and we make sure all
    " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
    autocmd InsertEnter,BufLeave * :silent call KeywordsAll()
    autocmd InsertLeave,BufEnter * :silent call KeywordsBasic()

    " yes, we need to duplicate it on VimEnter for some weird reason
    autocmd VimEnter * nnoremap * :silent call KeywordsAll()<CR> *
    autocmd VimEnter * nnoremap # :silent call KeywordsAll()<CR> #

    " Toggle relative/absolute line numbers during edit
    " if exists('+relativenumber')
        " autocmd InsertEnter * setl nu
        " autocmd InsertLeave,BufEnter * setl rnu
    " endif

    " highlight char at column 121 (textwidth + 1)
    autocmd BufEnter * match OverLength /\%121v/

    " Color Column (only on insert)
    if exists("&colorcolumn")
        autocmd InsertEnter * set colorcolumn=120
        autocmd InsertLeave * set colorcolumn=""
    endif
augroup EN









"nvie
" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on

" Change shell
set shell=bash                  " Vim expects a POSIX-compliant shell, which Fish (my default shell) is not

" Change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)


set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
set autoread                    " automatically reload files changed outside of Vim

set updatetime=1000             " Speed up the updatetime so gitgutter and friends are quicker

" Make the keyboard faaaaaaast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Toggle show/hide invisible chars
nnoremap <leader>I :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" Triggers global-search-and-replace. Prompts for a replacement string and
" will replace all matches from the previous search command.
" nnoremap <leader>r :%s//
nnoremap <leader>r :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:%s//

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
" }}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set cmdheight=2                 " use a status bar that is 2 rows high
" }}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.config/nvim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set nowritebackup               " do not write out changes via backup files
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.config/nvim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set nocursorline                " don't highlight the current line (useful for quick orientation, but also slow to redraw)
set inccommand=nosplit          " live preview of substitutions with `:s`
" }}}

nnoremap <leader>, :set cursorline!<cr>  " toggle highlighting the cursor line

" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        lclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        lopen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Toggle the foldcolumn {{{
nnoremap <leader>F :call FoldColumnToggle()<cr>

let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn

function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
    endif
endfunction
" }}}

" Highlighting {{{

if (has("termguicolors"))
   set termguicolors
endif

" }}}

" Shortcut mappings {{{
" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap ; :
nnoremap <leader>; ;

" Avoid accidental hits of <F1> while aiming for <Esc>
noremap! <F1> <Esc>

nnoremap <leader>Q :q<CR>    " Quickly close the current window
nnoremap <leader>q :bd<CR>   " Quickly close the current buffer

" Use Q for formatting the current paragraph (or visual selection)
" This used to be `gq` and `gqap`, but the "w" variant is the same, but puts
" the cursor back at the original position after performing the
" transformation. See https://github.com/nvie/vimrc/issues/16
vnoremap Q gw
nnoremap Q gwap
" set breakindent on  " keep paragraph indentation when re-wrapping text

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Shortcut to make
nnoremap mk :make<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" nnoremap <leader>w <C-w>v<C-w>l

" Complete whole filenames/lines with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
" vnoremap <silent> x "_x  TODODODOOo

" Quick yanking to the end of the line
nnoremap Y y$

" YankRing stuff
let g:yankring_history_dir = '$HOME/.config/nvim/.tmp'

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Quick alignment of text
" nnoremap <leader>al :left<CR>
" nnoremap <leader>ar :right<CR>
" nnoremap <leader>ac :center<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Ctrl+W to redraw the buffer's contents
"
" For some reason unclear to me, new files opened via the quickfix window
" (for example Flow errors triggered in unopened files) don't get
" their file types detected automatically.  For these new buffers, the
" filetype= (empty).
"
" This can be fixed by running
"
"     :filetype detect
"
" In those buffers, but this is super laborious.  This just plugs that
" under my existing "refresh the screen" shortcut <c-w>.
nnoremap <C-w> :filetype detect<cr>:redraw!<cr>

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Use The Silver Searcher over grep, iff possible
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
endif

" grep/Ack/Ag for the word under cursor
" vnoremap <leader>a y:grep! "\b<c-r>"\b"<cr>:cw<cr>
" nnoremap <leader>a :grep! "\b<c-r><c-w>\b"
vnoremap <leader>a y:Ag <c-r><cr>:cw<cr>
nnoremap <leader>a :Ag <c-r><c-w>
" nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" Allow quick additions to the spelling dict
nnoremap <leader>g :spellgood <c-r><c-w>

" Define "Ag" command
command -nargs=+ -complete=file -bar Ag silent! grep! <args> | cwindow | redraw!

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" Creating folds for tags in HTML
"nnoremap <leader>ft Vatzf

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]
" }}}

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.config/nvim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

" }}}

" vim-flake8 default configuration
let g:flake8_show_in_gutter=0

" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
" }}}

" Filetype specific handling {{{
" only do this part when compiled with support for autocommands
if has("autocmd")
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        autocmd filetype vim setlocal list
        autocmd filetype python,rst setlocal list
        autocmd filetype ruby setlocal list
        autocmd filetype javascript,css setlocal list
    augroup end "}}}

    augroup vim_files "{{{
        au!

        " Bind <F1> to show the keyword under cursor
        " general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    augroup end "}}}

    augroup html_files "{{{
        au!

        " This function detects, based on HTML content, whether this is a
        " Django template, or a plain HTML file, and sets filetype accordingly
        fun! s:DetectHTMLVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
                    set ft=htmldjango.html
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=html
        endfun

        " Auto-tidy selection
        vnoremap <leader>x :!tidy -q -i --show-errors 0 --show-body-only 1 --wrap 0<cr><cr>

        autocmd BufNewFile,BufRead *.html,*.htm,*.j2 call s:DetectHTMLVariant()
    augroup end " }}}

    augroup python_files "{{{
        au!

        " This function detects, based on Python content, whether this is a
        " Django file, which may enabling snippet completion for it
        fun! s:DetectPythonVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                    set ft=python.django
                    "set syntax=python
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=python
        endfun
        autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

        " Folding for Python (uses syntax/python.vim for fold definitions)
        "autocmd filetype python,rst setlocal nofoldenable
        "autocmd filetype python setlocal foldmethod=expr

        " Python runners
        autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Automatic insertion of breakpoints
        autocmd filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>

        " Run a quick static syntax check every time we save a Python file
        " autocmd BufWritePost *.py call Flake8()

        " Defer to isort for sorting Python imports (instead of using Unix sort)
        autocmd filetype python nnoremap <leader>s mX:%!isort -<cr>`X:redraw!<cr>
    augroup end " }}}

    augroup js_files "{{{
        au!
        autocmd filetype javascript setlocal foldmethod=syntax
    augroup end " }}}

    augroup ts_files "{{{
        au!
        autocmd filetype typescript setlocal foldmethod=syntax
    augroup end " }}}

    augroup clojure_files "{{{
        au!

        " Set up <leader>r to run the entire file with vim-fireplace
        autocmd filetype clojure nnoremap <leader>r :%Eval<cr>
        autocmd filetype clojure RainbowParenthesesActivate
        autocmd filetype clojure RainbowParenthesesLoadRound
        autocmd filetype clojure RainbowParenthesesLoadSquare
        autocmd filetype clojure RainbowParenthesesLoadBraces
    augroup end " }}}

    augroup supervisord_files "{{{
        au!

        autocmd BufNewFile,BufRead supervisord.conf set ft=dosini
    augroup end " }}}

    augroup markdown_files "{{{
        au!

        autocmd filetype markdown noremap <buffer> <leader>p :w<CR>:!open -a 'Marked 2' %<CR><CR>
    augroup end " }}}

    augroup ruby_files "{{{
        au!

    augroup end " }}}

    augroup rst_files "{{{
        au!

        " Auto-wrap text around 74 chars
        autocmd filetype rst setlocal textwidth=74
        autocmd filetype rst setlocal formatoptions+=nqt
        autocmd filetype rst match ErrorMsg '\%>74v.\+'
    augroup end " }}}

    augroup css_files "{{{
        au!

        autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
    augroup end "}}}

    augroup javascript_files "{{{
        au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal listchars=trail:·,extends:#,nbsp:·
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}

        " Enable insertion of "debugger" statement in JS files
        autocmd filetype javascript nnoremap <leader>b Odebugger; // eslint-disable-line<esc>

    augroup end "}}}

    augroup textile_files "{{{
        au!

        autocmd filetype textile set tw=78 wrap

        " Render YAML front matter inside Textile documents as comments
        autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
        autocmd filetype textile highlight link frontmatter Comment
    augroup end "}}}

    augroup git_files "{{{
        au!

        " Don't remember the last cursor position when editing commit
        " messages, always start on line 1
        autocmd filetype gitcommit call setpos('.', [0, 1, 1, 0])
    augroup end "}}}
endif
" }}}

" Restore cursor position upon reopening files {{{
autocmd BufReadPost *
    \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" }}}

" Common abbreviations / misspellings {{{
source ~/.config/nvim/autocorrect.vim
" }}}

" Extra vi-compatibility {{{
" set extra vi-compatible options
set cpoptions+=$     " when changing a line, don't redisplay, but put a '$' at
                     " the end during the change
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
au filetype vim set formatoptions-=o
                     " somehow, during vim filetype detection, this gets set
                     " for vim files, so explicitly unset it again
au filetype crontab setlocal backupcopy=yes
                     " editing crontab files needs to happen in-place
" }}}

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yyPVr*jyypVr*
nnoremap <leader>3 yypVr=
nnoremap <leader>4 yypVr-
nnoremap <leader>5 yypVr^
nnoremap <leader>6 yypVr"

iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor

" Smart-quote a paragraph
vnoremap ' :s/'/’/<cr>

"set guifont=Anonymous\ for\ Powerline:h12 linespace=2
"set guifont=Droid\ Sans\ Mono:h14 linespace=0
"set guifont=Mensch\ for\ Powerline:h14 linespace=0
"set guifont=saxMono:h14 linespace=3
"set guifont=Ubuntu\ Mono:h18 linespace=3
set guifont=Source\ Code\ Pro\ Light:h10 linespace=0

if has("gui_running")
    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=Source\ Code\ Pro\ Light:h13 linespace=0
endif


" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 10m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 10m

    execute 'hi ' . old_hi
    setlocal nocursorline
endfunction

" }}}

" Powerline configuration ------------------------------------------------- {{{

let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'fancy'

" }}}

" JavaScript configuration ------------------------------------------------ {{{

let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_flow = 1

" See https://github.com/elzr/vim-json#specific-customizations
let g:vim_json_syntax_conceal = 0

" }}}

" fzf config -------------------------------------------------------------- {{{

" Invoke fzf, but CommandT style
nnoremap <leader>t :Files<cr>
nnoremap <leader>. :Tags<cr>
nnoremap <leader>b :Buffers<cr>

" ------------------------------------------------------------------------- }}}

" Learn Vim Script the Hard Way Exercises
"noremap - ddp
"noremap _ ddkP

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Define operator-pending mappings to quickly apply commands to function names
" and/or parameter lists in the current line
onoremap inf :<c-u>normal! 0f(hviw<cr>
onoremap anf :<c-u>normal! 0f(hvaw<cr>
onoremap in( :<c-u>normal! 0f(vi(<cr>
onoremap an( :<c-u>normal! 0f(va(<cr>

" "Next" tag
onoremap int :<c-u>normal! 0f<vit<cr>
onoremap ant :<c-u>normal! 0f<vat<cr>

" Function argument selection (change "around argument", change "inside argument")
onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
vnoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>

" Split previously opened file ('#') in a split window
nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
nnoremap <leader>sl :execute "rightbelow vsplit" bufname('#')<cr>

" Grep searches
"nnoremap <leader>g :silent execute "grep! -R " . shellescape('<cword>') . " ."<cr>:copen 12<cr>
"nnoremap <leader>G :silent execute "grep! -R " . shellescape('<cWORD>') . " ."<cr>:copen 12<cr>

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Configure vim-expand-region, for easy selection precision {{{

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:expand_region_text_objects = {
   \ 'iw'  : 0,
   \ 'i"'  : 1,
   \ 'i''' : 1,
   \ 'a"'  : 0,
   \ 'a''' : 0,
   \ 'i)'  : 1,
   \ 'i}'  : 1,
   \ 'i]'  : 1,
   \ 'a)'  : 1,
   \ 'a}'  : 1,
   \ 'a]'  : 1,
   \ }

" }}}

" For nvim-compe {{{
" See https://github.com/hrsh7th/nvim-compe#usage

set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
" }}}

" For compe <> LSP integration {{{
" See https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion

lua << EOF
  -- Compe setup
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      nvim_lsp = true;
    };
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return true
      else
          return false
      end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    else
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" }}}

" For nvim-lspconfig {{{
" See https://github.com/neovim/nvim-lspconfig#keybindings-and-completion

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "flow", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" }}}

" Configure ArgWrap
let g:argwrap_tail_comma = 1
nnoremap <leader>w :ArgWrap<cr>

" Neoformat {{{

let g:neoformat_run_all_formatters = 1
let g:neoformat_try_formatprg = 1

" Trigger a buffer format on `,f`
nnoremap <leader>f :Neoformat<CR>

" let g:neoformat_verbose = 1
let g:neoformat_only_msg_on_error = 1

let g:neoformat_graphql_prettier         = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_javascript_prettier      = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_javascriptreact_prettier = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_json_prettier            = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_markdown_prettier        = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_pegjs_prettier           = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_typescript_prettier      = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }
let g:neoformat_typescriptreact_prettier = { 'exe': 'prettier', 'args': ['--write', '--config', '.prettierrc'], 'replace': 1 }

let g:neoformat_enabled_graphql         = ['prettier']
let g:neoformat_enabled_javascript      = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_json            = ['prettier']
let g:neoformat_enabled_markdown        = ['prettier']
let g:neoformat_enabled_pegjs           = ['prettier']
let g:neoformat_enabled_typescript      = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']

" Enable format-on-save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" }}}

" Neomake {{{

let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

" let g:neomake_javascriptreact_eslint_d_maker = {
"       \ 'args': ['--format=compact'],
"       \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"       \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
"       \ 'cwd': '%:p:h',
"       \ 'output_stream': 'stdout',
"       \ }

" let g:neomake_javascriptreact_flow_maker = {
"       \ 'args': ['--from=vim', '--show-all-errors'],
"       \ 'errorformat':
"       \   '%-GNo errors!,'
"       \   .'%EFile "%f"\, line %l\, characters %c-%m,'
"       \   .'%trror: File "%f"\, line %l\, characters %c-%m,'
"       \   .'%C%m,%Z',
"       \ 'postprocess': function('neomake#makers#ft#javascript#FlowProcess')
"       \ }

let g:neomake_javascriptreact_enabled_makers = ['eslint']

" When writing a buffer (no delay), and on normal mode changes (after 100ms).
call neomake#configure#automake('nw', 500)

" }}}

" Elm!
let g:elm_format_autosave = 1

" Switch.vim! {{{

let g:switch_mapping = "!"
let g:switch_custom_definitions =
  \ [
  \   {
  \     'x\(\d\*\)\?': 'y\1',
  \     'y\(\d\*\)\?': 'x\1',
  \   },
  \   ['width', 'height'],
  \ ]

autocmd FileType gitrebase let b:switch_custom_definitions =
   \ [
   \   ['pick', 'fixup', 'squash', 'reword', 'edit', 'exec']
   \ ]

" }}}


" Helper to display the current syntax highlighting group under cursor {{{

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

" }}}

" Convert current filename to the clipboard
" ,cs = copy short name (relative path)
" ,cl = copy long name  (fully expanded absolute path)
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>









"vgod
filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

if has("gui_running")	" GUI color and font settings
  set guifont=Osaka-Mono:h20
  set background=dark
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors moria
  highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none
else
" terminal color settings
  colors vgod
endif

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=3
   set shiftwidth=3

   au FileType Makefile set noexpandtab
"}

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
   " Ctrl-u 1:    underline Parts w/ #'s
   noremap  <C-u>1 yyPVr#yyjp
   inoremap <C-u>1 <esc>yyPVr#yyjpA
   " Ctrl-u 2:    underline Chapters w/ *'s
   noremap  <C-u>2 yyPVr*yyjp
   inoremap <C-u>2 <esc>yyPVr*yyjpA
   " Ctrl-u 3:    underline Section Level 1 w/ ='s
   noremap  <C-u>3 yypVr=
   inoremap <C-u>3 <esc>yypVr=A
   " Ctrl-u 4:    underline Section Level 2 w/ -'s
   noremap  <C-u>4 yypVr-
   inoremap <C-u>4 <esc>yypVr-A
   " Ctrl-u 5:    underline Section Level 3 w/ ^'s
   noremap  <C-u>5 yypVr^
   inoremap <C-u>5 <esc>yypVr^A
"}

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun



" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------


" ------- vim-latex - many latex shortcuts and snippets {

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"}


" --- AutoClose - Inserts matching bracket, paren, brace or quote
" fixed the arrow key problems caused by AutoClose
if !has("gui_running")
   set term=linux
   imap OA <ESC>ki
   imap OB <ESC>ji
   imap OC <ESC>li
   imap OD <ESC>hi

   nmap OA k
   nmap OB j
   nmap OC l
   nmap OD h
endif



" --- Command-T
let g:CommandTMaxHeight = 15

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]


" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

" --- PowerLine
" let g:Powerline_symbols = 'fancy' " require fontpatcher
"

" --- SnipMate
let g:snipMateAllowMatchingDot = 0

" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write

" --- vim-gitgutter
let g:gitgutter_enabled = 1

" set ejs filetype to html
au BufNewFile,BufRead *.ejs set filetype=html










"gerardbm
"----------------------------------------------------------------
" 3. Plugins settings
"----------------------------------------------------------------
" --- Statusbar ---
" Airline settings
let g:airline_theme                       = 'atomic'
let g:airline_powerline_fonts             = 1
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z                   = airline#section#create([
			\ '%1p%% ',
			\ 'Ξ%l%',
			\ '\⍿%c'])
call airline#parts#define_accent('mode', 'black')

" --- Git tools ---
" Gitgutter settings
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'

nmap <Leader>j <Plug>(GitGutterNextHunk)zz
nmap <Leader>k <Plug>(GitGutterPrevHunk)zz
nnoremap <silent> <C-g> :call <SID>ToggleGGPrev()<CR>zz
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" Fugitive settings
nnoremap <C-s> :call <SID>ToggleGstatus()<CR>
nnoremap <Leader>gv :Gvdiffsplit<CR>:windo set wrap<CR>
nnoremap <Leader>gh :Gvdiffsplit HEAD<CR>:windo set wrap<CR>
nnoremap <Leader>gb :Gblame<CR>

" Searching for text added or removed by a commit
nnoremap <Leader>gg :call <SID>GrepWrapper('Gclog', '-i -G', '--')<CR>

" GV settings
nnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>
vnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>

" --- Sessions ---
" Vim-session settings
let g:session_autosave  = 'no'
let g:session_autoload  = 'no'
let g:session_directory = '~/.vim/sessions/'

nnoremap <C-b> :OpenSession<CR>

" --- Tools ---
" NERDCommenter settings
let g:NERDDefaultAlign          = 'left'
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDCommentEmptyLines     = 0
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters      = {
	\ 'python': {'left': '#'},
	\ }

nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>

" NERDTree settings
nnoremap <silent> <C-n> :call <SID>ToggleNERDTree()<CR>

" ALE settings
let g:ale_linters = {
	\ 'c'          : ['clang'],
	\ 'vim'        : ['vint'],
	\ 'python'     : ['pylint'],
	\ 'javascript' : ['jshint'],
	\ 'css'        : ['csslint'],
	\ 'tex'        : ['chktex'],
	\ }

" FZF settings
let $FZF_PREVIEW_COMMAND = 'cat {}'
nnoremap <C-f><C-f> :Files<CR>
nnoremap <C-f><C-g> :Commits<CR>
nnoremap <C-f><Space> :BLines<CR>

" Navigate between errors
nnoremap <Leader>h :lprevious<CR>zz
nnoremap <Leader>l :lnext<CR>zz

" Listtoggle settings
let g:lt_location_list_toggle_map = '<leader>e'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Tagbar toggle (custom function)
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0

" CtrlP settings
let g:ctrlp_map                 = '<C-p>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_working_path_mode   = 'rc'
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10,results:85'
let g:ctrlp_show_hidden         = 1
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_open_multiple_files = '0i'
let g:ctrlp_prompt_mappings     = {
	\ 'PrtHistory(1)'        : [''],
	\ 'PrtHistory(-1)'       : [''],
	\ 'ToggleType(1)'        : ['<C-l>', '<C-up>'],
	\ 'ToggleType(-1)'       : ['<C-h>', '<C-down>'],
	\ 'PrtCurLeft()'         : ['<C-b>', '<Left>'],
	\ 'PrtCurRight()'        : ['<C-f>', '<Right>'],
	\ 'PrtBS()'              : ['<C-s>', '<BS>'],
	\ 'PrtDelete()'          : ['<C-d>', '<DEL>'],
	\ 'PrtDeleteWord()'      : ['<C-w>'],
	\ 'PrtClear()'           : ['<C-u>'],
	\ 'ToggleByFname()'      : ['<C-g>'],
	\ 'AcceptSelection("e")' : ['<C-m>', '<CR>'],
	\ 'AcceptSelection("h")' : ['<C-x>'],
	\ 'AcceptSelection("t")' : ['<C-t>'],
	\ 'AcceptSelection("v")' : ['<C-v>'],
	\ 'OpenMulti()'          : ['<C-o>'],
	\ 'MarkToOpen()'         : ['<c-z>'],
	\ 'PrtExit()'            : ['<esc>', '<c-c>', '<c-p>'],
	\ }

" Undotree toggle
nnoremap <Leader>u :UndotreeToggle<CR>

" --- Languages ---
" Go settings
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path                    = expand('~/.gotools')
let g:go_list_type                   = 'quickfix'
let g:go_version_warning             = 0 " Keep until vim v8.0.1453, nvim v3.2

" CSS3 settings
augroup VimCSS3Syntax
	autocmd!
	autocmd FileType css setlocal iskeyword+=-
augroup END

" Javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

" Tern_for_vim settings
let g:tern#command   = ['tern']
let g:tern#arguments = ['--persistent']

" JS-Beautify
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_style = 'tab'
let g:config_Beautifier['jsx'] = {}
let g:config_Beautifier['jsx'].indent_style = 'tab'
let g:config_Beautifier['json'] = {}
let g:config_Beautifier['json'].indent_style = 'tab'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].indent_style = 'tab'
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_style = 'tab'

augroup beautify
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <Leader>bf :call JsBeautify()<cr>
	autocmd FileType javascript vnoremap <buffer> <Leader>bf :call RangeJsBeautify()<cr>
	autocmd FileType json nnoremap <buffer> <Leader>bf :call JsonBeautify()<cr>
	autocmd FileType json vnoremap <buffer> <Leader>bf :call RangeJsonBeautify()<cr>
	autocmd FileType jsx nnoremap <buffer> <Leader>bf :call JsxBeautify()<cr>
	autocmd FileType jsx vnoremap <buffer> <Leader>bf :call RangeJsxBeautify()<cr>
	autocmd FileType html nnoremap <buffer> <Leader>bf :call HtmlBeautify()<cr>
	autocmd FileType html vnoremap <buffer> <Leader>bf :call RangeHtmlBeautify()<cr>
	autocmd FileType css nnoremap <buffer> <Leader>bf :call CSSBeautify()<cr>
	autocmd FileType css vnoremap <buffer> <Leader>bf :call RangeCSSBeautify()<cr>
augroup end

" --- Autocomplete ---
" SuperTab settings
let g:SuperTabDefaultCompletionType = '<TAB>'

" Deoplete settings
" - «Deoplete requires Neovim with Python3 enabled»
let g:python3_host_prog       = '/usr/bin/python3'
let g:python3_host_skip_check = 1

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#functions    = {}
call deoplete#custom#option('auto_complete_delay', 250)

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Python autocompletion
let g:deoplete#sources#jedi#show_docstring = 1

" Go autocompletion
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache     = 1

" Javascript autocompletion
let g:deoplete#omni#functions.javascript = [
	\ 'tern#Complete',
	\ 'jspc#omni',
	\ ]

" Clang autocompletion
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" --- Snippets ---
" Neosnippet settings
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

" Behaviour like SuperTab
smap <expr><TAB>
	\ neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers
if has('conceal')
	set conceallevel=0 concealcursor=niv
	nnoremap <silent> coi :set conceallevel=0<CR>:set concealcursor=niv<CR>
	nnoremap <silent> coo :set conceallevel=2<CR>:set concealcursor=vc<CR>
	nnoremap <silent> cop :set conceallevel=2<CR>:set concealcursor=niv<CR>
	nnoremap <silent> com :set conceallevel=3<CR>:set concealcursor=niv<CR>
endif

augroup all
	autocmd InsertLeave * NeoSnippetClearMarkers
augroup end

" --- Edition ---
" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /

" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>

" Auto-pairs settings
" Maps for normal and insert modes
let g:AutoPairsFlyMode        = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump   = '<C-z>'
let g:AutoPairsShortcutToggle = '<C-q>'

" Workaround to fix an Auto-pairs bug until it gets fixed
if has("nvim")
	autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
endif

" Closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.html.erb,*.md'

" Surround settings
" Use 'yss?', 'yss%' or 'yss=' to surround a line
autocmd FileType php let b:surround_{char2nr('p')} = "<?php \r ?>"
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('=')} = "{% \r %}"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('-')} = "{%- \r -%}"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('u')} = "<u>\r</u>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('d')} = "<del>\r</del>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('k')} = "<kbd>\r</kbd>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('n')} = "<sub>\r</sub>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('p')} = "<sup>\r</sup>"
autocmd FileType markdown,liquid let b:surround_{char2nr('i')} = "_\r_"
autocmd FileType markdown,liquid let b:surround_{char2nr('o')} = "**\r**"
autocmd FileType markdown,liquid let b:surround_{char2nr('h')} = "\[\r\]\(//\)"
autocmd FileType markdown,liquid let b:surround_{char2nr('c')} = "“\r”"
autocmd FileType markdown,liquid let b:surround_{char2nr('v')} = "‘\r’"
autocmd FileType markdown,liquid let b:surround_{char2nr('x')} = "«\r»"
autocmd FileType markdown,liquid let b:surround_{char2nr('e')} = "\[\r\]
			\\(\){:rel=\"nofollow noopener noreferrer\" target=\"_blank\"}"
autocmd FileType markdown,liquid let b:surround_{char2nr('j')} = "!\[\r\]
			\\(/images/\){: .align-}"

" Caps Lock settings
imap <expr><C-l> deoplete#smart_close_popup()."\<Plug>CapsLockToggle"
cmap <silent> <C-l> <Plug>CapsLockToggle

" Expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" MatchTagAlways settings
let g:mta_filetypes = {
	\ 'html'  : 1,
	\ 'xhtml' : 1,
	\ 'xml'   : 1,
	\ 'jinja' : 1,
	\ 'php'   : 1,
	\ }

" ArgWrap settings
let g:argwrap_tail_comma    = 1
let g:argwrap_padded_braces = '[{'

nnoremap <Leader>W :ArgWrap<CR>

" Vim-move settings. Use Shift
let g:move_key_modifier = 'S'

" --- Misc ---
" Vim-tmux navigator settings
let g:tmux_navigator_no_mappings = 1

" Open-browser settings
let g:openbrowser_browser_commands = [{
	\ 'name': 'w3m',
	\ 'args': 'tmux new-window w3m {uri}',
	\ }]

nmap <Leader>gl <Plug>(openbrowser-open)

" Goyo settings
let g:goyo_width  = "80"
let g:goyo_height = "100%"
let g:goyo_linenr = 0

nnoremap <F11> :Goyo<CR>

" Vimwiki settings
let g:vimwiki_url_maxsave   = 0
let g:vimwiki_global_ext    = 0
let g:vimwiki_syntax        = 'markdown'
let g:vimwiki_list          = [
	\ {'path': '~/Workspace/vimwiki'},
	\ {'path': '~/Workspace/vimwiki/Articles'},
	\ {'path': '~/Workspace/vimwiki/Codes'},
	\ {'path': '~/Workspace/vimwiki/Notes'},
	\ {'path': '~/Workspace/vimwiki/Projects'},
	\ {'path': '~/Workspace/vimwiki/Studies'},
	\ {'path': '~/Workspace/vimwiki/ToDos'},
	\ {'path': '~/Workspace/vimwiki/Unix'}
	\ ]

nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>

"----------------------------------------------------------------
" 4. User interface
"----------------------------------------------------------------
" Set X lines to the cursor when moving vertically
set scrolloff=0

" Always show mode
set showmode

" Show command keys pressed
set showcmd

" Enable the WiLd menu
set wildmenu

" Show the current position
set ruler

" Command bar height
set cmdheight=2

" Backspace works on Insert mode
set backspace=eol,start,indent

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell

if !has("nvim")
	set t_vb=

	" Terminal keycodes
	if &term =~ 'screen'
		set <F1>=[11~
		set <F2>=[12~
		set <F3>=[13~
		set <F4>=[14~
		set <F5>=[15~
		set <F6>=[17~
		set <F7>=[18~
		set <F8>=[19~
		set <F9>=[20~
		set <F10>=[21~
		set <F11>=[23~
		set <F12>=[24~
		set <S-F1>=[11;2~
		set <S-F2>=[12;2~
		set <S-F3>=[13;2~
		set <S-F4>=[14;2~
		set <S-F5>=[15;2~
		set <S-F6>=[17;2~
		set <S-F7>=[18;2~
		set <S-F8>=[19;2~
		set <S-F9>=[20;2~
		set <S-F10>=[21;2~
		set <S-F11>=[23;2~
		set <S-F12>=[24;2~
	endif
endif

" Mouse
set mouse=a

" Highlight cursor line and cursor column
set cursorline
set nocursorcolumn

" Always show the status line
set laststatus=2

" Change the cursor shape
if !has("nvim")
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
else
	set guicursor=n-v:block-Cursor/lCursor-blinkon0
	set guicursor+=i-ci-c:ver100-Cursor/lCursor-blinkon0
	set guicursor+=r-cr:hor100-Cursor/lCursor-blinkon0
endif

" Omni completion
if has('autocmd') && exists('+omnifunc')
autocmd Filetype *
	\ if &omnifunc == "" |
	\     setlocal omnifunc=syntaxcomplete#Complete |
	\ endif
endif

" Fix italics issue
if !has("nvim")
	let &t_ZH="\e[3m"
	let &t_ZR="\e[23m"
endif

"----------------------------------------------------------------
" 5. Scheme and colors
"----------------------------------------------------------------
" True color
" if !has("nvim")
"   if has("termguicolors")
"       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"       set termguicolors
"   endif
" else
"   set termguicolors
" endif

" Syntax highlighting
syntax enable

" Color scheme

" Show syntax highlighting groups
nnoremap <Leader>B :call <SID>SynStack()<CR>

"----------------------------------------------------------------
" 6. Files and backup
"----------------------------------------------------------------
" Disable swap files
set noswapfile

" No backup (use Git instead)
set nobackup

" Prevents automatic write backup
set nowritebackup

" Use UTF-8 as default encoding
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Autoread a file when it is changed from the outside
set autoread

" Reload a file when it is changed from the outside
let g:f5msg = 'Buffer reloaded.'
nnoremap <F5> :e<CR>:echo g:f5msg<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
" Restore default behaviour when leaving Vim.
if !has("nvim")
	silent !stty -ixon
	autocmd VimLeave * silent !stty ixon
endif

" Save the current buffer
nnoremap <Leader>s :update<CR>

" Save all buffers
nnoremap <Leader>S :bufdo update<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
cnoremap WW w !sudo tee > /dev/null %

" Rename file
nnoremap <F2> :call <SID>RenameFile()<CR>

" Work on buffer
nnoremap yab :%y<CR>
nnoremap Yab :%y +<CR>
nnoremap dab :%d<CR>
nnoremap vab ggVG

"----------------------------------------------------------------
" 7. Buffers management
"----------------------------------------------------------------
" Buffer hidden when it is abandoned
set hidden

" Close the current buffer
nnoremap <Leader>bd :call <SID>CustomCloseBuffer()<CR>

" Move between buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

" Edit and explore buffers
nnoremap <Leader>bb :edit <C-R>=expand("%:p:h")<CR>/
nnoremap <Leader>bg :buffers<CR>:buffer<Space>

" Switch CWD to the directory of the current buffer
nnoremap <Leader>bw :lcd %:p:h<CR>:pwd<CR>

" Copy the filepath to clipboard
nnoremap <Leader>by :let @+=expand("%:p")<CR>

" Ignore case when autocompletes when browsing files
set fileignorecase

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set showtabline=2
catch
endtry

" Remember info about open buffers on close
" set viminfo^=%

"----------------------------------------------------------------
" 8. Tabs management
"----------------------------------------------------------------
" Create and close tabs
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>

" Open a new tab with the current buffer's path
" Useful when editing files in the same directory
nnoremap <Leader>tt :tabedit <C-R>=expand("%:p:h")<CR>/

" Move tabs position
nnoremap <Leader>tr :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Leader>ty :execute 'silent! tabmove ' . tabpagenr()<CR>

"----------------------------------------------------------------
" 9. Multiple windows
"----------------------------------------------------------------
" Remap wincmd
map <Leader>, <C-w>

set winminheight=0
set winminwidth=0
set splitbelow
set splitright
set fillchars+=stlnc:\/,vert:│,fold:―,diff:―

" Split windows
map <C-w>- :split<CR>
map <C-w>. :vsplit<CR>
map <C-w>j :close<CR>
map <C-w>x :q!<CR>
map <C-w>, <C-w>=

" Resize windows
if bufwinnr(1)
	map + :resize +1<CR>
	map - :resize -1<CR>
	map < :vertical resize +1<CR>
	map > :vertical resize -1<CR>
endif

" Toggle resize window
nnoremap <silent> <C-w>f :call <SID>ToggleResize()<CR>

" Last, previous and next window; and only one window
nnoremap <silent> <C-w>l :wincmd p<CR>:echo "Last window."<CR>
nnoremap <silent> <C-w>p :wincmd w<CR>:echo "Previous window."<CR>
nnoremap <silent> <C-w>n :wincmd W<CR>:echo "Next window."<CR>
nnoremap <silent> <C-w>o :wincmd o<CR>:echo "Only one window."<CR>

" Move between Vim windows and Tmux panes
" - It requires the corresponding configuration into Tmux.
" - Check it at my .tmux.conf from my dotfiles repository.
" - URL: https://github.com/gerardbm/dotfiles/blob/master/tmux/.tmux.conf
" - Plugin required: https://github.com/christoomey/vim-tmux-navigator
if !has("nvim")
	set <M-h>=h
	set <M-j>=j
	set <M-k>=k
	set <M-l>=l
endif

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader><BS> mmHmt:%s/<C-v><CR>//ge<CR>'tzt`m

" Close the preview window
nnoremap <silent> <Leader>. :pclose<CR>

" Scroll the preview window
if !has("nvim")
	set <M-d>=d
	set <M-u>=u
endif

nnoremap <silent> <M-d> :wincmd P<CR>5<C-e>:wincmd p<CR>
nnoremap <silent> <M-u> :wincmd P<CR>5<C-y>:wincmd p<CR>

"----------------------------------------------------------------
" 10. Indentation tabs
"----------------------------------------------------------------
" Enable autoindent & smartindent
set autoindent
set smartindent

" Use tabs, no spaces
set noexpandtab

" Be smart when using tabs
set smarttab

" Tab size (in spaces)
set shiftwidth=2
set tabstop=2

" Remap indentation
nnoremap <TAB> >>
nnoremap <S-TAB> <<

vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

inoremap <TAB> <C-i>
inoremap <S-TAB> <C-d>

" Don't show tabs
set list

let g:f6msg = 'Toggle list.'
nnoremap <F6> :set list!<CR>:echo g:f6msg<CR>

" Show tabs and end-of-lines
set listchars=tab:│\ ,trail:¬

"----------------------------------------------------------------
" 11. Moving around lines
"----------------------------------------------------------------
" Specify which commands wrap to another line
set whichwrap+=<,>,h,l

" Many jump commands move the cursor to the start of line
set nostartofline

" Wrap lines into the window
set wrap

" Don't break the words
" Only works if I set nolist (F6)
set linebreak
set showbreak=├——»

" Stop automatic wrapping
set textwidth=0

" Column at 80 width
set colorcolumn=80

" Listings don't pause
set nomore

" Color column
let g:f10msg = 'Toggle colorcolumn.'
nnoremap <silent> <F10> :call <SID>ToggleColorColumn()<CR>:echo g:f10msg<CR>

" Show line numbers
set number
set numberwidth=2

let g:f3msg = 'Toggle line numbers.'
nnoremap <silent> <F3> :set number!<CR>:echo g:f3msg<CR>

" Set relative line numbers
set relativenumber

let g:f4msg = 'Toggle relative line numbers.'
nnoremap <silent> <F4> :set norelativenumber!<CR>:echo g:f4msg<CR>

" Treat long lines as break lines (useful when moving around in them)
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

nnoremap <Home> g^
nnoremap <End> g$

vnoremap <Home> g^
vnoremap <End> g$

" Toggle the cursor position start/end of the line
nnoremap <silent> ñ :call <SID>ToggleCPosition('')<CR>
vnoremap <silent> ñ <Esc>:call <SID>ToggleCPosition('normal! gv')<CR>

" Join / split lines
nnoremap <C-j> J
nnoremap <C-k> i<CR><Esc>

" Duplicate a line
nnoremap cx yyP
nnoremap cv yyp

" Folding
set foldmethod=marker

" Return to last edit position when opening files
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" --- Readline commands ---
"----------------------------------------------------------------
" Move the cursor to the line start
inoremap <C-a> <C-O>0

" Move the cursor to the line end
inoremap <C-e> <C-O>$

" Moves the cursor back one character
inoremap <expr><C-b> deoplete#smart_close_popup()."\<Left>"

" Moves the cursor forward one character
inoremap <expr><C-f> deoplete#smart_close_popup()."\<Right>"

" Remove one character
inoremap <C-d> <DEL>

" Command Mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <DEL>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-v> <C-r>"
cnoremap <C-q> <S-Right><C-w>

"----------------------------------------------------------------
" 12. Paste mode
"----------------------------------------------------------------
" Bracketed paste mode
" - Source: https://ttssh2.osdn.jp/manual/en/usage/tips/vim.html
if !has("nvim")
	if has("patch-8.0.0238")
		if &term =~ "screen"
			let &t_BE = "\e[?2004h"
			let &t_BD = "\e[?2004l"
			exec "set t_PS=\e[200~"
			exec "set t_PE=\e[201~"
		endif
	endif
endif

"----------------------------------------------------------------
" 13. Search, vimgrep and grep
"----------------------------------------------------------------
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Search, wrap around the end of the buffer
set wrapscan

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" Maximum amount of memory in Kbyte used for pattern matching
set maxmempattern=1000

" --- Highlight ---
"----------------------------------------------------------------
" Map <Space> to / (search)
nnoremap <Space> /
nnoremap <Leader><Space> ?

" Highlight the word under the cursor and don't jump to next
nnoremap <silent> <Leader><CR> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hlsearch<CR>

" Highlight the selected text and don't jump to next
vnoremap <silent> <Leader><CR> :<C-U>call <SID>VSetSearch()<CR>:set hlsearch<CR>

" Disable highlight
nnoremap <Leader>m :noh<CR>

" Search into a Visual selection
vnoremap <silent> <Space> :<C-U>call <SID>RangeSearch('/')<CR>
	\ :if strlen(g:srchstr) > 0
	\ \|exec '/'.g:srchstr\|endif<CR>n
vnoremap <silent> ? :<C-U>call <SID>RangeSearch('?')<CR>
	\ :if strlen(g:srchstr) > 0
	\ \|exec '?'.g:srchstr\|endif<CR>N

" --- Vimgrep and grep ---
"----------------------------------------------------------------
" Vimgrep the highlight in the current file
nnoremap <Leader>vg :vimgrep /<C-R>//j %<CR>

" Vimgrep the highlight in the current directory and subdirectories
nnoremap <Leader>vf :vimgrep /<C-R>//j **/*.

autocmd QuickfixCmdPre grep,grepadd,vimgrep,vimgrepadd,helpgrep copen

" Grep settings
set grepprg=grep\ -nHi

" Current buffer
nnoremap <Leader>vv :call <SID>GrepWrapper('grep!', '', '%')<CR>

" Current working directory
nnoremap <Leader>vn :call <SID>GrepWrapper('grep!', '-R
			\ --exclude-dir={.git,.svn,.jekyll-cache,_site}
			\ --exclude=LICENSE', '')<CR>

" Current buffer (grepadd)
nnoremap <Leader>vm :call <SID>GrepWrapper('grepadd!', '', '%')<CR>

" Current arglist
nnoremap <Leader>va :call <SID>GrepWrapper('grep!', '', '##')<CR>

" Navigate between grep and vimgrep results
nnoremap <Leader>n :cnext<CR>zz
nnoremap <Leader>N :cprev<CR>zz

" Jump to the results in buffers (first open window), not tabs
set switchbuf=useopen

" --- Replace ---
"----------------------------------------------------------------
" Replace the highlight in the current file
nnoremap <Leader>r :%s/<C-R>///g<Left><Left>

" Replace the highlight in the visual selection
" Flag \%V --> Match only inside the visual selection
vnoremap <Leader>r :s/\%V<C-R>/\%V//g<Left><Left>

" Replace the highlight to all loaded buffers and arglist
nnoremap <Leader>R :bufdo %s/<C-R>///ge<Left><Left><Left>

" Replace the highlight to each valid entry in the quickfix
nnoremap <Leader>Q :cdo %s/<C-R>///ge<Left><Left><Left>

" Populate the arglist
nnoremap <Leader>aa :argadd<space>
nnoremap <Leader>ad :argdelete<space>
nnoremap <Leader>an :args **/*.
nnoremap <Leader>al :call <SID>DisplayArglist()<CR>:argument<space>

"----------------------------------------------------------------
" 14. Text edition
"----------------------------------------------------------------
" Toggle case
nnoremap <Leader>z ~
vnoremap <Leader>z y:call setreg('', ToggleCase(@"), getregtype(''))<CR>gv""Pgv
vnoremap ~ y:call setreg('', ToggleCase(@"), getregtype(''))<CR>gv""Pgv

" Toggle and untoggle spell checking
let g:f8msg = 'Toggle spell checking.'
nnoremap <silent> <F8> :setlocal spell!<CR>:echo g:f8msg<CR>

" Toggle spell dictionary
nnoremap <silent> <F9> :call <SID>ToggleSpelllang()<CR>

" Move to next misspelled word
nnoremap zl ]s

" Find the misspelled word before the cursor
nnoremap zh [s

" Suggest correctly spelled words
nnoremap zp z=

" Copy text into the clipboard
vnoremap <Leader>y "+y<Esc>

" Paste text from the clipboard
nnoremap <Leader>p "+p

" Quickly select the text pasted from the clipboard
nnoremap gV `[v`]

" Yank everything from the cursor to the EOL
nnoremap Y y$

" Yank the last pasted text automatically
vnoremap p pgvy

" Retab the selected text
nnoremap <Leader>tf :retab!<CR>
vnoremap <Leader>tf :retab!<CR>

" Isolate the current line
nnoremap <Leader>o m`o<Esc>kO<Esc>``

" Enter a new line Down from 'Normal Mode'
nnoremap <Leader>f mao<Esc>`a

" Enter a new line Up from 'Normal Mode'
nnoremap <Leader>F maO<Esc>`a

" Insert brackets faster (not English keyboard layout)
inoremap ñr []<left>
inoremap ñb ()<left>
inoremap ñB {}<left>
autocmd FileType html,markdown,liquid inoremap ñp {%  %}<left><left><left>
autocmd FileType html,markdown,liquid inoremap ñ- {%-  -%}<left><left><left><left>

"----------------------------------------------------------------
" 15. Make settings
"----------------------------------------------------------------
" Set makeprg
if !filereadable(expand('%:p:h').'/Makefile')
	autocmd FileType c setlocal makeprg=gcc\ %\ &&\ ./a.out
endif

" Go to the error line
set errorformat=%m\ in\ %f\ on\ line\ %l

" Run code in a tmux window
augroup tmuxy
autocmd FileType javascript,lua,perl,php,python,ruby,sh
			\ nnoremap <silent> <buffer> <Leader>ij
			\ :call <SID>Tmuxy()<CR>
augroup end

" Run code in the preview window
augroup scripty
autocmd FileType javascript,lua,perl,php,python,ruby,sh
			\ nnoremap <silent> <buffer> <Leader>ii
			\ :call <SID>Scripty()<CR>
augroup end

" Work with sqlite databases
augroup sqlite
	autocmd FileType sql nnoremap <silent> <Leader>ia
				\ :call <SID>SqliteDatabase()<CR>
	autocmd FileType sql nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>SQLExec('n')<CR>
	autocmd FileType sql vnoremap <silent> <buffer> <Leader>ii
				\ :<C-U>call <SID>SQLExec('v')<CR>
augroup end

" Work with maxima (symbolic mathematics)
augroup maxima
	autocmd!
	autocmd BufRead,BufNewFile *.max set filetype=maxima
	autocmd FileType maxima nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>MaximaExec('n')<CR>
	autocmd FileType maxima vnoremap <silent> <buffer> <Leader>ii
				\ :<C-U>call <SID>MaximaExec('v')<CR>
augroup end

" Convert LaTeX to PDF
augroup latex
	autocmd!
	autocmd FileType tex nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.pdf', &ft)<CR>
augroup end

" Convert markdown to PDF, HTML and EPUB
augroup markdown
	autocmd!
	autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.pdf', &ft)<CR>
	autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ih
				\ :call <SID>Generator('.html', &ft)<CR>
	autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ij
				\ :call <SID>Generator('.epub', &ft)<CR>
augroup end

" Draw with PlantUML
augroup uml
	autocmd!
	autocmd FileType plantuml nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with Graphviz
augroup dot
	autocmd!
	autocmd FileType dot nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with Eukleides
augroup eukleides
	autocmd!
	autocmd BufRead,BufNewFile *.euk set filetype=eukleides
	autocmd FileType eukleides nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with Asymptote
augroup asymptote
	autocmd!
	autocmd BufRead,BufNewFile *.asy set filetype=asy
	autocmd FileType asy nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with pp3
augroup pp3
	autocmd!
	autocmd BufRead,BufNewFile *.pp3 set filetype=pp3
	autocmd FileType pp3 nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with Gnuplot
augroup gnuplot
	autocmd!
	autocmd BufRead,BufNewFile *.plt set filetype=gnuplot
	autocmd FileType gnuplot nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Draw with POV-Ray
augroup povray
	autocmd!
	autocmd FileType pov nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>Generator('.png', &ft)<CR>
augroup end

" Run Jekyll (liquid)
augroup liquid
	autocmd!
	autocmd FileType liquid,html,yaml set wildignore+=*/.jekyll-cache/*,
				\*/_site/*,*/images/*,*/timg/*,*/icons/*,*/logo/*,*/where/*
	autocmd FileType liquid setlocal spell spelllang=es colorcolumn=0
	autocmd FileType liquid,yaml nnoremap <silent> <buffer> <Leader>ii
				\ :call <SID>ToggleJekyll()<CR>
augroup end

"----------------------------------------------------------------
" 16. Filetype settings
"----------------------------------------------------------------
" Delete trailing white spaces
func! s:DeleteTrailing()
	exe 'normal mz'
	%s/\s\+$//ge
	exe 'normal `z'
	echo 'Trailing white spaces have been removed.'
	noh
endfunc

nnoremap <silent> <Leader>dt :call <SID>DeleteTrailing()<CR>

" Binary
augroup binary
	autocmd!
	autocmd BufReadPre  *.bin let &bin=1
	autocmd BufReadPost *.bin if &bin | %!xxd
	autocmd BufReadPost *.bin set ft=xxd | endif
	autocmd BufWritePre *.bin if &bin | %!xxd -r
	autocmd BufWritePre *.bin endif
	autocmd BufWritePost *.bin if &bin | %!xxd
	autocmd BufWritePost *.bin set nomod | endif
augroup end

" Markdown
let g:markdown_fenced_languages = [
	\ 'python',
	\ 'sh',
	\ ]

" Mail
augroup mail
	autocmd!
	autocmd FileType mail setl spell
	autocmd FileType mail setl spelllang=ca
augroup end

" SQL (it requires sqlparse)
augroup sql
	let g:omni_sql_no_default_maps = 1
	autocmd FileType sql nnoremap <Leader>bf
				\ :%!sqlformat --reindent --keywords upper --identifiers upper -<CR>
	autocmd FileType sql vnoremap <Leader>bf
				\ :%!sqlformat --reindent --keywords upper --identifiers upper -<CR>
augroup end

" XML (it requires tidy)
augroup xml
	autocmd FileType xml nnoremap <Leader>bf
				\ :%!tidy -q -i -xml --show-errors 0 -wrap 0 --indent-spaces 4<CR>
augroup end

" MD
augroup md
	autocmd FileType markdown,liquid,text,yaml set expandtab
	autocmd FileType markdown,liquid,text
				\ nnoremap <silent> <Leader>cc :call <SID>KeywordDensity()<CR>
	autocmd FileType markdown,liquid,text nnoremap <silent> <Leader>dd g<C-g>
	autocmd FileType markdown,liquid,text vnoremap <silent> <Leader>dd g<C-g>
	autocmd FileType markdown,liquid,text
				\ nnoremap <silent> gl :call search('\v\[[^]]*]\([^)]*\)', 'W')<CR>
	autocmd FileType markdown,liquid,text
				\ nnoremap <silent> gh :call search('\v\[[^]]*]\([^)]*\)', 'bW')<CR>
	autocmd FileType markdown,liquid,text
				\ nnoremap <silent> gd :call <sid>RemoveMdLink()<CR>
	autocmd FileType markdown,liquid,text
				\ :command! -range Enes <line1>,<line2>!trans en:es -brief
	autocmd FileType markdown,liquid,text
				\ :command! -range Esen <line1>,<line2>!trans es:en -brief
augroup end

" New file headers
augroup headers
	autocmd!
	autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl>\#
				\ -*- coding: utf-8 -*-\<nl>\"|$
	autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl>\"|$
	autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl>\"|$
	autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
	autocmd BufNewFile *.js 0put =\"#!/usr/bin/env node\<nl>\"|$
augroup end

"----------------------------------------------------------------
" 17. Helper functions
"----------------------------------------------------------------
" Toggle Terminal
function! s:ToggleTerminal()
	if bufexists('terminal')
		call win_gotoid(s:winZsh)
		norm! i
	else
		execute ':below 10sp term://$SHELL'
		keepalt file terminal
		let s:winZsh = win_getid()
		norm! i
	endif
endfunction

" Show syntax highlighting groups
function! s:SynStack()
	if !exists('*synstack')
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Rename file
function! s:RenameFile()
	let l:old_name = expand('%')
	let l:new_name = input('New file name: ', expand('%'), 'file')
	if l:new_name !=# '' && l:new_name !=# l:old_name
		exec ':saveas ' . l:new_name
		exec ':silent !rm ' . l:old_name
		redraw!
	endif
endfunction

" Don't close window when deleting a buffer
function! s:CustomCloseBuffer()
	let l:currentBufNum = bufnr('%')
	let l:alternateBufNum = bufnr('#')

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr('%') == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		exec ':bdelete! ' . l:currentBufNum
	endif
endfunction

" Close the last buffer if it's the last window
" - For 'quickfix' and 'nofile'
autocmd BufEnter * call <SID>CloseLastBuffer()
function! s:CloseLastBuffer()
	if &buftype ==# 'quickfix' || &buftype ==# 'nofile'
		if winnr('$') < 2
			quit!
		endif
	endif
endfunction

" Display the arglist vertically
function! s:DisplayArglist() abort
	let l:argnum = 0
	let l:lenargc = len(argc())
	for l:arg in argv()
		let l:argnum += 1
		let l:filename = fnamemodify(l:arg, ':t')
		let l:changed =
					\ getbufinfo(bufname('^' . l:arg . '$'))[0].changed == 1
					\ ? '+'
					\ : ' '
		let l:current = expand('%') ==# l:arg ? '%' : ' '
		echo printf( '%-*d %s%s %s',
					\ l:lenargc, l:argnum, l:current, l:changed, l:filename)
	endfor
endfunction

" Toggle maximize window and resize windows
function! s:ToggleResize() abort
	if winnr('$') > 1
		if exists('t:zoomed') && t:zoomed
			execute t:zoom_winrestcmd
			let t:zoomed = 0
			echo 'Windows resized.'
		else
			let t:zoom_winrestcmd = winrestcmd()
			resize
			vertical resize
			let t:zoomed = 1
			echo 'Window maximized.'
		endif
	endif
endfunction
autocmd VimEnter * autocmd WinEnter * let t:zoomed = 0

" Search into a Visual selection
function! s:RangeSearch(direction)
	call inputsave()
	let g:srchstr = input(a:direction)
	call inputrestore()
	if strlen(g:srchstr) > 0
		let g:srchstr = g:srchstr.
			\ '\%>'.(line("'<")-1).'l'.
			\ '\%<'.(line("'>")+1).'l'
	else
		let g:srchstr = ''
	endif
endfunction

" Highlight the selected text (visual mode)
" Source: https://github.com/nelstrom/vim-visual-star-search
" (You can install it as a plugin)
function! s:VSetSearch()
	let l:temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = l:temp
endfunction

" Count grep matches
function! QFCounter() abort
	let l:results = len(getqflist())
	if l:results > 0
		copen
	else
		cclose
	endif
	echo 'Found ' . l:results . ' matches.'
endfunction

" Grep wrapper
function! s:GrepWrapper(cmd, dir, scope) abort
	cclose
	let l:pattern = substitute(@/, '\\V', '', '')
	let l:pattern = substitute(pattern, '\\<', '', '')
	let l:pattern = substitute(pattern, '\\>', '', '')
	let l:pattern = escape(pattern, '"')
	let l:pattern = escape(pattern, '%')
	let l:pattern = escape(pattern, '#')
	silent execute a:cmd . ' ' . a:dir . ' "' . l:pattern . '" ' . a:scope
	redraw!
	set hlsearch
	call QFCounter()
endfunction

" Toggle case
function! ToggleCase(str)
	if a:str ==# toupper(a:str)
		let l:result = tolower(a:str)
	elseif a:str ==# tolower(a:str)
		let l:result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
	else
		let l:result = toupper(a:str)
	endif
	return l:result
endfunction

" Toggle spell dictionary
function! <SID>ToggleSpelllang()
	if (&spelllang =~# '^en')
		set spelllang=ca
		echo 'Català'
	elseif (&spelllang =~# '^ca')
		set spelllang=es
		echo 'Castellano'
	elseif (&spelllang =~# '^es')
		set spelllang=en_us,en_gb
		echo 'English'
	endif
	set spelllang?
endfunction

" New :windo command to return to the last current window
" - Default :windo cycles through all the open windows
" - Use 'Windo' instead of 'windo' to avoid it
command! -nargs=+ -complete=command Windo
	\ let s:currentWindow = winnr() |
	\ execute 'windo <args>' |
	\ exe s:currentWindow . 'wincmd w'

" Toggle colorcolumn
function! s:ToggleColorColumn()
	if !exists('s:color_column_old') || s:color_column_old == 0
		let s:color_column_old = &colorcolumn
		Windo let &colorcolumn = 0
	else
		Windo let &colorcolumn = s:color_column_old
		let s:color_column_old = 0
	endif
endfunction

" Toggle the cursor position start/end
function! s:ToggleCPosition(mode)
	execute a:mode
	if !exists('s:togglecp')
		let s:togglecp = 0
	endif
	if col('.') >= col('$') - 1
		let s:togglecp = 1
		norm! ^
	else
		let s:togglecp = 0
		norm! $
	endif
endfunction

" Toggle GitGutterPreviewHunk
function! s:ToggleGGPrev()
	if getwinvar(winnr('#'), '&pvw') == 1
				\ && exists('s:curr') && line(".") == s:curr
				\ || gitgutter#hunk#in_hunk(line(".")) == 0
		pclose
	else
		GitGutterPreviewHunk
		let s:curr = line(".")
	endif
endfunction

" Execute GV only once
function! s:PreventGV() abort
	if &buftype !=# 'nofile'
		execute ':GV'
	endif
endfunction

" Toggle Gstatus window
function! s:ToggleGstatus() abort
	for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
		else
			Git
		endif
	endfor
endfunction

" Better toggle for NERDTree
function! s:ToggleNERDTree() abort
	if bufname('%') != ""
		if exists("g:NERDTree") && g:NERDTree.IsOpen()
			if &filetype ==# 'nerdtree'
				execute ':NERDTreeClose'
			else
				execute ':NERDTreeFocus'
			endif
		else
			execute ':NERDTreeFind'
		endif
	else
			execute ':NERDTreeToggleVCS'
	endif
endfunction

" Get Tagbar buffer name
function! s:TagbarBufName() abort
	if !exists('t:tagbar_buf_name')
		let s:buffer_seqno += 1
		let t:tagbar_buf_name = '__Tagbar__.' . s:buffer_seqno
	endif
	return t:tagbar_buf_name
endfunction

" Better toggle for Tagbar
function! s:ToggleTagbar() abort
	let tagbarwinnr = bufwinnr(s:TagbarBufName())
	if tagbarwinnr != -1
		if &modifiable
			execute tagbarwinnr 'wincmd w'
		else
			execute ':TagbarClose'
		endif
	else
		execute ':TagbarOpen'
	endif
endfunction

" Keyword density checker
function! s:KeywordDensity() abort
	silent update

	" Words count
	" > Strip the front matter, comments, HTML tags and count the words
	let s:sf = " | sed '1 { /^---/ { :a N; /\\n---/! ba; d }  }'"
	let s:sc = " | sed 's/{% comment.*endcomment %}//g'"
	let s:sh = " | sed 's/<[^>]*.//g'"
	let s:wc = " | wc -w"
	let s:get_words = system("cat " . expand('%') . s:sf. s:sc . s:sh . s:wc)
	let s:int_words = str2nr(s:get_words)
	let s:str_words = string(s:int_words)

	" Highlight count
	let s:match_count = ""
	redir => s:match_count
	silent exec '%s/' . @/ . '//gne'
	redir END

	if ! empty(s:match_count)
		let s:str_keys = split(s:match_count)[0]
		let s:flt_keys = str2float(s:str_keys)

		" Density
		let s:flt_dens = (s:flt_keys/s:int_words)*100
		let s:str_dens = string(s:flt_dens)

		echo '> ' . s:str_keys . ' of ' . s:str_words . ' (' . s:str_dens . '%)'
	else
		echo '> 0 of ' . s:str_words . ' (0%, pattern not found)'
	endif
endfunction

" Remove markdown link
function! s:RemoveMdLink() abort
	let [l, c] = searchpos('\v\[[^]]*]\([^)]*\)', 'ncW')
	if l > 0 && c > 0
		if getline(".")[col(".")-1] ==# "["
			norm! xf]vf)d
		else
			call cursor(l, c)
		endif
	endif
endfunction

"----------------------------------------------------------------
" 18. External tools integration
"----------------------------------------------------------------
" Run code into a tmux window
function! s:Tmuxy() abort
	if exists('$TMUX')
		update
		let s:runner = <SID>Runners()
		let s:cmdk = 'tmux kill-window -t run'
		let s:cmdn = 'tmux new-window -n run'
		let s:cmds = " '" . s:runner . " " . expand("%:p") . " ; read'"
		call system(s:cmdk)
		call system(s:cmdn . s:cmds)
	else
		echo 'Tmux is not running.'
	endif
endfunction

" Run code in the preview window
function! s:Scripty() abort
	update
	let s:runner = <SID>Runners()
	let s:cmd = s:runner . " " . expand("%:p")
	call <SID>Commander(s:cmd)
endfunction

" Define the runners
function! s:Runners() abort
	if &filetype =~# 'javascript'
		let s:run = 'node'
	elseif &filetype =~# 'lua'
		let s:run = 'lua'
	elseif &filetype =~# 'perl'
		let s:run = 'perl'
	elseif &filetype =~# 'php'
		let s:run = 'php'
	elseif &filetype =~# 'python'
		let s:run = <SID>PyShebang()
	elseif &filetype =~# 'ruby'
		let s:run = 'ruby'
	elseif &filetype =~# 'sh'
		let s:run = 'bash'
	else
		let s:run = 'empty'
	endif
	return s:run
endfunction

" Check the python version used in the shebang
function! s:PyShebang() abort
	if getline(1) =~# '^#!.*/bin/env\s\+python3\>'
		return "python3"
	else
		return "python"
	endif
endfunction

" Generator function
function! s:Generator(ext, ft) abort
	update
	let l:inp = expand('%')
	let l:out = expand('%:r') . a:ext
	if a:ft ==# 'tex'
		let l:cmd = system('pdflatex ' . l:inp)
	elseif a:ft ==# 'markdown'
		if a:ext ==# '.html'
			let l:opt = '--mathjax '
		elseif a:ext ==# '.epub'
			let l:opt = '-t epub2 --webtex '
		elseif a:ext ==# '.pdf'
			let l:opt = '-V fontsize=12pt
						\ -V papersize=a4
						\ -V geometry:margin=2.5cm '
		endif
		let l:cmd = system('pandoc -s ' . l:opt . l:inp . ' -o ' . l:out)
	elseif a:ft ==# 'plantuml'
		let l:cmd = system('plantuml ' . l:inp . ' ' . l:out)
	elseif a:ft ==# 'dot'
		let l:cmd = system('dot -Tpng ' . l:inp . ' -o ' . l:out)
	elseif a:ft ==# 'eukleides'
		let l:eps = expand('%:r') . '.eps'
		let l:cmd = system('eukleides ' . l:inp)
	elseif a:ft ==# 'asy'
		let l:eps = expand('%:r') . '.eps'
		let l:cmd = system('asy ' . l:inp)
	elseif a:ft ==# 'pp3'
		let l:eps = expand('%:r') . '.eps'
		let l:cmd = system('pp3 ' . l:inp)
	elseif a:ft ==# 'gnuplot'
		let l:opt = ' -e "set terminal png; set output ''' . l:out . '''" '
		let l:cmd = system('gnuplot' . l:opt . l:inp)
	elseif a:ft ==# 'pov'
		let l:cmd = system('povray -D ' . l:inp)
	endif
	if v:shell_error ==# 0
		pclose
		if a:ft =~# '\(eukleides\|asy\|pp3\)'
			call <SID>EPS2PNG(l:eps, l:out)
		endif
		call <SID>Previewer(l:out)
	else
		call <SID>WinPreview()
		exec '0put =l:cmd'
		call <SID>ResizeWinPreview()
	endif
endfunction

" Convert from EPS to PNG
function! s:EPS2PNG(eps, out) abort
		let l:opt_bef = ' -density 150 '
		let l:opt_aft = ' -flatten -alpha off -colorspace hsl '
		call system('convert' . l:opt_bef . a:eps . l:opt_aft . a:out)
endfunction

" Preview outputs (EPUB, PDF, HTML, PNG) with mupdf
function! s:Previewer(out) abort
	let l:dev = ' 2>/dev/null'
	let l:checkps = system('ps -ef
				\ | grep -v grep
				\ | grep mupdf
				\ | grep -o ' . a:out . l:dev)
	if l:checkps ==# ''
		call system('mupdf ' . a:out . ' &')
	else
		call system('pkill -HUP mupdf')
	endif
endfunction

" Configure a sqlite database
function! s:SqliteDatabase() abort
	let t:path = input('Database: ')
endfunction

" Execute SQL queries
function! s:SQLExec(opt) abort
	if a:opt ==# 'n'
		silent norm! yy
	elseif a:opt ==# 'v'
		silent norm! gvy
	endif
	if !exists('t:path')
		call <SID>SqliteDatabase()
	endif
	if filereadable(t:path)
		let t:sql = @
		let t:sql = substitute(t:sql, '\n', ' ', 'g')
		let t:format = " | column -t -s '|'"
		if t:sql =~? '^select'
			let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"' . t:format
		else
			let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"'
		endif
		let s:cmd = "sqlite3 -list -batch " . t:cmd
		call <SID>Commander(s:cmd)
	else
		echo "\nThis database does not exist!"
	endif
endfunction

" Execute Maxima instructions
function! s:MaximaExec(opt) abort
	if a:opt ==# 'n'
		silent norm! yy
	elseif a:opt ==# 'v'
		silent norm! gvy
	endif
	let b:equ = @
	let b:equ = substitute(b:equ, '\n', ' ', 'g')
	let b:equ = substitute(b:equ, '\s$', '', 'g')
	let b:equ = substitute(b:equ, '%', '\\%', 'g')
	if b:equ !~# ';$'
		let b:equ = substitute(b:equ, '$', ';', 'g')
	endif
	let s:cmd = 'maxima --very-quiet --batch-string "' . b:equ . '"'
	call <SID>Commander(s:cmd)
endfunction

" Window previewer
function! s:WinPreview() abort
	silent! wincmd P
	if !&previewwindow
		exec 'new'
		setlocal previewwindow
		setlocal buftype=nowrite bufhidden=wipe
		setlocal nobuflisted noswapfile nowrap
		nnoremap <silent> <buffer> q :pclose<CR>
	endif
	exec '%delete'
endfunction

" Commander
function! s:Commander(cmd) abort
	call <SID>WinPreview()
	exec '0read !' . a:cmd
	call <SID>ResizeWinPreview()
endfunction

" Resize the preview window
function! s:ResizeWinPreview() abort
	exec '$d'
	let s:size = line('$')
	if s:size < 11
		exec 'resize ' . line('$')
	else
		exec 'resize 10'
	endif
	norm! gg
	wincmd p
endfunction

command! -nargs=1 Commander call <SID>Commander(<f-args>)

" Toggle jekyll server in the background
function! s:ToggleJekyll() abort
	call system('lsof -i :4000 | grep -i listen')
	if v:shell_error
		silent exec "!(bundle exec jekyll serve &) > /dev/null"
		call system("touch /tmp/jekyll.ps")
		call system("notify-send -t 2 'Executing Jekyll server...'")
	else
		silent exec "!(pkill -f jekyll &) > /dev/null"
		call system("rm -f /tmp/jekyll.ps")
		call system("notify-send -t 2 'Jekyll server was stoped!'")
	endif
	redraw!
endfunction









"furion
""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set relativenumber
set ls=2
set cursorline
set nowrap
set backspace=indent,eol,start
set shell=/bin/bash
set completeopt -=preview
set textwidth=100
set wildmenu
set noshowmode
set cmdheight=1
set nofoldenable
" set autoread

" backup/persistance settings
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" set <leader>
let mapleader=","

" enable mouse
set mouse=a

" show trailing whitespaces
set list
set listchars=tab:·\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" togglables without FN keys
nnoremap <leader>1 :FloatermNew<CR>
set pastetoggle=<leader>2
nnoremap <leader>3 :TlistToggle<CR>
nnoremap <leader>4 :TagbarToggle<CR>
nnoremap <leader>5 :NERDTreeToggle<CR>
nnoremap <leader>6 <cmd>Telescope live_grep<cr>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==
" nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

let s:ctrlp_fallback = 'ag %s
  \ --nocolor --nogroup --depth 5
  \ --hidden --follow --smart-case
  \ --ignore .git
  \ --ignore .cargo
  \ --ignore .ropeproject
  \ --ignore .ccache
  \ --ignore .DS_Store
  \ --ignore .opt1
  \ --ignore .pylint.d
  \ --ignore .shell
  \ --ignore "build/*"
  \ --ignore "dist/*"
  \ --ignore "target/*"
  \ --ignore "**/*.pyc"
  \ --ignore "**/*.class"
  \ --ignore "**/*.o"
  \ -g ""'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard', s:ctrlp_fallback]


" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :tabnew  ~/.config/nvim/init.vim<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" syntastic
let g:syntastic_python_checkers = []

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" reload ctags
nnoremap <leader>C :!ctags -R --fields=+l --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>g :Git
nnoremap <leader>a :Ag!

""""""""""""""""""""""""""""""""
"
" PROGRAMMING LANGUAGES
"
""""""""""""""""""""""""""""""""
" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-go bindings
augroup FileType go
  au!
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <Leader>i <Plug>(go-info)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
augroup END

" Python Settings
let g:pymode_rope = 1
let ropevim_enable_shortcuts = 1
let g:pymode_rope_lookup_project = 0 "dont scan parent dir for .ropeproject
let g:pymode_rope_goto_def_newwin = "e"
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0


" Pymode Options
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 100
let g:pymode_options_colorcolumn = 0
let g:pymode_folding = 0        " Turn off code folding
let g:pymode_virtualenv = 1     " Auto fix vim python paths if virtualenv enabled
let g:pymode_motion = 1         " Enable python objects and motion
let g:pymode_trim_whitespaces = 1 "Trim unused white spaces on save
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 5

" debugging
let g:pymode_breakpoint = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_indent = 1

" linting
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8'] " 'mccabe']
let g:pymode_lint_signs = 1

"let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_sort = ['E','C']

" configure nvim -> ipython integration
let g:slime_target = "tmux"
" assume vim is on left and ipython on right
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

" fix paste issues in ipython
"let g:slime_python_ipython = 1

" Use '##' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'
" Rstudio/ipython habit
autocmd FileType python nnoremap <buffer> <CR> :SlimeSendCurrentLine<CR>gj
autocmd FileType python nnoremap <buffer> <leader>r :SlimeSendCurrentLine<CR>
autocmd FileType python xnoremap <buffer> <leader>r :SlimeSend<CR>
autocmd FileType python nnoremap <buffer> <leader>w :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <buffer> <leader>c :IPythonCellExecuteCellJump<CR>
" autocmd FileType python nnoremap <buffer> <C-j> :IPythonCellNextCell<CR>
" autocmd FileType python nnoremap <buffer> <C-k> :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap <buffer> <leader>d :SlimeSend1 plt.show()<CR>
autocmd FileType python nnoremap <buffer> <leader>x :IPythonCellRestart<CR>

" R indentation
augroup r_indent
  autocmd!
  autocmd FileType r set autoindent
  autocmd FileType r set textwidth=80 shiftwidth=2
  autocmd FileType r set softtabstop=2 tabstop=2
augroup END

" Nvim-R config
let R_assign = 0
let R_args = ['--no-save', '--no-restore', '--quiet']
" https://www.visidata.org/
" let R_csv_app = 'terminal:vd'
let R_csv_app = 'tmux new-window vd'
" let R_after_start = ['options(help_type = "html")']
" autocmd FileType r nmap <silent> <LocalLeader>rt :call RAction('glimpse')<CR>
autocmd FileType r nnoremap <buffer> <CR> <Plug>(RDSendLine)


" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>R :!python3 %<cr>
  elseif(&ft=="r")
    nnoremap <leader>R :!R --no-save --no-restore < %<cr>
  elseif(&ft=="haskell")
    nnoremap <leader>R :!ghci %<cr>
  elseif(&ft=="hy")
    nnoremap <leader>R :!hy %<cr>
  elseif(&ft=="clojure")
    nnoremap <leader>R :!lein run<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>R :!node %<cr>
  elseif(&ft=="c")
    nnoremap <leader>R :!make run<cr>
  endif
endfunction

au BufEnter * call LangRunner()

" " json syntax handling in conjunction with vim-json plugin
" augroup json_autocmd
"   autocmd!
"   autocmd FileType json set autoindent
"   autocmd FileType json set formatoptions=tcq2l
"   autocmd FileType json set textwidth=78 shiftwidth=2
"   autocmd FileType json set softtabstop=2 tabstop=8
"   autocmd FileType json set expandtab
"   autocmd FileType json set foldmethod=syntax
" augroup END

""""""""""""""""""""""""""""""""
"
" COOL HACKS
"
""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>h[1-4]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

""""""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
""""""""""""""""""""""""""""""""
" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" make C-a, C-x work properly
set nrformats=

" make C-j work consistent in C programms
let g:C_Ctrl_j='off'

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" alternative approach for lines that are too long
set colorcolumn=
" highlight OverLength ctermbg=gray ctermfg=white guibg=#999999
" match OverLength /\%81v.\+/

let g:syntastic_rust_checkers = ['dont-block-vim-in-substrate']



