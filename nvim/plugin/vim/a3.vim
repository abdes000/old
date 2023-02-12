

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" General options
set nocompatible " We use Vim, not Vi
syntax enable " Enable syntax highlights
set ttyfast " Faster refraw
set mouse=nv " Mouse activated in Normal and Visual Mode
set shortmess+=I " No intro when starting Vim
set smartindent " Smart... indent
set expandtab " Insert spaces instead of tabs
set softtabstop=2 " ... and insert two spaces
set shiftwidth=2 " Indent with two spaces
set incsearch " Search as typing
set hlsearch " Highlight search results
set cursorline " Highligt the cursor line
set showmatch " When a bracket is inserted, briefly jump to the matching one
set matchtime=3 " ... during this time
set virtualedit=onemore " Allow the cursor to move just past the end of the line
set history=100 " Keep 100 undo
set wildmenu " Better command-line completion
set scrolloff=10 " Always keep 10 lines after or before when scrolling
set sidescrolloff=5 " Always keep 5 lines after or before when side scrolling
set noshowmode " Don't display the current mode
set gdefault " The substitute flag g is on
set hidden " Hide the buffer instead of closing when switching
set backspace=indent,eol,start " The normal behaviour of backspace
set showtabline=2 " Always show tabs
set laststatus=2 " Always show status bar
set number " Show the line number
set updatetime=1000
set ignorecase " Search insensitive
set smartcase " ... but smart
let &showbreak="\u21aa " " Show a left arrow when wrapping text
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set synmaxcol=300 " Don't try to highlight long lines
set guioptions-=T " Don't show toolbar in Gvim
set iskeyword+=\- " Complete words containing a dash
set title
set titleold="Terminal"
" Open all cmd args in new tabs
execute ":silent tab all"

""" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter * set timeout
au InsertLeave * set notimeout

""" When opening a file : - Reopen at last position - Display info
function! GetFileInfo()
  let permissions = getfperm(expand('%:p'))
  echon  &filetype . ", " . GetFileSize() . ", " . permissions
endfunction
function! GetFileSize()
  let bytes = getfsize(expand('%:p'))
  if bytes <= 0
     return ""
  elseif bytes > 1024*1000*1000
    return (bytes / 1024*1000*1000) . "GB"
  elseif bytes > 1024*1000
    return (bytes / 1024*1000) . "MB"
  elseif bytes > 1024
    return (bytes / 1024) . "KB"
  else
     return bytes . "B"
  endif
endfunction
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | call GetFileInfo()

""" Custom backup and swap files
let myVimDir = expand("$HOME/.vim")
let myBackupDir = myVimDir . '/backup'
let mySwapDir = myVimDir . '/swap'
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    call mkdir(a:dir,'p')
  endif
endfunction
call EnsureDirExists(myVimDir)
call EnsureDirExists(myBackupDir)
call EnsureDirExists(mySwapDir)
set backup
set backupskip=/tmp/*
set backupext=.bak
let &directory = mySwapDir
let &backupdir = myBackupDir
set writebackup

""" Smart Paste
let &t_ti .= "\<Esc>[?2004h"
let &t_te .= "\<Esc>[?2004l"
function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction
execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

"""  Block Commenter Helper
autocmd FileType c,cpp,java,go      let b:comment_leader = '\/\/'
autocmd FileType javascript         let b:comment_leader = '\/\/'
autocmd FileType arduino            let b:comment_leader = '\/\/'
autocmd FileType registry           let b:comment_leader = ';'
autocmd FileType dosbatch           let b:comment_leader = '::'
autocmd FileType sh,ruby,python     let b:comment_leader = '#'
autocmd FileType conf,fstab,zsh     let b:comment_leader = '#'
autocmd FileType make,Cmake,yaml    let b:comment_leader = '#'
autocmd FileType desktop            let b:comment_leader = '#'
autocmd FileType matlab,tex         let b:comment_leader = '%'
autocmd FileType vim                let b:comment_leader = '"'
autocmd FileType css                let b:comment_leader = '\/\*' | let b:comment_ender = '\*\/'
autocmd FileType html,xml,markdown  let b:comment_leader = '<!--' | let b:comment_ender = '-->'

""" Key mappings
if g:UseCustomKeyBindings

" Helper functions
function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingEscInInsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
function! MyQuit()
  if TabIsEmpty() == 1
    q!
  else
    if &modified
      if (confirm("YOU HAVE UNSAVED CHANGES! Wanna quit anyway?", "&Yes\n&No", 2)==1)
        q!
      endif
    else
      q
    endif
  endif
