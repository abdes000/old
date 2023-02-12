

"primeagen
"Adding local modules
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
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
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
nnoremap <leader>x :!chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

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
" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
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

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
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
nnoremap  :lua require('telescope.builtin').git_files()<CR>
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
:nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}



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
inoremap <expr> <Up> pumvisible() ? "" : "<Up>"

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
nnoremap <silent>  :FZF -m<CR>

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
inoremap <expr><S-TAB> pumvisible() ? "\" : "\<C-h>"

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
autocmd CursorHold * silent call CocActionAsync('highlight')

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
tmap  <C-w>:tabm +1<CR>
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
nnoremap  :Files<cr>

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

" colorscheme jellybeans

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





"shawn
syntax on

set backspace=2
set laststatus=2
set clipboard=unnamed
set nu

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
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on
" colorscheme candyman

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
inoremap <C-k>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" ctrlP config
let g:ctrlp_map = ""
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
highlight OverLength ctermbg=gray ctermfg=white guibg=#999999
" match OverLength /\%81v.\+/

let g:syntastic_rust_checkers = ['dont-block-vim-in-substrate']





"neuralnine
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

" :colorscheme jellybeans

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

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && %:r.exe <CR>






"devaslife
" Description: Keymaps

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


" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

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

set exrc



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

if !exists('g:loaded_completion') | finish | endif

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"

let g:completion_confirm_key = ""
let g:completion_chain_complete_list = {
        \ 'default' : {
        \   'default': [
        \       {'complete_items': ['lsp', 'snippet', 'path']},
        \       {'mode': ''},
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

" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

cnoreabbrev g Git
cnoreabbrev gopen GBrowse

if !exists('#LspColors') | finish | endif

lua << EOF
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
EOF
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

exists('g:loaded_nvim_treesitter')
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
