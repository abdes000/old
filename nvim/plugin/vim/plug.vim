
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')






"tools
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mengelbrecht/lightline-bufferline'

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-zoom'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'aben20807/vim-runner'
Plug 'jbgutierrez/vim-better-comments'
Plug 'lilydjwg/colorizer'
Plug 'kabbamine/vcoolor.vim'

"telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'


"colorschemes
Plug 'yggdroot/indentline'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'dunstontc/vim-vscode-theme'



"git
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'


"comletions
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-surround'


Plug 'neovim/nvim-lspconfig'

"languages
Plug 'vim-scripts/django.vim'
Plug 'tpope/vim-dotenv'
Plug 'kern/vim-es7'
Plug 'mxw/vim-jsx'
Plug 'michaelghinrichs/vim-redux-modules-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'nanotech/jellybeans.vim'


"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-solargraph'
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-yaml'
Plug 'neoclide/coc-java'
Plug 'neoclide/coc-highlight'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-rls'
Plug 'neoclide/coc-lists'
Plug 'ekalinin/dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'severij/vadelma'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'


" erlang
Plug 'jimenezrick/vimerl'


" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}


" haskell
"" Haskell Bundle
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
Plug 'pbrisbin/vim-syntax-shakespeare'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" lisp
"" Lisp Bundle
Plug 'vim-scripts/slimv.vim'


" lua
"" Lua Bundle
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'


" perl
"" Perl Bundle
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'


" php
"" PHP Bundle
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'stephpy/vim-php-cs-fixer'


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring', {'tag': 'main'}


" rust
" Vim racer
Plug 'racer-rust/vim-racer'

" Rust.vim
Plug 'rust-lang/rust.vim'

" Async.vim
Plug 'prabirshrestha/async.vim'

" Vim lsp
Plug 'prabirshrestha/vim-lsp'

" Asyncomplete.vim
Plug 'prabirshrestha/asyncomplete.vim'

" Asyncomplete lsp.vim
Plug 'prabirshrestha/asyncomplete-lsp.vim'


" scala
if has('python')
    " sbt-vim
    Plug 'ktvoelker/sbt-vim'
endif
" vim-scala
Plug 'derekwyatt/vim-scala'


" svelte
Plug 'leafOfTree/vim-svelte-plugin'


" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'


" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'



"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.rc.local.bundles"))
  source ~/.rc.local.bundles
endif



Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'rust-lang/rust.vim'
Plug 'klen/python-mode'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-scripts/indentpython.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'moll/vim-node'
Plug 'wavded/vim-stylus'
Plug 'valloric/youcompleteme'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-endwise'
Plug 'raimondi/delimitmate'
Plug 'davidhalter/jedi-vim'
Plug 'shougo/deoplete.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-scripts/taglist.vim'
Plug 'rstacruz/sparkup'
Plug 'townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/AutoComplPop'
Plug 'jceb/vim-orgmode'
Plug 'zxqfl/tabnine-vim'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'shougo/neco-vim'
Plug 'shougo/neoinclude.vim'
Plug 'shougo/neco-syntax'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go'
Plug 'fishbullet/deoplete-ruby'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-zsh'
Plug 'shougo/deoplete-clangx'
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'glepnir/lspsaga.nvim'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-smart-history.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'konfekt/fastfold'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'puremourning/vimspector'
Plug 'tomasiser/vim-code-dark'
Plug 'maksimr/vim-jsbeautify'
Plug 'mbbill/undotree'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'rrethy/vim-hexokinase'
Plug 'vhdirk/vim-cmake'
Plug 'jalcine/cmake.vim'
Plug 'dpelle/vim-languagetool'
Plug 'shinglyu/vim-codespell'
Plug 'tpope/vim-dotenv'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'oinksoft/npm.vim'
Plug 'danro/rename.vim'
Plug 'elzr/vim-json'
Plug 'yggdroot/leaderf'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'liangfeng/vimprj'
Plug 'ntbbloodbath/rest.nvim'
Plug 'sharat87/roast.vim'
Plug 'vim-scripts/svg.vim'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'vim-scripts/SQLUtilities'
Plug 'rhysd/open-pdf.vim'
Plug 'ashisha/image.vim'
Plug 'junegunn/gv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/ZoomWin'
Plug 'ryanss/vim-hackernews'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-obsession'
Plug 'enricobacis/vim-airline-clock'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'flazz/vim-colorschemes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'shougo/vimproc.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-scripts/matchit.zip'
Plug 'ap/vim-css-color'
Plug 'nanotech/jellybeans.vim'
Plug 'autozimu/languageclient-neovim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'kaicataldo/material.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme'
Plug 'sirver/ultisnips'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'msanders/cocoa.vim'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-solargraph'
Plug 'neoclide/coc-css'
Plug 'pappasam/coc-jedi'
Plug 'neoclide/coc-yaml'
Plug 'neoclide/coc-java'
Plug 'neoclide/coc-highlight'
Plug 'neoclide/coc-prettier'
Plug 'josa42/coc-sh'
Plug 'neoclide/coc-denite'
Plug 'neoclide/coc-rls'
Plug 'neoclide/coc-lists'
Plug 'neoclide/coc-tslint'
Plug 'weirongxu/coc-explorer'


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
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SpellCheck'
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
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }


"brodie
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rust-lang/rust.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'itchyny/calendar.vim'
Plug 'mbbill/undotree'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'


"geradbm
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


"joako
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
Plug 'tpope/vim-rhubarb'
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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'vim-scripts/CSS-one-line--multi-line-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'MobiusHorizons/fugitive-stash.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
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
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
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
Plug 'cespare/vim-toml', { 'for': 'toml' }
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

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'arcticicestudio/nord-vim'
Plug 'tommcdo/vim-exchange'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'sainnhe/sonokai'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


Plug 'VundleVim/Vundle.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/IndentAnything'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/YankRing.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/bufkill.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/gundo.vim'
Plug 'sjl/clam.vim'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junkblocker/patchreview-vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-signify'
Plug 'int3/vim-extradite'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'millermedeiros/vim-statline'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'vim-scripts/summerfruit256.vim'



Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yggdroot/indentline'
Plug 'maksimr/vim-jsbeautify'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'lilydjwg/colorizer'
Plug 'rking/ag.vim'
Plug 'tpope/vim-sensible'
Plug 'lambdalisue/fern.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lyuts/vim-rtags'
Plug 'omnisharp/omnisharp-vim'
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'isruslan/vim-es6'
Plug 'isruslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'herringtondarkholme/yats.vim'
Plug 'glench/vim-jinja2-syntax'
Plug 'ekalinin/dockerfile.vim'
Plug 'sirver/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/xml.vim'
Plug 'stephpy/vim-yaml'
Plug 'kien/rainbow_parentheses.vim'
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'liuchengxu/vista.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'aben20807/vim-runner'
Plug 'neoclide/coc.nvim'
Plug 'valloric/youcompleteme'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'


" Plug 'LoricAndre/fzterm.nvim'

" Testing my own plugin
Plug 'theniceboy/vim-calc'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Pretty Dress
Plug 'theniceboy/nvim-deus'
Plug 'arzg/vim-colors-xcode'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Tex
" Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }

" Swift
Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Other filetypes
Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
Plug 'junegunn/vim-peekaboo'
Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'theniceboy/pair-maker.vim'
Plug 'theniceboy/vim-move'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Yggdroot/indentLine'

" For general writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-wordy'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Mini Vim-APP
Plug 'jceb/vim-orgmode'
Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'makerj/vim-pdf'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'



"{{ The Basics }}
    Plug 'gmarik/Vundle.vim'                           " Vundle
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
"{{ File management }}
    Plug 'vifm/vifm.vim'                               " Vifm
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
    Plug 'vimwiki/vimwiki'                             " VimWiki
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks
"{{ Syntax Highlighting and Colors }}
    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'vim-python/python-syntax'                    " Python highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!


Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'wlangstroth/vim-racket'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'universal-ctags/ctags'
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tommcdo/vim-lion'
Plug 'Shirk/vim-gas'
Plug 'ntpeters/vim-better-whitespace'



Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'



" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'




Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'TomNomNom/xoria256.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'



 Plug 'https://github.com/morhetz/gruvbox',
  Plug 'https://github.com/rmueck/molokai',
  Plug 'https://github.com/altercation/vim-colors-solarized',
  Plug 'https://github.com/NLKNguyen/papercolor-theme',
  Plug 'https://github.com/zefei/simple-dark',
  Plug 'https://github.com/jonathanfilip/vim-lucius',
  " ------------------------------------------------------------
  Plug 'https://github.com/scrooloose/nerdtree',
  Plug 'https://github.com/vim-syntastic/syntastic',
  Plug 'https://github.com/vim-airline/vim-airline',
  Plug 'https://github.com/vim-airline/vim-airline-themes',
  Plug 'https://github.com/tomtom/tcomment_vim',
  Plug 'https://github.com/tpope/vim-surround',
  Plug 'https://github.com/tpope/vim-fugitive',
  Plug 'https://github.com/airblade/vim-gitgutter',
  Plug 'https://github.com/mbbill/undotree',
  Plug 'https://github.com/rodjek/vim-puppet', { 'for': 'puppet' }
  Plug 'https://github.com/plasticboy/vim-markdown', { 'for': 'markdown' }

" plugin group for git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" super-tab
"Plugin 'ervandew/supertab'

" air-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" UML
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" color
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'morhetz/gruvbox'

" use ALE to instead of syntastic
Plug 'dense-analysis/ale'

Plug 'tmux-plugins/vim-tmux'

" gtags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" scratch
Plug 'mtth/scratch.vim'

" Latex
Plug 'lervag/vimtex'

" use fzf as file search, easy and fast than ctrlp and command-t
" LeaderF can be use as function browser
Plug 'Yggdroot/LeaderF'

" fzf will be cloned and install via git and shell, so not use plugin manager
Plug 'junegunn/fzf.vim'

" ACK
Plug 'mileszs/ack.vim'

" Easy motion
Plug 'easymotion/vim-easymotion'

" snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" General utility library that other things depend on
Plug 'vim-scripts/L9'
Plug 'tpope/vim-commentary'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'neomake/neomake'
" Be able to repeat (using .) plugin operations
Plug 'tpope/vim-repeat'
" Easily surround code with parens, HTML tags, functions, and more
Plug 'tpope/vim-surround'
" Git wrapper plugin
Plug 'tpope/vim-fugitive'
" GitLab integration for the :GBrowse command
Plug 'shumphrey/fugitive-gitlab.vim'
" GitHub integration for the :GBrowse command
Plug 'tpope/vim-rhubarb'
" Plug 'airblade/vim-gitgutter'
" extended % matching for HTML, LaTeX, and many other languages
" Plug 'tmhedberg/matchit'
" Vim's MatchParen for HTML tags
" Plug 'gregsexton/MatchTag'
" Easily re-order plugin arguments
" Plug 'machakann/vim-swap'
" display the indention levels with thin vertical lines
" Plug 'Yggdroot/indentLine'
" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
" insert or delete brackets, parens, quotes in pair
" Plug 'jiangmiao/auto-pairs'
" Plug 'vim-scripts/taglist.vim'
" Temporarily make the current window full screen
Plug 'troydm/zoomwintab.vim'
" Colorize hex codes and ansi escape sequences
" Plug 'chrisbra/Colorizer'

" Autocompletion triggering
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
endif

" Base language packages ------------------------

Plug 'vim-scripts/haproxy'
Plug 'vim-scripts/nginx.vim'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'isRuslan/vim-es6'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'
Plug 'neowit/vim-force.com'

" Language augmentation packages ---------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  clojure                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'tpope/vim-fireplace'
" Plug 'Olical/conjure', {'tag': 'v4.3.1'}
Plug 'liquidz/vim-iced', {'for': 'clojure', 'tag': '2.7.6'}
" Plug 'tpope/vim-salve'
" Plug 'venantius/vim-cljfmt'
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'snoe/clj-refactor.nvim'
" Plug '~/src/clj-refactor.nvim'
" Plug '~/src/node-client/examples'
" Plug 'guns/vim-slamhound', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
" Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   others                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nsf/gocode', { 'for': 'go', 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plug 'iamcco/markdown-preview.vim'
Plug 'mpyatishev/vim-sqlformat'

" Colorschemes (themes) -------------------------------

" Plug 'b-ryan/vim-colors-synthwave'
Plug 'luochen1990/rainbow'
Plug 'srcery-colors/srcery-vim'
Plug 'NieTiger/halcyon-neovim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'nielsmadan/harlequin'

call plug#end()