endfunction
function! MySave()
  let cantSave = "echo \"Can't save the file: \" . v:exception | return"
  let notSaved = "redraw | echo 'This buffer was NOT saved!' | return"
  try
    silent w
  catch /:E45:\|:E505:\|:E212:/
    if (confirm("This buffer is read only! Wanna save it anyway?", "&Yes\n&No", 2)==1)
      try
        silent w!
      catch /:E212:/
        if (confirm("Can't open the file, do you want to save it as root?", "&Yes\n&No", 2)==1)
          try
            w !sudo tee % > /dev/null
            edit!
          catch
            exe cantSave
          endtry
        else
          exe notSaved
        endif
      catch
        exe cantSave
      endtry
    else
      exe notSaved
    endif
  catch /:E32:/
    if (confirm("This buffer has no file to be saved in! Wanna choose it?", "&Yes\n&No", 2)==1)
      call feedkeys("\<Esc>:w ")
    else
      exe notSaved
    endif
  catch
    exe cantSave
  endtry
  let time = strftime("%T")
  let file = expand('%:p')
  let permissions = getfperm(file)
  echom file . " saved at " . time | redraw
  echohl iGreen | echon "    SAVED     "
  echohl Green | echon  " " . GetFileSize() . ", " . time . ", " . permissions
  echohl None
endfunction
function! OpenLastBufferInNewTab()
    redir => ls_output
    silent exec 'ls'
    redir END
    let ListBuffers = reverse(split(ls_output, "\n"))
    for line in ListBuffers
      let title = split(line, "\"")[1]
      if title !~  "\[No Name"
        execute "tabnew +" . split(line, " ")[0] . "buf"
        break
      endif
    endfor
endfunction
function! ToggleColorColumn()
    if &colorcolumn != 0
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn = 80
    endif
endfunction
function! MyPasteToggle()
  set invpaste
  echo "Paste" (&paste) ? "On" : "Off"
endfunction
function! OpenNetrw()
  if TabIsEmpty() == 1
    Explore
  else
    Texplore
  endif
endfunction
function! MenuNetrw()
  let c = input("What to you want to do? (M)ake a dir, Make a (F)ile, (R)ename, (D)elete : ")
  if (c == "m" || c == "M")
    normal d
  elseif (c == "f" || c == "F")
    normal %
  elseif (c == "r" || c == "R")
    normal R
  elseif (c == "d" || c == "D")
    normal D
  endif
endfunction
function! ToggleComment()
  if exists('b:comment_leader')
    if getline(".") =~ '^' . b:comment_leader
      " Uncomment the line
      execute 'silent s/^' . b:comment_leader .'\( \)\?//g'
      if exists('b:comment_ender')
        execute 'silent s/ ' . b:comment_ender .'$//g'
      endif
    elseif getline(".") =~ '^\s*$'
      " Empty lines: ignore
    else
      " Comment the line
      execute 'silent s/^/' . b:comment_leader .' /g'
      if exists('b:comment_ender')
        execute 'silent s/$/\ ' . b:comment_ender .'/g'
      endif
    endif
  else
    echom "Unknow comment's symbols for filetype"
  endif
endfunction

" Usefull shortcuts to enter insert mode
nnoremap <CR> i<CR>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>

" Ctrl A - Begin Line
call CreateShortcut("C-a", "0", "inv")

" Ctrl E - End Line
call CreateShortcut("C-e", "$l", "inv")

" Ctrl S - Save
call CreateShortcut("C-s", ":call MySave()<CR>", "nv", "cmdInVisual", "restoreSelectionAfter")
call CreateShortcut("C-s", ":call MySave()<CR>i<Right>", "i", "noTrailingIInInsert")

" Home - Go To Begin
call CreateShortcut("Home", "gg", "inv")

" End - Go To End
call CreateShortcut("End", "G", "inv")

" Ctrl K - Delete Line
call CreateShortcut("C-k", "dd", "in")
call CreateShortcut("C-k", "d", "v")

" Ctrl Q - Duplicate Line
call CreateShortcut("C-q", "mjyyp`jjl", "i")
call CreateShortcut("C-q", "mjyyp`jj", "n")
call CreateShortcut("C-q", "y`]p", "v")

" Ctrl Down - Pagedown
call CreateShortcut("C-Down", "15j", "inv")

" Ctrl Up - Pageup
call CreateShortcut("C-Up", "15k", "inv")

" Ctrl Right - Next Word
call CreateShortcut("C-Right", "w", "nv")

" Ctrl Left - Previous Word
call CreateShortcut("C-Left", "b", "nv")

" Ctrl F - Find
call CreateShortcut("C-f", "/", "in", "noTrailingIInInsert")

" Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")

" Ctrl G - Search and Replace on the line only
call CreateShortcut("C-g", ":s/", "in", "noTrailingIInInsert")

" Ctrl L - Delete all lines
call CreateShortcut("C-l", "ggdG", "in")

" Pageup - Move up Line
call CreateShortcut("PageUp", ":m-2<CR>", "inv", "restoreSelectionAfter")

" Pagedown - Move down Line
call CreateShortcut("PageDown", ":m+<CR>", "in")
call CreateShortcut("PageDown", ":m'>+<CR>", "v", "restoreSelectionAfter")

" Ctrl Pageup - Move up Line booster
call CreateShortcut("C-PageUp", ":m-16<CR>", "inv", "restoreSelectionAfter")

" Ctrl Pagedown - Move down Line boosted
call CreateShortcut("C-PageDown", ":m+15<CR>", "in")
call CreateShortcut("C-PageDown", ":m'>+15<CR>", "v", "restoreSelectionAfter")

" Ctrl C - Quit
call CreateShortcut("C-c", ":call MyQuit()<CR>", "inv", "cmdInVisual")

" Tab - Indent
call CreateShortcut("Tab", ">>", "n")
call CreateShortcut("Tab", ">", "v", "restoreSelectionAfter")

" Shift Tab - UnIndent
call CreateShortcut("S-Tab", "<<", "in")
call CreateShortcut("S-Tab", "<", "v", "restoreSelectionAfter")

" Ctrl Z - Undo
call CreateShortcut("C-z", "u", "in")

" Ctrl R - Redo
call CreateShortcut("C-r", "<C-r>", "in")

" Ctrl D - Suppr (the key)
call CreateShortcut("C-d", "<del>", "iv", "noLeadingEscInInsert", "noTrailingIInInsert")
call CreateShortcut("C-d", "x", "n")

" Ctrl T - New tab
call CreateShortcut("C-t", ":tabnew<CR>i", "inv", "noTrailingIInInsert", "cmdInVisual")

" Alt Right - Next tab
call CreateShortcut("A-Right", "gt", "inv")

" Alt Left - Previous tab
call CreateShortcut("A-Left", "gT", "inv")

" F2 - Paste toggle
call CreateShortcut("f2",":call MyPasteToggle()<CR>", "n")

" F3 - Line numbers toggle
call CreateShortcut("f3",":set nonumber!<CR>", "in")

" F4 - Panic Button
call CreateShortcut("f4","mzggg?G`z", "inv")

" F6 - Toggle color column at 80th char
call CreateShortcut("f6",":call ToggleColorColumn()<CR>", "inv")

" Ctrl O - Netrw (:Explore)
call CreateShortcut("C-o",":call OpenNetrw()<CR>", "inv", "noTrailingIInInsert", "cmdInVisual")

" Ctrl \ - Toggle comments
call CreateShortcut("C-\\", ":call ToggleComment()<CR>", "inv")

let g:netrw_banner=0 " Hide banner
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' " Hide hidden files
autocmd FileType netrw call KeysInNetrw()
function! KeysInNetrw()
  " Right to enter
  nmap <buffer> <Right> <CR>
  " Left to go up
  nmap <buffer> <Left> -
  " l - Display info
  nmap <buffer> l qf
  " n - Menu
  nmap <buffer> n :call MenuNetrw()<CR>
endfunction

endif " End custom key bindings

""" Custom commands

" :UndoCloseTab - To undo close tab
command! UndoCloseTab call OpenLastBufferInNewTab()

" :RemoveTrailingSpaces - To remove unwanted space(s) at the end of lines
command! RemoveTrailingSpaces %s/\s\+$

""" Colors and Statusline

let defaultAccentColor=161
let colorsAndModes= {
  \ 'i' : 39,
  \ 'v' : 82,
  \ 'V' : 226,
  \ '' : 208,
\}
let defaultAccentColorGui='#d7005f'
let colorsAndModesGui= {
  \ 'i' : '#00afff',
  \ 'v' : '#5fff00',
  \ 'V' : '#ffff00',
  \ '' : '#ff8700',
\}
function! ChangeAccentColor()
  let accentColor=get(g:colorsAndModes, mode(), g:defaultAccentColor)
  let accentColorGui=get(g:colorsAndModesGui, mode(), g:defaultAccentColorGui)
  execute 'hi User1 ctermfg=0 guifg=#000000 ctermbg=' . accentColor . ' guibg=' . accentColorGui
  execute 'hi User2 ctermbg=0 guibg=#2e3436 ctermfg=' . accentColor . ' guifg=' . accentColorGui
  execute 'hi User3 ctermfg=0 guifg=#000000 cterm=bold gui=bold ctermbg=' . accentColor . ' guibg=' . accentColorGui
  execute 'hi TabLineSel ctermfg=0 cterm=bold ctermbg=' . accentColor
  execute 'hi TabLine ctermbg=0 ctermfg=' . accentColor
  execute 'hi CursorLineNr ctermfg=' . accentColor . ' guifg=' . accentColorGui
  return ''
endfunction
function! ReadOnly()
  return (&readonly || !&modifiable) ? 'Read Only ' : ''
