
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
""================     Windowing     ===================""
""                                                      ""

" Expand and shrink split sizes
nnoremap <leader>< <C-W><
nnoremap <leader><< 5<C-W><
nnoremap <leader>> <C-W>>
nnoremap <leader>>> 5<C-W>>
nnoremap <leader>, <C-W>-
nnoremap <leader>,, 5<C-W>-
nnoremap <leader>. <C-W>+
nnoremap <leader>.. 5<C-W>+

nnoremap <silent> <Leader><Up>    :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Down>  :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader><Right> :exe "vertical resize +6"<CR>
nnoremap <silent> <Leader><Left>  :exe "vertical resize -6"<CR>


" Split VIEWPORT horizontally, with new split on the top
let g:buffergator_viewport_split_policy = "b"
let g:buffergator_suppress_keymaps="1"
let g:buffergator_autodismiss_on_select=0
let g:buffergator_split_size=18

" NERDtree settings
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_autoclose = 1

" Setup the buffers
" we set buffergator_autoupdate serially after toggling buffergator to avoid
" creating a buffer listing 'NERD_tree_1' due to focus issues
if has('autocmd')
  autocmd VimEnter * NERDTreeFocus
  autocmd VimEnter * exe "vertical resize 40"
  autocmd VimEnter * BuffergatorOpen
  autocmd VimEnter * exe "resize 15"
  autocmd VimEnter * let g:buffergator_autoupdate=1
  autocmd VimEnter * wincmd w
  autocmd VimEnter * nested :call tagbar#autoopen(0)
endif


"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" test per http://justmao.name/life/integrate-nerdtree-and-buffergator/
let g:l_sidebar_toggle = 0
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle" 

  if(g:l_sidebar_toggle == 0)
    "execute "call Tagbar#autoopen"
    execute "call g:ToggleRNuMode()"
    execute "set nonumber!"
    execute ( bufwinnr(b) . "wincmd w" )
    let g:l_sidebar_toggle = 1
  else
    execute ( bufwinnr(b) . "wincmd w" )
    execute "set nonumber!"
    execute "call g:ToggleRNuMode()"
    let g:l_sidebar_toggle = 0
  endif
endf
map  <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>
map! <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>


if exists('g:loaded_pluginwhitespace')
	finish
endif
let g:loaded_pluginwhitespace = 1

" Remove end of line white space
command! -range=% WhitespaceErase call <SID>WhitespaceErase(<line1>, <line2>)

" Search for trailing white space forwards
command! -range=% WhitespaceNext call <SID>WhitespaceJump(1, <line1>, <line2>)

" Search for trailing white space backwards
command! -range=% WhitespacePrev call <SID>WhitespaceJump(-1, <line1>, <line2>)

" Whitespace events
if v:version >= 702
	augroup plugin_whitespace
		autocmd!
		autocmd InsertEnter * call <SID>ToggleWhitespace('i')
		autocmd InsertLeave * call <SID>ToggleWhitespace('n')
	augroup END
endif

let s:ws_chars = get(g:, 'whitespace_characters', '\s')
let s:ws_pattern = get(g:, 'whitespace_pattern', s:ws_chars . '\+$')
let s:normal_pattern = get(g:, 'whitespace_pattern_normal',
	\ s:ws_pattern . '\| \+\ze\t')
let s:insert_pattern = get(g:, 'whitespace_pattern_insert',
	\ s:ws_chars . '\+\%#\@<!$')

let s:blacklist = get(g:, 'whitespace_filetype_blacklist', [
	\ 'diff', 'git', 'gitcommit', 'help', 'qf', 'denite', 'defx' ])