endfunction
function! Modified()
  return (&modified) ? 'Modified' : 'Not modified'
endfunction
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'VReplace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal',
\}
set statusline=
set statusline+=%{ChangeAccentColor()}
set statusline+=%1*\ ***%{toupper(g:currentmode[mode()])}***\  " Current mode
set statusline+=%2*\ %<%F\  " Filepath
set statusline+=%2*\ %= " To the right
set statusline+=%2*\ (%{&filetype}) " Filetype
set statusline+=%2*\ %{toupper((&fenc!=''?&fenc:&enc))}\[%{&ff}] " Encoding & Fileformat
set statusline+=%2*\ %{Modified()} " Modified Flags
set statusline+=%2*\ %{ReadOnly()} " ReadOnly Flags
set statusline+=%1*\ \%l/%L(%P)-%c\  " Position
" Speed up the redraw
au InsertLeave * call ChangeAccentColor()
au CursorHold * let &ro = &ro

"""" Color Scheme

"" Placed here for convenience.
"" Copied from sickill Monokai on Github,
"" and slightly modified.

set background=dark
highlight clear
syntax reset
set t_Co=256
hi Green ctermfg=34 ctermbg=NONE cterm=NONE guifg=#00af00 guibg=NONE gui=NONE
hi iGreen ctermfg=0 ctermbg=34 cterm=NONE guifg=#000000 guibg=#00af00 gui=NONE
hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE guifg=#90908a guibg=#3c3d37 gui=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=161 ctermbg=NONE cterm=NONE guifg=#d7005f guibg=NONE gui=NONE
hi Folded ctermfg=242 ctermbg=235 cterm=NONE guifg=#75715e guibg=#272822 gui=NONE
hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi Normal ctermfg=231 ctermbg=235 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#49483e guibg=#31322c gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Operator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreProc ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE
hi Statement ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold
hi Type ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyControl ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyException ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi TabLineFill cterm=bold ctermbg=0
" Final redraw
call ChangeAccentColor()





" Required for vundle
"filetype plugin indent on
filetype plugin on

" Highlighting
syntax on

set encoding=utf-8

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Disable mouse
set mouse=

" Colorscheme
if &t_Co == 256
    try
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Switch tabs
map 8 <Esc>:tabe
map 9 gT
map 0 gt

" Gundo toggle
map <F5> <Esc>:GundoToggle<CR>

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" sort the buffer removing duplicates
nmap <Leader>s :%!sort -u --version-sort<CR>

" Visual prompt for command completion
set wildmenu

" Write current file with sudo perms
"command! W w !sudo tee % > /dev/null
command! W w
command! -bang Qall qall

" folding
set nofoldenable

" Open word under cursor as ctag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if $VIMENV == 'talk'
  set background=light
  let g:solarized_termcolors=256
  colo solarized
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
else
  " Trans background
  hi Normal ctermbg=none
  hi NonText ctermbg=none
endif

if $VIMENV == 'prev'
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
  noremap <C-D> :call delete(expand('%')) <bar> argdelete % <bar> bdelete<CR>
  set noswapfile
endif

set nocompatible

" set the interactive flag so bash functions are sourced from ~/.bashrc etc
"set shellcmdflag=-ci











let g:SnazzyTransparent = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/bin/python3"
let g:ycm_python_binary_path = "/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>






" Theme
"colorscheme palenight

" Disable C-z from job-controlling neovim
nnoremap <c-z> <nop>

" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Syntax highlighting
syntax on

" Position in code
set number
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8

" Line wrap
set wrap

" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

" Function to trim extra whitespace in whole file
function! Trim()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

" auto + smart indent for code
set autoindent
set smartindent

set t_Co=256

" ASM == JDH8
augroup jdh8_ft
  au!
  autocmd BufNewFile,BufRead *.asm    set filetype=jdh8
augroup END

" SQL++ == SQL
augroup sqlpp_ft
  au!
  autocmd BufNewFile,BufRead *.sqlp   set syntax=sql
augroup END

" .S == gas
augroup gas_ft
  au!
  autocmd BufNewFile,BufRead *.S      set syntax=gas
augroup END

" JFlex syntax highlighting
 augroup jfft
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
 augroup END
 au Syntax jflex    so ~/.vim/syntax/jflex.vim

 " Mouse support
 set mouse=a

 " Map F8 to Tagbar
 nmap <F8> :TagbarToggle<CR>

 " CTags config
 let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

 " disable backup files
 set nobackup
 set nowritebackup

 " no delays!
 set updatetime=300

 set cmdheight=1
 set shortmess+=c

 set signcolumn=yes

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
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" add cocstatus into lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none

" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://fish<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Sizing Bug With Alacritty Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15
"set guifont=JetBrains\ Mono:h15

"let g:neovide_transparency=0.95