function! s:ToggleWhitespace(mode)
	if &buftype =~? 'nofile\|help' || index(s:blacklist, &filetype) > -1
		return
	elseif a:mode ==? ''
		call matchdelete(w:whitespace_match_id)
		return
	else
		let l:pattern = (a:mode ==# 'i') ? s:insert_pattern : s:normal_pattern
		if exists('w:whitespace_match_id')
			call matchdelete(w:whitespace_match_id)
			call matchadd('ExtraWhitespace', l:pattern, 10, w:whitespace_match_id)
		else
			highlight! link ExtraWhitespace SpellBad
			let w:whitespace_match_id = matchadd('ExtraWhitespace', l:pattern)
		endif
	endif
endfunction

function! s:WhitespaceErase(line1, line2)
	let l:save_cursor = getpos('.')
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/' . s:ws_pattern . '//'
	call setpos('.', l:save_cursor)
endfunction

" Search for trailing whitespace
function! s:WhitespaceJump(direction, from, to)
	let l:opts = 'wz'
	let l:until = a:to
	if a:direction < 1
		let l:opts .= 'b'
		let l:until = a:from
	endif

	" Full file, allow wrapping
	if a:from == 1 && a:to == line('$')
		let l:until = 0
	endif

	" Go to pattern
	let l:found = search(s:normal_pattern, l:opts, l:until)
endfunction

" vim: set ts=2 sw=2 tw=80 noet :

""================     Movements     ===================""
""                                                      ""

"enjoy an immediate quit without reviewing unread buffers
map :Q :qa
map :wq :xa
map j 5gj
map k 5gk

"map gt :tabnext<cr>
"map gT :tabprevious<cr>
map gb :bnext<cr>
map gB :bprevious<cr>
map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>
map <Leader>} :blast<cr>
map <Leader>{ :bfirst<cr>

map nd /[<=>]\{7\}<cr>

""" Ruby/JS Movements
" put the curson on the name of the function that you are currently in
"map gd :?\(def\|function\) <cr>:noh<cr>ee
map gdd :?def <cr>:noh<cr>ee
map gdf :?function <cr>:noh<cr>ee

map <Leader>n :NERDTreeFocus<cr>
map <Leader>nf :NERDTreeFind<cr>
map <Leader>b :BuffergatorOpen<cr>
map <Leader>v :wincmd b<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


""================     Navigations     ===================""
""                                                      ""

""  MovingThroughCamelCaseWords
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
"inoremap <silent> <C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
"inoremap <silent> <C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

""  Find and show results in a QuickfixList
nnoremap <silent> <space><Up> :cn<CR>
nnoremap <silent> <space><Down> :cp<CR>
nnoremap <silent> <space><Right> :cnf<CR>
nnoremap <silent> <space><Left> :cpf<CR>


" unite navigations
"nnoremap <space>p :<C-u>Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async<cr>
nnoremap <space>p :<C-u>Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>? :execute 'Unite grep:.::' . expand("<cword>") . ' -auto-preview'<CR>
nnoremap <space>' :execute 'Unite grep:.::' . expand("<cword>") . ' -default-action=above -auto-preview'<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>t :Unite -start-insert tag<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>u :<C-u>Unite -no-split -buffer-name=buffers  buffer<cr>
nnoremap <space>b :Unite grep:$buffers<cr>
nnoremap <space>B :execute 'Unite grep:$buffers::' . expand("<cword>") . '  -start-insert'<cr>
"nnoremap <space>o :Unite -start-insert -vertical -winwidth=50 -direction=belowright outline<cr>
map <silent> <space>o :TagbarOpen fj<cr>

let g:unite_source_file_rec_max_cache_files = 50000
"call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" Go to the beginning of the line in insert mode
inoremap <silent><C-a> <C-o>0
" Go to the ending of the line in insert mode
inoremap <silent><C-z> <C-o>$
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>y "*y
" Paste from the system clipboard(in visual mode)
vnoremap <silent><leader>y "*y
" Cut from the system clipboard(in normal mode)
nnoremap <silent><leader>x "*x
" Cut from the system clipboard(in visual mode)
vnoremap <silent><leader>x "*x
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>p "*p
" Paste from the system clipboard(in visual mode)
nnoremap <silent><leader>p "*p
" Select everything
nnoremap <silent><leader>a ggVG
" Delete a buffer
nnoremap <silent><leader>bd :bd<CR>
" Escape in terminal mode takes you to normal mode
tnoremap <silent><leader><Esc> <C-\><C-n>
" Create a new blank buffer
nnoremap <leader>gg :enew<CR>
" Toggle search highlight
nnoremap <silent> <C-C> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
" Do not make Q go to ex-mode
nnoremap Q <Nop>

" Wrap selection with '' 
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Wrap selection with ""
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Wrap selection with ()
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
" Wrap selection with []
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
" Wrap selection with {}
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" These are all terminal shorthands
" I've made them to recognize common typos
cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev wqa1 wqa!
cnoreabbrev qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer

" Change buffer sizes 
"
" Make buffer narrower
nnoremap <silent> <C-H> :vertical resize -4<CR>
" Make buffer wider
nnoremap <silent> <C-L> :vertical resize +4><CR>
" Make buffer shorter
nnoremap <silent> <C-J> :resize -4<CR>
" Make buffer longer
nnoremap <silent> <C-K> :resize +4<CR>

"Similar mappings for terminal mode{{{
tnoremap <silent> <C-H> :vertical resize -4<CR>
tnoremap <silent> <C-L> :vertical resize +4><CR>
tnoremap <silent> <C-J> :resize -4<CR>
tnoremap <silent> <C-K> :resize +4<CR>

" Create/Toggle a terminal to the bottom
nnoremap <silent><leader>` :call ChooseTerm("term-slider", 1)<CR>
tnoremap <silent><leader>` <C-\><C-n>:call ChooseTerm("term-slider", 1)<CR>
" Create/Toggle a terminal in a buffer 
nnoremap <silent><leader><CR> :call ChooseTerm("term-pane", 0)<CR>
tnoremap <silent><leader><CR> <C-\><C-n>:call ChooseTerm("term-pane", 0)<CR>

" Terminal Toggle
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "botright split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "botright split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction


" Telescope
" Fuzzy file finder
nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
" Fuzzy buffer finder
nnoremap <silent><leader>fb :Telescope buffers<CR>
" Fuzzy help-tages finder
nnoremap <silent><leader>fh :Telescope help_tags<CR>
" Search with ripgrep
nnoremap <silent><leader>fi :Telescope live_grep<CR>
" Fuzzy git status
nnoremap <silent><leader>fg :Telescope git_status<CR>
" Fuzzy old-files finder
nnoremap <silent><leader>fo :Telescope oldfiles<CR>
" Fuzzy command finder
nnoremap <silent><leader>fc :Telescope commands<CR>
" Fuzzy current file word finder
nnoremap <silent><leader>fz :Telescope current_buffer_fuzzy_find<CR>
" Fuzzy workspace symbols
nnoremap <silent><leader>fs :Telescope lsp_workspace_symbols<CR>
" Search projects (projects.nvim) 
nnoremap <silent><leader>fp :Telescope projects<CR>

" Symbols Finder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Show code actions
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" Show code actions for selection
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Show hovering documentation
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" Scroll down in lspsaga menus
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" Scroll up in lspsaga menus
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Show signature help(imo not thaat useful)
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" Rename symbols
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Show suggestions/errors/warnings for the line
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump to the next diagnostic suggestion
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Jump to the previous diagnostic suggestion
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

" Jump to definition
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>

" Toggle error menu
nnoremap <silent><leader>h :TroubleToggle<CR>

" Show symbols outline
nnoremap <silent><leader>so :Vista nvim_lsp<CR>
" Show blame for line
nnoremap <silent><leader>bb :Gitsigns toggle_current_line_blame<CR>

" Toggle comment for line
nnoremap <silent><leader>/ :Commentary<CR>
" Toggle comment for selections
vnoremap <silent><leader>/ :Commentary<CR>

function! ToggleNvimTree()
   if exists(":NvimTreeToggle") == 0
     " lazy load nvim-tree
     silent! packadd nvim-tree.lua
   endif

   NvimTreeToggle
 endfunction

" Call nvim-tree lazy load function
nnoremap <silent> <leader>n :call ToggleNvimTree()<CR>

"Open lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>


nnoremap <silent> gb :BufferLinePick<CR>

command LoadPacker lua require 'pluginList'


if exists('g:lspconfig')
  finish
endif
let g:lspconfig = 1

lua << EOF
lsp_complete_configured_servers = function()
  return table.concat(require'lspconfig'.available_servers(), '\n')
end
lsp_get_active_client_ids = function()
  client_ids = {}
  for idx, client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(client_ids, tostring(client.id))
  end
  return client_ids
end
require'lspconfig'._root._setup()
EOF

let s:save_cpo = &cpoptions
set cpoptions&vim

augroup hlsearch
	autocmd!
	" trigger when hlsearch is toggled
	autocmd OptionSet hlsearch call <SID>toggle(v:option_old, v:option_new)
augroup END

function! s:StartHL()
	silent! if v:hlsearch && !search('\%#\zs'.@/,'cnW')
		call <SID>StopHL()
	endif
endfunction

function! s:StopHL()
	if ! v:hlsearch || mode() !=? 'n'
		return
	else
		silent call feedkeys("\<Plug>(StopHL)", 'm')
	endif
endfunction

function! s:toggle(old, new)
	if a:old == 0 && a:new == 1
		" nohls --> hls
		"   set up
		noremap  <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
		noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

		autocmd hlsearch CursorMoved * call <SID>StartHL()
		autocmd hlsearch InsertEnter * call <SID>StopHL()
	elseif a:old == 1 && a:new == 0
		" hls --> nohls
		"   tear down
		nunmap <expr> <Plug>(StopHL)
		unmap! <expr> <Plug>(StopHL)

		autocmd! hlsearch CursorMoved
		autocmd! hlsearch InsertEnter
	else
		" nohls --> nohls
		"   do nothing
		return
	endif
endfunction

call <SID>toggle(0, &hlsearch)

let &cpoptions = s:save_cpo


""================     File Types    ===================""
""                                                      ""

filetype plugin indent on

" Auto-regenerate tags after saving files
"let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')
if has('autocmd')
  autocmd BufWritePost *.rb,*.js silent! !/usr/local/bin/ctags -R 2> /dev/null &
  autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
endif

" file types
if has('autocmd')
  au BufRead,BufNewFile *.thor set filetype=ruby
  au BufRead,BufNewFile *.erb set filetype=html
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.template set filetype=javascript
endif


let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

" Posix regular expressions for matching interesting items. Since this will
" be passed as an environment variable, no whitespace can exist in the options
" so [:space:] is used instead of normal whitespaces.
" Adapted from: https://gist.github.com/2901844
  "\ --regex-js=/\$scope[A-Za-z0-9._$]*\.([A-Za-z0-9._$]+?)[ \t]*[:=]/\1/t,ng-scope-variable/
  "\ --regex-js=/\.controller\('([A-Za-z0-9._$]+)'/\1/c,ng-controller/
let s:ctags_opts = '
  \ --langdef=js
  \ --langmap=js:.js
  \ --regex-js=/([A-Za-z0-9._$()]+)[ \t]*[=][ \t]*function[ \t]*\(/\1/,function/
  \ --regex-js=/function[ \t]+([A-Za-z0-9._$]+)[ \t]*\(([^)])\)/\1/,function/
  \ --regex-js=/(var)*[ \t]+(\w+)[ \t]+=/\2/,var/
  \ --langdef=css
  \ --langmap=css:.css
  \ --regex-css=/^[ \t]*\.([A-Za-z0-9_-]+)/.\1/c,class,classes/
  \ --regex-css=/^[ \t]*#([A-Za-z0-9_-]+)/#\1/i,id,ids/
  \ --regex-css=/^[ \t]*(([A-Za-z0-9_-]+[ \t\n,]+)+)\{/\1/t,tag,tags/
  \ --regex-css=/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/m,media,medias/
  \ --langdef=coffee
  \ --langmap=coffee:.coffee
  \ --regex-coffee=/(^|=[ \t])*class ([A-Za-z_][A-Za-z0-9_]+\.)*([A-Za-z_][A-Za-z0-9_]+)( extends ([A-Za-z][A-Za-z0-9_.]*)+)?$/\3/c,class/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?@?(([A-Za-z][A-Za-z0-9_.]*)+):.*[-=]>.*$/\3/m,method/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=.*[-=]>.*$/\3/f,function/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/v,variable/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/f,field/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,static field/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?/\3/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){0}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){1}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){2}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){3}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){4}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){5}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){6}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){7}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){8}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){9}/\8/f,field/'

if exists('g:loaded_difftools')
	finish
endif
let g:loaded_difftools = 1

augroup plugin_difftools
	autocmd!
	autocmd InsertLeave * if &l:diff | diffupdate | endif
	autocmd BufWinLeave __diff call s:close_diff()
augroup END

function! s:open_diff()
	" Open diff window and start comparison
	let l:bnr = bufnr('%')
	call setwinvar(winnr(), 'diff_origin', l:bnr)
	vertical new __diff
	let l:diff_bnr = bufnr('%')
	nnoremap <buffer><silent> q :quit<CR>
	setlocal buftype=nofile bufhidden=wipe
	r ++edit #
	0d_
	diffthis
	setlocal readonly
	wincmd p
	let b:diff_bnr = l:diff_bnr
	nnoremap <buffer><silent> q :execute bufwinnr(b:diff_bnr) . 'q'<CR>
	diffthis
endfunction

function! s:close_diff()
	" Close diff window, switch to original window and disable diff
	" Credits: https://github.com/chemzqm/vim-easygit
	let wnr = +bufwinnr(+expand('<abuf>'))
	let val = getwinvar(wnr, 'diff_origin')
	if ! len(val) | return | endif
	for i in range(1, winnr('$'))
		if i == wnr | continue | endif
		if len(getwinvar(i, 'diff_origin'))
			return
		endif
	endfor
	let wnr = bufwinnr(val)
	if wnr > 0
		execute wnr . 'wincmd w'
		diffoff
	endif
endfunction

" Display diff of unsaved changes
command! -nargs=0 DiffOrig call s:open_diff()

" vim: set ts=2 sw=2 tw=80 noet :


let s:save_cpo = &cpo
set cpo&vim

if v:version < 700
  echoe "bufkill.vim requires vim version 7.00 or greater (mainly because it uses the new lists functionality)"
  finish
endif

if exists("loaded_bufkill")
  if !exists('g:Debug')
  finish
  endif " Debug
endif
let loaded_bufkill = 1

function! s:Debug(level, ...) "{{{1
  " Arguments: First argument is always a level value                                (Debug)
  " Subsequent arguments can be any type.                                            (Debug)
  " If they are a string, and that string represents the name of a global            (Debug)
  " variable, the variable name, and it's value, will be printed.                    (Debug)
  " Lists and dictionaries should be handled.                                        (Debug)
  if !exists('g:Debug') || g:Debug < a:level                                       " (Debug)
    return " (Debug) "
  endif                                                                            " (Debug)
                                                                                   " (Debug)
  let s = ''                                                                       " (Debug)
  let i = 1                                                                        " (Debug)
  while i <= a:0                                                                   " (Debug)
    if exists('DebugArg')                                                          " (Debug)
      unlet DebugArg                                                               " (Debug)
    endif                                                                          " (Debug)
    exec "let DebugArg = a:" . i
    let argType = type(DebugArg)                                                   " (Debug)
    if argType == 1  " String                                                        (Debug)
      " String may be a variable name, in which case we print the name first         (Debug)
      if exists(DebugArg)                                                          " (Debug)
        " The string is indeed the name of a variable                                (Debug)
        " Get the name of the variable, then set DebugArg to the value of that variable
        let s = s . DebugArg . " = "                                               " (Debug)
        exec 'let arg2 = ' . DebugArg
        unlet DebugArg                                                             " (Debug)
        let DebugArg = arg2   " Necessary to change the type of DebugArg             (Debug)
      endif                                                                        " (Debug)
    endif                                                                          " (Debug)
    " Now print the value itself                                                     (Debug)
    let s = s . string(DebugArg)                                                   " (Debug)
    if i < a:0                                                                     " (Debug)
      let s = s . ', '                                                             " (Debug)
    endif                                                                          " (Debug)
    let i = i + 1                                                                  " (Debug)
  endwhile                                                                         " (Debug)
  autocmd! CursorHold * echom '--------- Debug ---------'
  let g:DebugEcho = 'echom'
  exec g:DebugEcho . ' s'
endfunction                                                                        " (Debug)

" User configurable variables {{{1
" The following variables can be set in your .vimrc/_vimrc file to override
" those in this file, such that upgrades to the script won't require you to
" re-edit these variables.

" g:BufKillActionWhenBufferDisplayedInAnotherWindow {{{2
" If the buffer you are attempting to kill in one window is also displayed
" in another, you may not want to kill it afterall.  This option lets you
" decide how this situation should be handled, and can take one of the following
" values:
"   'kill' - kill the buffer regardless, always
"   'confirm' - ask for confirmation before removing it
"   'cancel' - don't kill it
" Regardless of the setting of this variable, the buffer will always be
" killed if you add an exclamation mark to the command, eg :BD!
if !exists('g:BufKillActionWhenBufferDisplayedInAnotherWindow')
  let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'confirm'
endif
call s:Debug(2, 'g:BufKillActionWhenBufferDisplayedInAnotherWindow')

" g:BufKillFunctionSelectingValidBuffersToDisplay {{{2
" When a buffer is removed from a window, the script finds the previous
" buffer displayed in the window.  However, that buffer may have been
" unloaded/deleted/wiped by some other mechanism, so it may not be a
" valid choice.  For some people, an unloaded buffer may be a valid choice,
" for others, no.
" - If unloaded buffers should be displayed, set this
"   variable to 'bufexists'.
" - If unloaded buffers should not be displayed, set this
"   variable to 'buflisted' (default).
" - Setting this variable to 'auto' means that the command :BW will use
"   'bufexists' to decide if a buffer is valid to display, whilst using
"   :BD or :BUN will use 'buflisted'
if !exists('g:BufKillFunctionSelectingValidBuffersToDisplay')
  let g:BufKillFunctionSelectingValidBuffersToDisplay = 'buflisted'
endif
call s:Debug(2, 'g:BufKillFunctionSelectingValidBuffersToDisplay')

" g:BufKillActionWhenModifiedFileToBeKilled {{{2
" When a request is made to kill (wipe, delete, or unload) a modified buffer
" and the "bang" (!) wasn't included in the commend, two possibilities exist:
" 1) Fail in the same way as :bw or :bd would, or
" 2) Prompt the user to save, not save, or cancel the request.
" Possible values are 'fail' (for options 1), and 'confirm' for option 2
" This is similar to the vim 'confirm' option.  Thus, if this variable
" isn't defined, the 'confirm' setting will be adopted.  Since we want
" the most current value of 'confirm', no default value need be set
" for this variable, and it needn't exist.

" g:BufKillOverrideCtrlCaret {{{2
" The standard vim functionality for Ctrl-^ or Ctrl-6 (swap to alternate
" buffer) swaps to the alternate file, and preserves the line within that file,
" but does not preserve the column within the line - instead it goes to the
" start of the line.  If you prefer to go to the same column as well,
" set this variable to 1.
if !exists('g:BufKillOverrideCtrlCaret')
  let g:BufKillOverrideCtrlCaret = 0
endif
call s:Debug(2, 'g:BufKillOverrideCtrlCaret')

" g:BufKillVerbose {{{2
" If set to 1, prints extra info about what's being done, why, and how to
" change it
if !exists('g:BufKillVerbose')
  let g:BufKillVerbose = 1
endif
call s:Debug(2, 'g:BufKillVerbose')

" g:BufKillCreateMappings {{{2
" If set to 1, creates the various mapleader-based mappings.  By default this
" is set to 1 ('true') but users may want to set to 0 ('false') in order to
" define their own mappings or to fix a mapping conflict with another plugin.
let s:BufKillCreateMappings = get(g:,'BufKillCreateMappings',0)

call s:Debug(2, 'g:BufKillCreateMappings')

" g:BufKillCommandPrefix {{{2
" A string that will act as the prefix to all BufKill user commands.  The
" string must adhere to the user command guidelines established in the vim
" help (see :help user-commands).  By default this is set to 'B' but users
" may want to change this in order to define their own commands or to fix
" a command conflict with another plugin.
if !exists('g:BufKillCommandPrefix')
  let g:BufKillCommandPrefix = 'B'
endif
call s:Debug(2, 'g:BufKillCommandPrefix')

" Commands {{{1
"
function! <SID>CreateUniqueCommand(lhs, rhs)
  let command = g:BufKillCommandPrefix.a:lhs
  if exists(':'.command) < 2
    exe 'command -bang '.command.' '.a:rhs
  endif
endfunction
call <SID>CreateUniqueCommand('A'   , ':call <SID>GotoBuffer(''#'',"<bang>")')
call <SID>CreateUniqueCommand('B'   , ':call <SID>GotoBuffer(''bufback'',"<bang>")')
call <SID>CreateUniqueCommand('F'   , ':call <SID>GotoBuffer(''bufforward'',"<bang>")')
call <SID>CreateUniqueCommand('D'   , ':call <SID>BufKill(''bd'',"<bang>")')
call <SID>CreateUniqueCommand('UN'  , ':call <SID>BufKill(''bun'',"<bang>")')
call <SID>CreateUniqueCommand('D'   , ':call <SID>BufKill(''bd'',"<bang>")')
call <SID>CreateUniqueCommand('W'   , ':call <SID>BufKill(''bw'',"<bang>")')
call <SID>CreateUniqueCommand('UNDO', ':call <SID>UndoKill()')

" Keyboard mappings {{{1
"

noremap <Plug>BufKillAlt         :call <SID>GotoBuffer('#', '')<CR>
noremap <Plug>BufKillBangAlt     :call <SID>GotoBuffer('#', '!')<CR>
noremap <Plug>BufKillBack        :call <SID>GotoBuffer('bufback', '')<CR>
noremap <Plug>BufKillBangBack    :call <SID>GotoBuffer('bufback', '!')<CR>
noremap <Plug>BufKillForward     :call <SID>GotoBuffer('bufforward', '')<CR>
noremap <Plug>BufKillBangForward :call <SID>GotoBuffer('bufforward', '!')<CR>
noremap <Plug>BufKillBun         :call <SID>BufKill('bun', '')<CR>
noremap <Plug>BufKillBangBun     :call <SID>BufKill('bun', '!')<CR>
noremap <Plug>BufKillBd          :call <SID>BufKill('bd', '')<CR>
noremap <Plug>BufKillBangBd      :call <SID>BufKill('bd', '!')<CR>
noremap <Plug>BufKillBw          :call <SID>BufKill('bw', '')<CR>
noremap <Plug>BufKillBangBw      :call <SID>BufKill('bw', '!')<CR>
noremap <Plug>BufKillUndo        :call <SID>UndoKill()<CR>

if s:BufKillCreateMappings == 1

  function! <SID>CreateUniqueMapping(lhs, rhs, ...)
    if hasmapto(a:rhs) && !(a:0 == 1 && a:1 == 'AllowDuplicate')
      " The user appears to have defined an alternate mapping for this command
      return
    elseif maparg(a:lhs, 'n') != ""
      " The user appears to have defined a mapping for a:lhs already
      return
    endif
    exec 'nmap <silent> <unique> '.a:lhs.' '.a:rhs
  endfunction

  call <SID>CreateUniqueMapping('<Leader>bb',   '<Plug>BufKillBack')
  call <SID>CreateUniqueMapping('<Leader>bf',   '<Plug>BufKillForward')
  call <SID>CreateUniqueMapping('<Leader>bun',  '<Plug>BufKillBun')
  call <SID>CreateUniqueMapping('<Leader>!bun', '<Plug>BufKillBangBun')
  call <SID>CreateUniqueMapping('<Leader>bd',   '<Plug>BufKillBd')
  call <SID>CreateUniqueMapping('<Leader>!bd',  '<Plug>BufKillBangBd')
  call <SID>CreateUniqueMapping('<Leader>bw',   '<Plug>BufKillBw')
  call <SID>CreateUniqueMapping('<Leader>!bw',  '<Plug>BufKillBangBw')
  call <SID>CreateUniqueMapping('<Leader>bundo','<Plug>BufKillUndo')
  call <SID>CreateUniqueMapping('<Leader>ba',   '<Plug>BufKillAlt')
  if g:BufKillOverrideCtrlCaret == 1
    call <SID>CreateUniqueMapping('<C-^>', '<Plug>BufKillAlt', 'AllowDuplicate')
  endif
endif

function! <SID>BufKill(cmd, bang) "{{{1
" The main function that sparks the buffer change/removal
  let DebugF = 'BufKill'
  call s:Debug(1, DebugF, a:cmd, a:bang)
  if !exists('w:BufKillList')
    echoe "BufKill Error: array w:BufKillList does not exist!"
    echoe "Restart vim and retry, and if problems persist, notify the author!"
    return
  endif
  call s:Debug(2, DebugF, 'w:BufKillList')

  call <SID>SaveWindowPos()

  " Get the buffer to delete - the current one obviously
  let s:BufKillBufferToKill = bufnr('%')
  let s:BufKillBufferToKillPath = expand('%:p')
  call s:Debug(2, DebugF, 's:BufKillBufferToKill')

  " Just to make sure, check that this matches the buffer currently pointer to
  " by w:BufKillIndex - else I've stuffed up
  if s:BufKillBufferToKill != w:BufKillList[w:BufKillIndex]
    echom "BufKill Warning: bufferToKill = ".s:BufKillBufferToKill." != element ".w:BufKillIndex." in the list: (".string(w:BufKillList).")"
    echom "Please notify the author of the circumstances of this message!"
  endif

  " If the buffer is modified, and a:bang is not set, give the same kind of
  " error (or confirmation) as normal bun/bw/bd
  if &modified && strlen(a:bang) == 0
    if exists('g:BufKillActionWhenModifiedFileToBeKilled')
      let s:BufKillActionWhenModifiedFileToBeKilled = g:BufKillActionWhenModifiedFileToBeKilled
    else
      if &confirm
        let s:BufKillActionWhenModifiedFileToBeKilled = 'confirm'
      else
        let s:BufKillActionWhenModifiedFileToBeKilled = 'fail'
      endif
    endif
    if s:BufKillActionWhenModifiedFileToBeKilled =~ '[Ff][Aa][Ii][Ll]'
      echohl ErrorMsg
      echo "No write since last change for buffer '" . bufname(s:BufKillBufferToKill) . "' (add ! to override)"
      echohl None
      return
    elseif s:BufKillActionWhenModifiedFileToBeKilled =~ '[Cc][Oo][Nn][Ff][Ii][Rr][Mm]'
      let options = "&Yes\n&No\n&Cancel"
      let actionAdjustment = 0
      let bufname = bufname(winbufnr(winnr()))
      if bufname == ''
        let bufname = '[No File]'
        let options = "&No\n&Cancel"
        let actionAdjustment = 1
      endif
      let action=confirm("Save Changes in " . bufname . " before removing it?", options)
      if action + actionAdjustment == 1
        " Yes - try to save - if there is an error, cancel
        let v:errmsg = ""
        silent w
        if v:errmsg != ""
          echoerr "Unable to write buffer!"
          return
        endif
      elseif action + actionAdjustment == 2
        " No, abandon changes
        set nomodified
      else
        " Cancel (or any other result), don't do the open
        return
      endif
    else
      echoe "Illegal value (' . s:BufKillActionWhenModifiedFileToBeKilled . ') stored in variable s:BufKillActionWhenModifiedFileToBeKilled, please notify the author"
    endif
  endif

  " Get a list of all windows which have this buffer loaded
  let s:BufKillWindowListWithBufferLoaded = []
  let i = 1
  let buf = winbufnr(i)
  while buf != -1
    if buf == s:BufKillBufferToKill
      let s:BufKillWindowListWithBufferLoaded += [i]
      call s:Debug(2, DebugF, 'Added window ' . i . ' to', 's:BufKillWindowListWithBufferLoaded')
    endif
    let i = i + 1
    let buf = winbufnr(i)
  endwhile
  call s:Debug(2, DebugF, 's:BufKillWindowListWithBufferLoaded')

  " Handle the case where the buffer is displayed in multiple windows
  if len(s:BufKillWindowListWithBufferLoaded) > 1 && strlen(a:bang) == 0
    if g:BufKillActionWhenBufferDisplayedInAnotherWindow =~ '[Cc][Aa][Nn][Cc][Ee][Ll]'
      if g:BufKillVerbose
        echom "Buffer '" . bufname(s:BufKillBufferToKill) . "' displayed in multiple windows - " . a:cmd . " cancelled (add ! to kill anywawy, or set g:BufKillActionWhenBufferDisplayedInAnotherWindow to 'confirm' or 'kill')"
      endif
      return
    elseif g:BufKillActionWhenBufferDisplayedInAnotherWindow =~ '[Cc][Oo][Nn][Ff][Ii][Rr][Mm]'
      let choice = confirm("Buffer '" . bufname(s:BufKillBufferToKill) . "' displayed in multiple windows - " . a:cmd . " it anyway?", "&Yes\n&No", 1)
      if choice != 1
        return
      endif
    elseif g:BufKillActionWhenBufferDisplayedInAnotherWindow =~ '[Rr][Ee][Mm][Oo][Vv][Ee]'
      if g:BufKillVerbose
        echom "Buffer '" . bufname(s:BufKillBufferToKill) . "' displayed in multiple windows - executing " . a:cmd . " anyway."
      endif
      " Fall through and continue
    endif
  endif

  " For each window that the file is loaded in, go to the previous buffer from its list
  let i = 0
  while i < len(s:BufKillWindowListWithBufferLoaded)
    let win = s:BufKillWindowListWithBufferLoaded[i]
    call s:Debug(2, DebugF, 'Got window ' . win . ' from', 's:BufKillWindowListWithBufferLoaded', 'position ' . i)

    " Go to the right window in which to perform the action
    if win > 0
      call s:Debug(2, DebugF, 'Goto window ' . win)
      exec 'normal! ' . win . 'w'
      call s:Debug(2, DebugF, 'Current window ' . winnr())
    endif

    " Go to the previous buffer for this window
    call <SID>GotoBuffer(a:cmd, a:bang)

    let i = i + 1
  endwhile

  " Restore the cursor to the correct window _before_ removing the buffer,
  " since the buffer removal could have side effects on the windows (eg
  " minibuffer disappearing due to not enough buffers)
  call <SID>RestoreWindowPos()

  " Kill the old buffer, but save info about it for undo purposes
  let s:BufKillLastWindowListWithBufferLoaded = s:BufKillWindowListWithBufferLoaded
  let s:BufKillLastBufferKilledPath = s:BufKillBufferToKillPath
  let s:BufKillLastBufferKilledNum = s:BufKillBufferToKill
  " In some cases (eg when deleting the quickfix buffer) the buffer will
  " already have been deleted by the switching to another buffer in its
  " window.  Thus we must check before deleting.
  if bufexists(s:BufKillBufferToKill)
    let killCmd = a:cmd . a:bang . s:BufKillBufferToKill
    call s:Debug(2, DebugF, 'killCmd = ' . killCmd)
    exec killCmd
  else " Debug
    call s:Debug(2, DebugF, 'buffer #'.s:BufKillBufferToKill.' removed during GotoBuffer step')
  endif

  " Restore position if saved.  Needed on console vim, at least, to restore correct column
  call <SID>RestoreView()

  call s:Debug(2, DebugF, 'Exiting')
endfunction

function! <SID>IsBufferNew(buf) "{{{1
  return (bufname(a:buf) == '') && !getbufvar(a:buf, '&modified')
endfunction

function! <SID>SwitchToNewBuffer(bang) "{{1
  let old_bufnum = bufnr('%')

  " if we already have a "new" buffer, switch to it
  for bufnum in range(1, bufnr('$'))
    if bufexists(bufnum) && <SID>IsBufferNew(bufnum) && (bufnum != old_bufnum)
      exec 'b' . a:bang . bufnum
      return
    endif
  endfor

  " try to create a new buffer
  exec 'enew' . a:bang
  if bufnr('%') != old_bufnum
    return
  endif

  " sometimes vim doesn't bother creating a new buffer, eg if you do two enews
  " in a row. it's possible to workaround this by modifying the current buffer
  " before doing the enew...
  let &modifiable = 1
  normal! iforce enew to create a new buffer
  enew!
  let new_bufnum = bufnr('%')
  exec 'b' . old_bufnum
  silent normal! u
  exec 'b' . new_bufnum
endfunction

function! <SID>GotoBuffer(cmd, bang) "{{{1
  "Function to display the previous buffer for the specified window
  " a:cmd is one of
  "     bun - Unloading the current buffer
  "     bd - Deleting the current buffer
  "     bw - Wiping the current buffer
  "     bufback - stepping back through the list
  "     bufforward - stepping forward through the list
  "     # - swap to alternate buffer, if one exists. Use this instead of
  "         Ctrl-^, in order to swap to the previous column of the alternate
  "         file, which does not happen with regular Ctrl-^.
  let DebugF = 'GotoBuffer'
  call s:Debug(1, DebugF, a:cmd)
  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')

  if (a:cmd=='bun' || a:cmd=='bd' || a:cmd=='bw')
    let killing = 1
  else
    let killing = 0
  endif

  if killing
    " Handle the 'auto' setting for
    " g:BufKillFunctionSelectingValidBuffersToDisplay
    let validityFunction = g:BufKillFunctionSelectingValidBuffersToDisplay
    if validityFunction == 'auto'
      " The theory here is that if a person usually uses bd, then buffers
      " they've intended to delete will still exist, but not be listed.  Hence
      " we use buflisted to check if they've deleted the buffer already, so as
      " not to show the ones they've deleted.  If instead they use bw,
      " then the assumption is that to really delete buffers they use bw, so
      " if they've used bd, they were meaning to hide the file from view - but
      " keep it around - hence we should find it if it's only been deleted,
      " hence we use bufexists to look for it.  Yes, it's weak logic - but you
      " can always override it! ;)
      if a:cmd == 'bw'
        let validityFunction = 'bufexists'
      else
        let validityFunction = 'buflisted'
      endif
    endif
    let w:BufKillIndex -= 1
  else
    " Should only be used with undeleted (and unwiped) buffers
    let validityFunction = 'buflisted'

    if a:cmd == 'bufforward'
      let w:BufKillIndex += 1
    elseif a:cmd == 'bufback'
      let w:BufKillIndex -= 1
    elseif a:cmd == '#'
      let bufnum = bufnr('#')
      if bufnum == -1
        echom "E23: No alternate file (error simulated by bufkill.vim)"
        return
      endif
      if bufnum == bufnr('%')
        " If the alternate buffer is also the current buffer, do nothing
        return
      elseif !buflisted(bufnum)
        " Vim just ignores the command in this case, so we'll do likewise
        " Update: it seems it no longer ignores the command in this case
        " but in my experience, I don't want to jump to an unlisted
        " buffer via this command - so I'll continue to ignore it - but notify
        " the user...
        echom "bufkill: Alternate buffer is unlisted buffer ".bufnum." ("
          \ .bufname(bufnum).") - ignoring request"
        return
      endif
      " Find this buffer number in the w:BufKillList
      let w:BufKillIndex = index(w:BufKillList, bufnum)
    endif
  endif

  while 1
    if w:BufKillIndex < 0
      let w:BufKillIndex = 0
    elseif w:BufKillIndex > (len(w:BufKillList) - 1)
      let w:BufKillIndex = len(w:BufKillList) - 1
    endif

    if w:BufKillList[w:BufKillIndex] == bufnr('%')
      if !killing
        echom 'BufKill: already at the limit of the BufKill list'
        return
      endif

      " we're going to kill the current buffer -- we want to switch to a
      " different one...
      if w:BufKillIndex == 0
        if len(w:BufKillList) == 1
          " there are no other buffers in our list. switch to a "new" one
          call <SID>SwitchToNewBuffer(a:bang)
          call <SID>SaveView()
          return
        endif
        let w:BufKillIndex += 1
      else
        let w:BufKillIndex -= 1
      endif
    endif

    let newBuffer = w:BufKillList[w:BufKillIndex]
    let newColumn = w:BufKillColumnList[w:BufKillIndex]

    call s:Debug(2, DebugF, 'newBuffer = ' . newBuffer . ', newColumn = ' . newColumn)
    exec 'let validityResult = '.validityFunction.'(newBuffer)'
    if validityResult
      " buffer is valid: switch to it...
      exec 'b' . a:bang . newBuffer . "|call cursor(line('.')," . newColumn . ')'
      call <SID>SaveView()
      return
    endif

    " buffer isn't valid: remove it from the list
    call remove(w:BufKillList, w:BufKillIndex)
    call remove(w:BufKillColumnList, w:BufKillIndex)
    if a:cmd != 'bufforward'
      let w:BufKillIndex -= 1
      " No change needed for bufforward since we just deleted the element
      " being pointed to, so effectively, we moved forward one spot
    endif
  endwhile

  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')
  call s:Debug(2, DebugF, 'Exiting')
  " redraw  " To hide call Debug messages for now!
endfunction   " GotoBuffer

function! <SID>UpdateList(event) "{{{1
  " Function to update the window list with info about the current buffer
  let DebugF = 'UpdateList'
  call s:Debug(1, DebugF, 'Entering(' . a:event . '): win = ' . winnr() . ', buf = ' . bufnr('%') . ' (' . bufname('%') . ')')
  if !exists('w:BufKillList')
    let w:BufKillList = []
  endif
  if !exists('w:BufKillColumnList')
    let w:BufKillColumnList = []
  endif
  if !exists('w:BufKillIndex')
    let w:BufKillIndex = -1
  endif
  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')
  let bufferNum = bufnr('%')

  if (w:BufKillIndex == -1) || (w:BufKillList[w:BufKillIndex] != bufferNum)
    " Increment index
    let w:BufKillIndex += 1
    if w:BufKillIndex < len(w:BufKillList)
      " The branch is diverging, remove the end of the list
      call remove(w:BufKillList, w:BufKillIndex, -1)
      " Same for column list
      if w:BufKillIndex < len(w:BufKillColumnList)
        call remove(w:BufKillColumnList, w:BufKillIndex, -1)
      endif
    endif
    " Now remove any pre-existing instances of the buffer in the list
    let existingIndex = index(w:BufKillList, bufferNum)
    if existingIndex != -1
      call remove(w:BufKillList, existingIndex)
      let w:BufKillIndex -= 1
      if existingIndex < len(w:BufKillColumnList)
        call remove(w:BufKillColumnList, existingIndex)
      endif
    endif
    " Now add the buffer to the list, at the end
    let w:BufKillList += [bufferNum]
  endif

  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')
  call s:Debug(1, DebugF, 'Exiting (' . a:event . '): ', 'w:BufKillList')
  " redraw  " To hide call Debug messages for now!
endfunction   " UpdateList

function! <SID>UpdateLastColumn(event) "{{{1
  " Function to save the current column and buffer and window numbers,
  let DebugF = 'UpdateColumnList'
  call s:Debug(1, DebugF, 'Entering(' . a:event . '): win = ' . winnr() . ', buf = ' . bufnr('%') . ' (' . bufname('%') . ')')
  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')
  if !exists('w:BufKillList')
    " Just give up for now.
    return
  endif
  let index = index(w:BufKillList, bufnr('%'))
  if index != -1
    " Extend list if required, then set the value
    let w:BufKillColumnList += repeat([0], index - len(w:BufKillColumnList) + 1)
    let w:BufKillColumnList[index] = col('.')
  else
    call s:Debug(2, DebugF, 'UpdateLastColumn failed to find bufnr ' . bufnr('%') . ' in w:BufKillList')
  endif
  call s:Debug(2, DebugF, 'w:BufKillList')
  call s:Debug(2, DebugF, 'w:BufKillColumnList')
  call s:Debug(2, DebugF, 'w:BufKillIndex')
  call s:Debug(1, DebugF, 'Exiting (' . a:event . ')')
  " redraw  " To hide call Debug messages for now!
endfunction

function! <SID>UndoKill() "{{{1
  let DebugF = 'UndoKill'
  call s:Debug(1, DebugF)

  if !exists('s:BufKillLastBufferKilledNum') || !exists('s:BufKillLastBufferKilledPath') || s:BufKillLastBufferKilledNum == -1 || s:BufKillLastBufferKilledPath == ''
    echoe 'BufKill: nothing to undo (only one level of undo is supported)'
  else
    if bufexists(s:BufKillLastBufferKilledNum)
      let cmd = 'b' . s:BufKillLastBufferKilledNum
    elseif filereadable(s:BufKillLastBufferKilledPath)
      let cmd = 'e ' . s:BufKillLastBufferKilledPath
    else
      unlet s:BufKillLastBufferKilledNum
      unlet s:BufKillLastBufferKilledPath
      unlet s:BufKillLastWindowListWithBufferLoaded
      echoe 'BufKill: unable to undo. Neither buffer (' . s:BufKillLastBufferKilledNum . ') nor file (' . s:BufKillLastBufferKilledPath . ') could be found.'
    endif

    " For each window the buffer was removed from, show it again
    call <SID>SaveWindowPos()
    let i = 0
    while i < len(s:BufKillLastWindowListWithBufferLoaded)
      let win = s:BufKillLastWindowListWithBufferLoaded[i]
      call s:Debug(2, DebugF, 'Got window ' . win . ' from', 's:BufKillLastWindowListWithBufferLoaded', 'position ' . i)
      call s:Debug(2, DebugF, 'Goto window ' . win)
      exec 'normal! ' . win . 'w'
      call s:Debug(2, DebugF, 'Current window ' . winnr())
      exec cmd
      let i = i + 1
    endwhile
    call <SID>RestoreWindowPos()

    unlet s:BufKillLastBufferKilledNum
    unlet s:BufKillLastBufferKilledPath
    unlet s:BufKillLastWindowListWithBufferLoaded
  endif
  call s:Debug(2, DebugF, 'Exiting')
endfunction

function! <SID>SaveWindowPos() "{{{1
  " Save the current window, to be able to come back to it after doing things
  " in other windows
  let DebugF = 'SaveWindowPos'
  let s:BufKillWindowPos = winnr()
  call s:Debug(2, DebugF, 'Saving with winnr = ', 's:BufKillWindowPos')
endfunction

function! <SID>RestoreWindowPos() "{{{1
  " Restore the window from it's saved config variable
  let DebugF = 'RestoreWindowPos'
  call s:Debug(2, DebugF, 'Restoring to = ', 's:BufKillWindowPos')
  exec 'normal! ' . s:BufKillWindowPos . 'w'
endfunction

function! <SID>SaveView() "{{{1
  " Function to save the current view to w:BufKillSavedView.  This has been
  " found necessary on console vim in particular, in order return to the
  " correct column when killing a file.
  let DebugF = 'SaveView'
  if exists("*winsaveview")
    let w:BufKillSavedView = winsaveview()
    call s:Debug(2, DebugF, 'SavedView = ', 'w:BufKillSavedView')
  else
    call s:Debug(1, DebugF, 'winsaveview not in this version of Vim, column not reliably saved.')
  endif
endfunction   " SaveView

function! <SID>RestoreView() "{{{1
  " Matching restore function to SaveView
  let DebugF = 'RestoreView'
  if exists("*winrestview") && exists('w:BufKillSavedView')
    call winrestview(w:BufKillSavedView)
    call s:Debug(2, DebugF, 'Restoring to = ', 'w:BufKillSavedView')
    unlet w:BufKillSavedView
  endif
endfunction   " RestoreView

" Autocommands {{{1
"
augroup BufKill
autocmd!
autocmd BufKill WinEnter * call <SID>UpdateList('WinEnter')
autocmd BufKill BufEnter * call <SID>UpdateList('BufEnter')
autocmd BufKill BufAdd * call <SID>UpdateList('BufAdd')
autocmd BufKill WinLeave * call <SID>UpdateLastColumn('WinLeave')
autocmd BufKill BufLeave * call <SID>UpdateLastColumn('BufLeave')
augroup END

" Cleanup and modelines {{{1
let &cpo = s:save_cpo

" vim:ft=vim:fdm=marker:fen:fmr={{{,}}}:

" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

" Set indenting for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4


let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


" filetype & syntax
filetype plugin on
filetype indent on

augroup assemblytoggle
    autocmd!
    au BufRead,BufNewFile *.s let asmsyntax='gas'|let filetype_inc='gas'
    au BufRead,BufNewFile *.asm let asmsyntax='armasm'|let filetype_inc='armasm'
augroup END

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif
