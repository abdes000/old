"configuration
" ****************** Do not modify after this line ************************
if exists('loaded_scratch') || &cp
    finish
endif
let loaded_scratch=1

" Scratch buffer name
let ScratchBufferName = "__Scratch__"

" ScratchBufferOpen
" Open the scratch buffer
function! s:ScratchBufferOpen(new_win)
    let split_win = a:new_win

    " If the current buffer is modified then open the scratch buffer in a new
    " window
    if !split_win && &modified
        let split_win = 1
    endif

    " Check whether the scratch buffer is already created
    let scr_bufnum = bufnr(g:ScratchBufferName)
    if scr_bufnum == -1
        " open a new scratch buffer
        if split_win
            exe "new " . g:ScratchBufferName
        else
            exe "edit " . g:ScratchBufferName
        endif
    else
        " Scratch buffer is already created. Check whether it is open
        " in one of the windows
        let scr_winnum = bufwinnr(scr_bufnum)
        if scr_winnum != -1
            " Jump to the window which has the scratch buffer if we are not
            " already in that window
            if winnr() != scr_winnum
                exe scr_winnum . "wincmd w"
            endif
        else
            " Create a new scratch buffer
            if split_win
                exe "split +buffer" . scr_bufnum
            else
                exe "buffer " . scr_bufnum
            endif
        endif
    endif
endfunction

" ScratchMarkBuffer
" Mark a buffer as scratch
function! s:ScratchMarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction

autocmd BufNewFile __Scratch__ call s:ScratchMarkBuffer()

" Command to edit the scratch buffer in the current window
command! -nargs=0 Scratch call s:ScratchBufferOpen(0)
" Command to open the scratch buffer in a new split window
command! -nargs=0 Sscratch call s:ScratchBufferOpen(1)


set nocompatible   " Disable vi-compatibility
set t_Co=256
set guifont=menlo\ for\ powerline:h16
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
if exists("loaded_grep")
    finish
endif
let loaded_grep = 1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

" Location of the grep utility
if !exists("Grep_Path")
    let Grep_Path = 'grep'
endif

" Location of the fgrep utility
if !exists("Fgrep_Path")
    let Fgrep_Path = 'fgrep'
endif

" Location of the egrep utility
if !exists("Egrep_Path")
    let Egrep_Path = 'egrep'
endif

" Location of the agrep utility
if !exists("Agrep_Path")
    let Agrep_Path = 'agrep'
endif

" Location of the find utility
if !exists("Grep_Find_Path")
    let Grep_Find_Path = 'find'
endif

" Location of the xargs utility
if !exists("Grep_Xargs_Path")
    let Grep_Xargs_Path = 'xargs'
endif

" Open the Grep output window.  Set this variable to zero, to not open
" the Grep output window by default.  You can open it manually by using
" the :cwindow command.
if !exists("Grep_OpenQuickfixWindow")
    let Grep_OpenQuickfixWindow = 1
endif

" Default grep file list
if !exists("Grep_Default_Filelist")
    let Grep_Default_Filelist = '*'
endif

" Default grep options
if !exists("Grep_Default_Options")
    let Grep_Default_Options = ''
endif

" Use the 'xargs' utility in combination with the 'find' utility. Set this
" to zero to not use the xargs utility.
if !exists("Grep_Find_Use_Xargs")
    let Grep_Find_Use_Xargs = 1
endif

" The command-line arguments to supply to the xargs utility
if !exists('Grep_Xargs_Options')
    let Grep_Xargs_Options = '--null'
endif

" The find utility is from the cygwin package or some other find utility.
if !exists("Grep_Cygwin_Find")
    let Grep_Cygwin_Find = 0
endif

" NULL device name to supply to grep.  We need this because, grep will not
" print the name of the file, if only one filename is supplied. We need the
" filename for Vim quickfix processing.
if !exists("Grep_Null_Device")
    if has("win32") || has("win16") || has("win95")
        let Grep_Null_Device = 'NUL'
    else
        let Grep_Null_Device = '/dev/null'
    endif
endif

" Character to use to quote patterns and filenames before passing to grep.
if !exists("Grep_Shell_Quote_Char")
    if has("win32") || has("win16") || has("win95")
        let Grep_Shell_Quote_Char = ''
    else
        let Grep_Shell_Quote_Char = "'"
    endif
endif

" Character to use to escape special characters before passing to grep.
if !exists("Grep_Shell_Escape_Char")
    if has("win32") || has("win16") || has("win95")
        let Grep_Shell_Escape_Char = ''
    else
        let Grep_Shell_Escape_Char = '\'
    endif
endif

" The list of directories to skip while searching for a pattern. Set this
" variable to '', if you don't want to skip directories.
if !exists("Grep_Skip_Dirs")
    let Grep_Skip_Dirs = 'RCS CVS SCCS'
endif

" The list of files to skip while searching for a pattern. Set this variable
" to '', if you don't want to skip any files.
if !exists("Grep_Skip_Files")
    let Grep_Skip_Files = '*~ *,v s.*'
endif

" RunGrepCmd()
" Run the specified grep command using the supplied pattern
function! s:RunGrepCmd(cmd, pattern, action)
    let cmd_output = system(a:cmd)

    if cmd_output == ""
        echohl WarningMsg | 
        \ echomsg "Error: Pattern " . a:pattern . " not found" | 
        \ echohl None
        return
    endif

    let tmpfile = tempname()

    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    silent echon '[Search results for pattern: ' . a:pattern . "]\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose

    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m

    if v:version >= 700 && a:action == 'add'
        execute "silent! caddfile " . tmpfile
    else
        if exists(":cgetfile")
            execute "silent! cgetfile " . tmpfile
        else
            execute "silent! cfile " . tmpfile
        endif
    endif

    let &efm = old_efm

    " Open the grep output window
    if g:Grep_OpenQuickfixWindow == 1
        " Open the quickfix window below the current window
        botright copen
    endif

    call delete(tmpfile)
endfunction

" RunGrepRecursive()
" Run specified grep command recursively
function! s:RunGrepRecursive(cmd_name, grep_cmd, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern> " .
                        \ "[<file_name(s)>]]"
        return
    endif

    let grep_opt    = ""
    let pattern     = ""
    let filepattern = ""

    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^-'
            let grep_opt = grep_opt . " " . a:{argcnt}
        elseif pattern == ""
            let pattern = g:Grep_Shell_Quote_Char . a:{argcnt} . 
                            \ g:Grep_Shell_Quote_Char
        else
            let filepattern = filepattern . " " . a:{argcnt}
        endif
        let argcnt= argcnt + 1
    endwhile
    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    if a:grep_cmd != 'agrep'
        " Don't display messages about non-existent files
        " Agrep doesn't support the -s option
        let grep_opt = grep_opt . " -s"
    endif

    if a:grep_cmd == 'grep'
        let grep_path = g:Grep_Path
        let grep_expr_option = '--'
    elseif a:grep_cmd == 'fgrep'
        let grep_path = g:Fgrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'egrep'
        let grep_path = g:Egrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'agrep'
        let grep_path = g:Agrep_Path
        let grep_expr_option = ''
    else
        return
    endif

    " No argument supplied. Get the identifier and file list from user
    if pattern == "" 
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
        let pattern = g:Grep_Shell_Quote_Char . pattern . 
                        \ g:Grep_Shell_Quote_Char
    endif

    let cwd = getcwd()
    if g:Grep_Cygwin_Find == 1
        let cwd = substitute(cwd, "\\", "/", "g")
    endif
    if v:version >= 700
        let startdir = input("Start searching from directory: ", cwd, "dir")
    else
        let startdir = input("Start searching from directory: ", cwd)
    endif
    if startdir == ""
        return
    endif

    if filepattern == ""
        let filepattern = input("Search in files matching pattern: ", 
                                          \ g:Grep_Default_Filelist)
        if filepattern == ""
            return
        endif
    endif

    let txt = filepattern . ' '
    let find_file_pattern = ''
    while txt != ''
        let one_pattern = strpart(txt, 0, stridx(txt, ' '))
        if find_file_pattern != ''
            let find_file_pattern = find_file_pattern . ' -o'
        endif
        let find_file_pattern = find_file_pattern . ' -name ' .
              \ g:Grep_Shell_Quote_Char . one_pattern . g:Grep_Shell_Quote_Char
        let txt = strpart(txt, stridx(txt, ' ') + 1)
    endwhile
    let find_file_pattern = g:Grep_Shell_Escape_Char . '(' .
                    \ find_file_pattern . ' ' . g:Grep_Shell_Escape_Char . ')'

    let txt = g:Grep_Skip_Dirs
    let find_prune = ''
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_dir = strpart(txt, 0, stridx(txt, ' '))
            if find_prune != ''
                let find_prune = find_prune . ' -o'
            endif
            let find_prune = find_prune . ' -name ' . one_dir
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
        let find_prune = '-type d ' . g:Grep_Shell_Escape_Char . '(' .
                         \ find_prune
        let find_prune = find_prune . ' ' . g:Grep_Shell_Escape_Char . ')'
    endif

    let txt = g:Grep_Skip_Files
    let find_skip_files = '-type f'
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_file = strpart(txt, 0, stridx(txt, ' '))
            let find_skip_files = find_skip_files . ' ! -name ' .
                                  \ g:Grep_Shell_Quote_Char . one_file .
                                  \ g:Grep_Shell_Quote_Char
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif

    if g:Grep_Find_Use_Xargs == 1
        let cmd = g:Grep_Find_Path . " " . startdir
        let cmd = cmd . " " . find_prune . " -prune -o"
        let cmd = cmd . " " . find_skip_files
        let cmd = cmd . " " . find_file_pattern
        let cmd = cmd . " -print0 | "
        let cmd = cmd . g:Grep_Xargs_Path . ' ' . g:Grep_Xargs_Options
        let cmd = cmd . ' ' . grep_path . " " . grep_opt . " -n "
        let cmd = cmd . grep_expr_option . " " . pattern
        let cmd = cmd . ' ' . g:Grep_Null_Device 
    else
        let cmd = g:Grep_Find_Path . " " . startdir
        let cmd = cmd . " " . find_prune . " -prune -o"
        let cmd = cmd . " " . find_skip_files
        let cmd = cmd . " " . find_file_pattern
        let cmd = cmd . " -exec " . grep_path . " " . grep_opt . " -n "
        let cmd = cmd . grep_expr_option . " " . pattern
        let cmd = cmd . " {} " . g:Grep_Null_Device . ' ' .
                         \ g:Grep_Shell_Escape_Char . ';'
    endif

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" RunGrepSpecial()
" Search for a pattern in all the opened buffers or filenames in the
" argument list
function! s:RunGrepSpecial(cmd_name, which, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern>]"
        return
    endif

    " Search in all the Vim buffers
    if a:which == 'buffer'
        " Get a list of all the buffer names
        let last_bufno = bufnr("$")

        let i = 1
        let filenames = ""

        while i <= last_bufno
            if bufexists(i) && buflisted(i)
                let filenames = filenames . " " . bufname(i)
            endif
            let i = i + 1
        endwhile

        " No buffers
        if filenames == ""
            return
        endif
    elseif a:which == 'args'
        " Search in all the filenames in the argument list
        let arg_cnt = argc()

        if arg_cnt == 0
            echohl WarningMsg
            echomsg "Error: Argument list is empty"
            echohl None
            return
        endif

        let i = 0
        let filenames = ""

        while i < arg_cnt
            let filenames = filenames . " " . argv(i)
            let i = i + 1
        endwhile

        " No arguments
        if filenames == ""
            echohl WarningMsg
            echomsg "Error: Argument list is empty"
            echohl None
            return
        endif
    endif

    let grep_opt = ""
    let pattern = ""

    " Get the list of optional grep command-line options (if present)
    " supplied by the user. All the grep options will be preceded
    " by a '-'
    let argcnt= 1
    while argcnt <= a:0 && a:{argcnt} =~ '^-'
        let grep_opt = grep_opt . " " . a:{argcnt}
        let argcnt = argcnt + 1
    endwhile

    " If the user didn't specify the option, then use the defaults
    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    " Don't display messages about non-existent files
    let grep_opt = grep_opt . " -s"

    " The last argument specified by the user is the pattern
    if argcnt == a:0
        let pattern = a:{argcnt}
    else
        " No argument supplied. Get the identifier and file list from user
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
    endif

    let pattern = g:Grep_Shell_Quote_Char . pattern . g:Grep_Shell_Quote_Char

    " Add /dev/null to the list of filenames, so that grep print the
    " filename and linenumber when grepping in a single file
    let filenames = filenames . " " . g:Grep_Null_Device
    let cmd = g:Grep_Path . " " . grep_opt . " -n -- "
    let cmd = cmd . pattern . " " . filenames

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" RunGrep()
" Run the specified grep command
function! s:RunGrep(cmd_name, grep_cmd, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern> " .
                        \ "[<file_name(s)>]]"
        return
    endif

    let grep_opt  = ""
    let pattern   = ""
    let filenames = ""

    " Parse the arguments
    " grep command-line flags are specified using the "-flag" format
    " the next argument is assumed to be the pattern
    " and the next arguments are assumed to be filenames or file patterns
    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^-'
            let grep_opt = grep_opt . " " . a:{argcnt}
        elseif pattern == ""
            let pattern = g:Grep_Shell_Quote_Char . a:{argcnt} .
                            \ g:Grep_Shell_Quote_Char
        else
            let filenames= filenames . " " . a:{argcnt}
        endif
        let argcnt = argcnt + 1
    endwhile

    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    if a:grep_cmd != 'agrep'
        " Don't display messages about non-existent files
        " Agrep doesn't support the -s option
        let grep_opt = grep_opt . " -s"
    endif

    if a:grep_cmd == 'grep'
        let grep_path = g:Grep_Path
        let grep_expr_option = '--'
    elseif a:grep_cmd == 'fgrep'
        let grep_path = g:Fgrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'egrep'
        let grep_path = g:Egrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'agrep'
        let grep_path = g:Agrep_Path
        let grep_expr_option = ''
    else
        return
    endif

    " Get the identifier and file list from user
    if pattern == "" 
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
        let pattern = g:Grep_Shell_Quote_Char . pattern .
                        \ g:Grep_Shell_Quote_Char
    endif

    if filenames == ""
        if v:version >= 700
            let filenames = input("Search in files: ", g:Grep_Default_Filelist,
                        \ "file")
        else
            let filenames = input("Search in files: ", g:Grep_Default_Filelist)
        endif
        if filenames == ""
            return
        endif
    endif

    " Add /dev/null to the list of filenames, so that grep print the
    " filename and linenumber when grepping in a single file
    let filenames = filenames . " " . g:Grep_Null_Device
    let cmd = grep_path . " " . grep_opt . " -n "
    let cmd = cmd . grep_expr_option . " " . pattern
    let cmd = cmd . " " . filenames

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" Define the set of grep commands
command! -nargs=* -complete=file Grep
            \ call s:RunGrep('Grep', 'grep', 'set', <f-args>)
command! -nargs=* -complete=file Rgrep
            \ call s:RunGrepRecursive('Rgrep', 'grep', 'set', <f-args>)
command! -nargs=* GrepBuffer
            \ call s:RunGrepSpecial('GrepBuffer', 'buffer', 'set', <f-args>)
command! -nargs=* Bgrep
            \ call s:RunGrepSpecial('Bgrep', 'buffer', 'set', <f-args>)
command! -nargs=* GrepArgs
            \ call s:RunGrepSpecial('GrepArgs', 'args', 'set', <f-args>)

command! -nargs=* -complete=file Fgrep
            \ call s:RunGrep('Fgrep', 'fgrep', 'set', <f-args>)
command! -nargs=* -complete=file Rfgrep
            \ call s:RunGrepRecursive('Rfgrep', 'fgrep', 'set', <f-args>)
command! -nargs=* -complete=file Egrep
            \ call s:RunGrep('Egrep', 'egrep', 'set', <f-args>)
command! -nargs=* -complete=file Regrep
            \ call s:RunGrepRecursive('Regrep', 'egrep', 'set', <f-args>)
command! -nargs=* -complete=file Agrep
            \ call s:RunGrep('Agrep', 'agrep', 'set', <f-args>)
command! -nargs=* -complete=file Ragrep
            \ call s:RunGrepRecursive('Ragrep', 'agrep', 'set', <f-args>)

if v:version >= 700
command! -nargs=* -complete=file GrepAdd
            \ call s:RunGrep('GrepAdd', 'grep', 'add', <f-args>)
command! -nargs=* -complete=file RgrepAdd
            \ call s:RunGrepRecursive('RgrepAdd', 'grep', 'add', <f-args>)
command! -nargs=* GrepBufferAdd
            \ call s:RunGrepSpecial('GrepBufferAdd', 'buffer', 'add', <f-args>)
command! -nargs=* BgrepAdd
            \ call s:RunGrepSpecial('BgrepAdd', 'buffer', 'add', <f-args>)
command! -nargs=* GrepArgsAdd
            \ call s:RunGrepSpecial('GrepArgsAdd', 'args', 'add', <f-args>)

command! -nargs=* -complete=file FgrepAdd
            \ call s:RunGrep('FgrepAdd', 'fgrep', 'add', <f-args>)
command! -nargs=* -complete=file RfgrepAdd
            \ call s:RunGrepRecursive('RfgrepAdd', 'fgrep', 'add', <f-args>)
command! -nargs=* -complete=file EgrepAdd
            \ call s:RunGrep('EgrepAdd', 'egrep', 'add', <f-args>)
command! -nargs=* -complete=file RegrepAdd
            \ call s:RunGrepRecursive('RegrepAdd', 'egrep', 'add', <f-args>)
command! -nargs=* -complete=file AgrepAdd
            \ call s:RunGrep('AgrepAdd', 'agrep', 'add', <f-args>)
command! -nargs=* -complete=file RagrepAdd
            \ call s:RunGrepRecursive('RagrepAdd', 'agrep', 'add', <f-args>)
endif

" Add the Tools->Search Files menu
if has('gui_running')
    anoremenu <silent> Tools.Search.Current\ Directory<Tab>:Grep
                \ :Grep<CR>
    anoremenu <silent> Tools.Search.Recursively<Tab>:Rgrep
                \ :Rgrep<CR>
    anoremenu <silent> Tools.Search.Buffer\ List<Tab>:Bgrep
                \ :Bgrep<CR>
    anoremenu <silent> Tools.Search.Argument\ List<Tab>:GrepArgs
                \ :GrepArgs<CR>
endif

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . substitute(a:text, "'", "'\\\\''", 'g') . "'")
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    let g:screen_sessionname = ""
    let g:screen_windowname = "0"
  end

  let g:screen_sessionname = input("session name: ", "", "custom,Screen_Session_Names")
  let g:screen_windowname = input("window name: ", g:screen_windowname)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-c><C-c> "ry :call Send_to_Screen(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

nmap <C-c>v :call Screen_Vars()<CR>

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<C-U>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction

if exists('g:ConqueTerm_Loaded') || v:version < 700
    finish
endif

" **********************************************************************************************************
" **** DEFAULT CONFIGURATION *******************************************************************************
" **********************************************************************************************************

" DO NOT EDIT CONFIGURATION SETTINGS IN THIS FILE!
" Define these variables in your local .vimrc to over-ride the default values

" {{{

" Fast mode {{{
" Disables all features which could cause Conque to run slowly, including:
"   * Disables terminal colors
"   * Disables some multi-byte character handling
if !exists('g:ConqueTerm_FastMode')
    let g:ConqueTerm_FastMode = 0
endif " }}}

" automatically go into insert mode when entering buffer {{{
if !exists('g:ConqueTerm_InsertOnEnter')
    let g:ConqueTerm_InsertOnEnter = 0
endif " }}}

" Allow user to use <C-w> keys to switch window in insert mode. {{{
if !exists('g:ConqueTerm_CWInsert')
    let g:ConqueTerm_CWInsert = 0
endif " }}}

" Choose key mapping to leave insert mode {{{
" If you choose something other than '<Esc>', then <Esc> will be sent to terminal
" Using a different key will usually fix Alt/Meta key issues
if !exists('g:ConqueTerm_EscKey')
    let g:ConqueTerm_EscKey = '<Esc>'
endif " }}}

" Use this key to execute the current file in a split window. {{{
" THIS IS A GLOBAL KEY MAPPING
if !exists('g:ConqueTerm_ExecFileKey')
    let g:ConqueTerm_ExecFileKey = '<F11>'
endif " }}}

" Use this key to send the current file contents to conque. {{{
" THIS IS A GLOBAL KEY MAPPING
if !exists('g:ConqueTerm_SendFileKey')
    let g:ConqueTerm_SendFileKey = '<F10>'
endif " }}}

" Use this key to send selected text to conque. {{{
" THIS IS A GLOBAL KEY MAPPING
if !exists('g:ConqueTerm_SendVisKey')
    let g:ConqueTerm_SendVisKey = '<F9>'
endif " }}}

" Use this key to toggle terminal key mappings. {{{
" Only mapped inside of Conque buffers.
if !exists('g:ConqueTerm_ToggleKey')
    let g:ConqueTerm_ToggleKey = '<F8>'
endif " }}}

" Enable color. {{{
" If your apps use a lot of color it will slow down the shell.
" 0 - no terminal colors. You still will see Vim syntax highlighting.
" 1 - limited terminal colors (recommended). Past terminal color history cleared regularly.
" 2 - all terminal colors. Terminal color history never cleared.
if !exists('g:ConqueTerm_Color')
    let g:ConqueTerm_Color = 1
endif " }}}

" Color mode. Windows ONLY {{{
" Set this variable to 'conceal' to use Vim's conceal mode for terminal colors.
" This makes colors render much faster, but has some odd baggage.
if !exists('g:ConqueTerm_ColorMode')
    let g:ConqueTerm_ColorMode = ''
endif " }}}

" TERM environment setting {{{
if !exists('g:ConqueTerm_TERM')
    let g:ConqueTerm_TERM =  'vt100'
endif " }}}

" Syntax for your buffer {{{
if !exists('g:ConqueTerm_Syntax')
    let g:ConqueTerm_Syntax = 'conque_term'
endif " }}}

" Keep on updating the shell window after you've switched to another buffer {{{
if !exists('g:ConqueTerm_ReadUnfocused')
    let g:ConqueTerm_ReadUnfocused = 0
endif " }}}

" Use this regular expression to highlight prompt {{{
if !exists('g:ConqueTerm_PromptRegex')
    let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
endif " }}}

" Choose which Python version to attempt to load first {{{
" Valid values are 2, 3 or 0 (no preference)
if !exists('g:ConqueTerm_PyVersion')
    let g:ConqueTerm_PyVersion = 2
endif " }}}

" Path to python.exe. (Windows only) {{{
" By default, Conque will check C:\PythonNN\python.exe then will search system path
" If you have installed Python in an unusual location and it's not in your path, fill in the full path below
" E.g. 'C:\Program Files\Python\Python27\python.exe'
if !exists('g:ConqueTerm_PyExe')
    let g:ConqueTerm_PyExe = ''
endif " }}}

" Automatically close buffer when program exits {{{
if !exists('g:ConqueTerm_CloseOnEnd')
    let g:ConqueTerm_CloseOnEnd = 0
endif " }}}

" Send function key presses to terminal {{{
if !exists('g:ConqueTerm_SendFunctionKeys')
    let g:ConqueTerm_SendFunctionKeys = 0
endif " }}}

" Session support {{{
if !exists('g:ConqueTerm_SessionSupport')
    let g:ConqueTerm_SessionSupport = 0
endif " }}}

" hide Conque startup messages {{{
" messages should only appear the first 3 times you start Vim with a new version of Conque
" and include important Conque feature and option descriptions
" TODO - disabled and unused for now
if !exists('g:ConqueTerm_StartMessages')
    let g:ConqueTerm_StartMessages = 1
endif " }}}

" Windows character code page {{{
" Leave at 0 to use current environment code page.
" Use 65001 for utf-8, although many console apps do not support it.
if !exists('g:ConqueTerm_CodePage')
    let g:ConqueTerm_CodePage = 0
endif " }}}

" InsertCharPre support {{{
" Disable this feature by default, still in Beta
if !exists('g:ConqueTerm_InsertCharPre')
    let g:ConqueTerm_InsertCharPre = 0
endif " }}}

" }}}

" **********************************************************************************************************
" **** Startup *********************************************************************************************
" **********************************************************************************************************

" Startup {{{

let g:ConqueTerm_Loaded = 1
let g:ConqueTerm_Idx = 0
let g:ConqueTerm_Version = 230

command! -nargs=+ -complete=shellcmd ConqueTerm call conque_term#open(<q-args>)
command! -nargs=+ -complete=shellcmd ConqueTermSplit call conque_term#open(<q-args>, ['belowright split'])
command! -nargs=+ -complete=shellcmd ConqueTermVSplit call conque_term#open(<q-args>, ['belowright vsplit'])
command! -nargs=+ -complete=shellcmd ConqueTermTab call conque_term#open(<q-args>, ['tabnew'])

" }}}

" **********************************************************************************************************
" **** Global Mappings & Autocommands **********************************************************************
" **********************************************************************************************************

" Startup {{{

if exists('g:ConqueTerm_SessionSupport') && g:ConqueTerm_SessionSupport == 1
    autocmd SessionLoadPost * call conque_term#resume_session()
endif

if maparg(g:ConqueTerm_ExecFileKey, 'n') == ''
    exe 'nnoremap <silent> ' . g:ConqueTerm_ExecFileKey . ' :call conque_term#exec_file()<CR>'
endif

" }}}

" vim:foldmethod=marker

if exists("loaded_alternateFile")
    finish
endif
if (v:progname == "ex")
   finish
endif
let loaded_alternateFile = 1

let alternateExtensionsDict = {}

" setup the default set of alternate extensions. The user can override in thier
" .vimrc if the defaults are not suitable. To override in a .vimrc simply set a
" g:alternateExtensions_<EXT> variable to a comma separated list of alternates,
" where <EXT> is the extension to map.
" E.g. let g:alternateExtensions_CPP = "inc,h,H,HPP,hpp"
"      let g:alternateExtensions_{'aspx.cs'} = "aspx"


" This variable will be increased when an extension with greater number of dots
" is added by the AddAlternateExtensionMapping call.
let s:maxDotsInExtension = 1

" Function : AddAlternateExtensionMapping (PRIVATE)
" Purpose  : simple helper function to add the default alternate extension
"            mappings.
" Args     : extension -- the extension to map
"            alternates -- comma separated list of alternates extensions
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
function! <SID>AddAlternateExtensionMapping(extension, alternates)
   " This code does not actually work for variables like foo{'a.b.c.d.e'}
   "let varName = "g:alternateExtensions_" . a:extension
   "if (!exists(varName))
   "   let g:alternateExtensions_{a:extension} = a:alternates
   "endif

   " This code handles extensions which contains a dot. exists() fails with
   " such names.
   "let v:errmsg = ""
   " FIXME this line causes ex to return 1 instead of 0 for some reason??
   "silent! echo g:alternateExtensions_{a:extension}
   "if (v:errmsg != "")
      "let g:alternateExtensions_{a:extension} = a:alternates
   "endif

   let g:alternateExtensionsDict[a:extension] = a:alternates
   let dotsNumber = strlen(substitute(a:extension, "[^.]", "", "g"))
   if s:maxDotsInExtension < dotsNumber
     let s:maxDotsInExtension = dotsNumber
   endif
endfunction


" Add all the default extensions
" Mappings for C and C++
call <SID>AddAlternateExtensionMapping('h',"c,cpp,cxx,cc,CC")
call <SID>AddAlternateExtensionMapping('H',"C,CPP,CXX,CC")
call <SID>AddAlternateExtensionMapping('hpp',"cpp,c")
call <SID>AddAlternateExtensionMapping('HPP',"CPP,C")
call <SID>AddAlternateExtensionMapping('c',"h")
call <SID>AddAlternateExtensionMapping('C',"H")
call <SID>AddAlternateExtensionMapping('cpp',"h,hpp")
call <SID>AddAlternateExtensionMapping('CPP',"H,HPP")
call <SID>AddAlternateExtensionMapping('cc',"h")
call <SID>AddAlternateExtensionMapping('CC',"H,h")
call <SID>AddAlternateExtensionMapping('cxx',"h")
call <SID>AddAlternateExtensionMapping('CXX',"H")
" Mappings for PSL7
call <SID>AddAlternateExtensionMapping('psl',"ph")
call <SID>AddAlternateExtensionMapping('ph',"psl")
" Mappings for ADA
call <SID>AddAlternateExtensionMapping('adb',"ads")
call <SID>AddAlternateExtensionMapping('ads',"adb")
" Mappings for lex and yacc files
call <SID>AddAlternateExtensionMapping('l',"y,yacc,ypp")
call <SID>AddAlternateExtensionMapping('lex',"yacc,y,ypp")
call <SID>AddAlternateExtensionMapping('lpp',"ypp,y,yacc")
call <SID>AddAlternateExtensionMapping('y',"l,lex,lpp")
call <SID>AddAlternateExtensionMapping('yacc',"lex,l,lpp")
call <SID>AddAlternateExtensionMapping('ypp',"lpp,l,lex")
" Mappings for OCaml
call <SID>AddAlternateExtensionMapping('ml',"mli")
call <SID>AddAlternateExtensionMapping('mli',"ml")
" ASP stuff
call <SID>AddAlternateExtensionMapping('aspx.cs', 'aspx')
call <SID>AddAlternateExtensionMapping('aspx.vb', 'aspx')
call <SID>AddAlternateExtensionMapping('aspx', 'aspx.cs,aspx.vb')

" Setup default search path, unless the user has specified
" a path in their [._]vimrc. 
if (!exists('g:alternateSearchPath'))
  let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
endif

" If this variable is true then a.vim will not alternate to a file/buffer which
" does not exist. E.g while editing a.c and the :A will not swtich to a.h
" unless it exists.
if (!exists('g:alternateNoDefaultAlternate'))
   " by default a.vim will alternate to a file which does not exist
   let g:alternateNoDefaultAlternate = 0
endif

" If this variable is true then a.vim will convert the alternate filename to a
" filename relative to the current working directory.
" Feature by Nathan Huizinga
if (!exists('g:alternateRelativeFiles'))                                        
   " by default a.vim will not convert the filename to one relative to the
   " current working directory
   let g:alternateRelativeFiles = 0
endif


" Function : GetNthItemFromList (PRIVATE)
" Purpose  : Support reading items from a comma seperated list
"            Used to iterate all the extensions in an extension spec
"            Used to iterate all path prefixes
" Args     : list -- the list (extension spec, file paths) to iterate
"            n -- the extension to get
" Returns  : the nth item (extension, path) from the list (extension 
"            spec), or "" for failure
" Author   : Michael Sharpe <feline@irendi.com>
" History  : Renamed from GetNthExtensionFromSpec to GetNthItemFromList
"            to reflect a more generic use of this function. -- Bindu
function! <SID>GetNthItemFromList(list, n) 
   let itemStart = 0
   let itemEnd = -1
   let pos = 0
   let item = ""
   let i = 0
   while (i != a:n)
      let itemStart = itemEnd + 1
      let itemEnd = match(a:list, ",", itemStart)
      let i = i + 1
      if (itemEnd == -1)
         if (i == a:n)
            let itemEnd = strlen(a:list)
         endif
         break
      endif
   endwhile 
   if (itemEnd != -1) 
      let item = strpart(a:list, itemStart, itemEnd - itemStart)
   endif
   return item 
endfunction

" Function : ExpandAlternatePath (PRIVATE)
" Purpose  : Expand path info.  A path with a prefix of "wdr:" will be 
"            treated as relative to the working directory (i.e. the 
"            directory where vim was started.) A path prefix of "abs:" will 
"            be treated as absolute. No prefix or "sfr:" will result in the 
"            path being treated as relative to the source file (see sfPath 
"            argument). 
"
"            A prefix of "reg:" will treat the pathSpec as a regular
"            expression substitution that is applied to the source file 
"            path. The format is:
"
"              reg:<sep><pattern><sep><subst><sep><flag><sep>
"          
"            <sep> seperator character, we often use one of [/|%#] 
"            <pattern> is what you are looking for
"            <subst> is the output pattern
"            <flag> can be g for global replace or empty
"
"            EXAMPLE: 'reg:/inc/src/g/' will replace every instance 
"            of 'inc' with 'src' in the source file path. It is possible
"            to use match variables so you could do something like:
"            'reg:|src/\([^/]*\)|inc/\1||' (see 'help :substitute', 
"            'help pattern' and 'help sub-replace-special' for more details
"
"            NOTE: a.vim uses ',' (comma) internally so DON'T use it
"            in your regular expressions or other pathSpecs unless you update 
"            the rest of the a.vim code to use some other seperator.
"
" Args     : pathSpec -- path component (or substitution patterns)
"            sfPath -- source file path
" Returns  : a path that can be used by AlternateFile()
" Author   : Bindu Wavell <bindu@wavell.net>
function! <SID>ExpandAlternatePath(pathSpec, sfPath) 
   let prfx = strpart(a:pathSpec, 0, 4)
   if (prfx == "wdr:" || prfx == "abs:")
      let path = strpart(a:pathSpec, 4)
   elseif (prfx == "reg:")
      let re = strpart(a:pathSpec, 4)
      let sep = strpart(re, 0, 1)
      let patend = match(re, sep, 1)
      let pat = strpart(re, 1, patend - 1)
      let subend = match(re, sep, patend + 1)
      let sub = strpart(re, patend+1, subend - patend - 1)
      let flag = strpart(re, strlen(re) - 2)
      if (flag == sep)
        let flag = ''
      endif
      let path = substitute(a:sfPath, pat, sub, flag)
      "call confirm('PAT: [' . pat . '] SUB: [' . sub . ']')
      "call confirm(a:sfPath . ' => ' . path)
   else
      let path = a:pathSpec
      if (prfx == "sfr:")
         let path = strpart(path, 4)
      endif
      let path = a:sfPath . "/" . path
   endif
   return path
endfunction

" Function : FindFileInSearchPath (PRIVATE)
" Purpose  : Searches for a file in the search path list
" Args     : filename -- name of the file to search for
"            pathList -- the path list to search
"            relPathBase -- the path which relative paths are expanded from
" Returns  : An expanded filename if found, the empty string otherwise
" Author   : Michael Sharpe (feline@irendi.com)
" History  : inline code written by Bindu Wavell originally
function! <SID>FindFileInSearchPath(fileName, pathList, relPathBase)
   let filepath = ""
   let m = 1
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            let fullname = path . "/" . a:fileName
            let foundMatch = <SID>BufferOrFileExists(fullname)
            if (foundMatch)
               let filepath = fullname
               break
            endif
         else
            break
         endif
         let m = m + 1
      endwhile
   endif
   return filepath
endfunction

" Function : FindFileInSearchPathEx (PRIVATE)
" Purpose  : Searches for a file in the search path list
" Args     : filename -- name of the file to search for
"            pathList -- the path list to search
"            relPathBase -- the path which relative paths are expanded from
"            count -- find the count'th occurence of the file on the path
" Returns  : An expanded filename if found, the empty string otherwise
" Author   : Michael Sharpe (feline@irendi.com)
" History  : Based on <SID>FindFileInSearchPath() but with extensions
function! <SID>FindFileInSearchPathEx(fileName, pathList, relPathBase, count)
   let filepath = ""
   let m = 1
   let spath = ""
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            if (spath != "")
               let spath = spath . ','
            endif
            let spath = spath . path
         else
            break
         endif
         let m = m + 1
      endwhile
   endif

   if (&path != "")
      if (spath != "")
         let spath = spath . ','
      endif
      let spath = spath . &path
   endif

   let filepath = findfile(a:fileName, spath, a:count)
   return filepath
endfunction

" Function : EnumerateFilesByExtension (PRIVATE)
" Purpose  : enumerates all files by a particular list of alternate extensions.
" Args     : path -- path of a file (not including the file)
"            baseName -- base name of the file to be expanded
"            extension -- extension whose alternates are to be enumerated
" Returns  : comma separated list of files with extensions
" Author   : Michael Sharpe <feline@irendi.com>
function! EnumerateFilesByExtension(path, baseName, extension)
   let enumeration = ""
   let extSpec = ""
   let v:errmsg = ""
   silent! echo g:alternateExtensions_{a:extension}
   if (v:errmsg == "")
      let extSpec = g:alternateExtensions_{a:extension}
   endif
   if (extSpec == "")
      if (has_key(g:alternateExtensionsDict, a:extension))
         let extSpec = g:alternateExtensionsDict[a:extension]
      endif
   endif
   if (extSpec != "") 
      let n = 1
      let done = 0
      while (!done)
         let ext = <SID>GetNthItemFromList(extSpec, n)
         if (ext != "")
            if (a:path != "")
               let newFilename = a:path . "/" . a:baseName . "." . ext
            else
               let newFilename =  a:baseName . "." . ext
            endif
            if (enumeration == "")
               let enumeration = newFilename
            else
               let enumeration = enumeration . "," . newFilename
            endif
         else
            let done = 1
         endif
         let n = n + 1
      endwhile
   endif
   return enumeration
endfunction

" Function : EnumerateFilesByExtensionInPath (PRIVATE)
" Purpose  : enumerates all files by expanding the path list and the extension
"            list.
" Args     : baseName -- base name of the file
"            extension -- extension whose alternates are to be enumerated
"            pathList -- the list of paths to enumerate
"            relPath -- the path of the current file for expansion of relative
"                       paths in the path list.
" Returns  : A comma separated list of paths with extensions
" Author   : Michael Sharpe <feline@irendi.com>
function! EnumerateFilesByExtensionInPath(baseName, extension, pathList, relPathBase)
   let enumeration = ""
   let filepath = ""
   let m = 1
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            let pe = EnumerateFilesByExtension(path, a:baseName, a:extension)
            if (enumeration == "")
               let enumeration = pe
            else
               let enumeration = enumeration . "," . pe
            endif
         else
            break
         endif
         let m = m + 1
      endwhile
   endif
   return enumeration
endfunction

" Function : DetermineExtension (PRIVATE)
" Purpose  : Determines the extension of a filename based on the register
"            alternate extension. This allow extension which contain dots to 
"            be considered. E.g. foo.aspx.cs to foo.aspx where an alternate
"            exists for the aspx.cs extension. Note that this will only accept
"            extensions which contain less than 5 dots. This is only
"            implemented in this manner for simplicity...it is doubtful that 
"            this will be a restriction in non-contrived situations.
" Args     : The path to the file to find the extension in
" Returns  : The matched extension if any
" Author   : Michael Sharpe (feline@irendi.com)
" History  : idea from Tom-Erik Duestad
" Notes    : there is some magic occuring here. The exists() function does not
"            work well when the curly brace variable has dots in it. And why
"            should it, dots are not valid in variable names. But the exists
"            function is wierd too. Lets say foo_c does exist. Then
"            exists("foo_c.e.f") will be true...even though the variable does 
"            not exist. However the curly brace variables do work when the
"            variable has dots in it. E.g foo_{'c'} is different from 
"            foo_{'c.d.e'}...and foo_{'c'} is identical to foo_c and
"            foo_{'c.d.e'} is identical to foo_c.d.e right? Yes in the current
"            implementation of vim. To trick vim to test for existence of such
"            variables echo the curly brace variable and look for an error 
"            message.
function! DetermineExtension(path) 
  let mods = ":t"
  let i = 0
  while i <= s:maxDotsInExtension
    let mods = mods . ":e"
    let extension = fnamemodify(a:path, mods)
    if (has_key(g:alternateExtensionsDict, extension))
       return extension
    endif
    let v:errmsg = ""
    silent! echo g:alternateExtensions_{extension}
    if (v:errmsg == "")
      return extension
    endif
    let i = i + 1
  endwhile
  return ""
endfunction

" Function : AlternateFile (PUBLIC)
" Purpose  : Opens a new buffer by looking at the extension of the current
"            buffer and finding the corresponding file. E.g. foo.c <--> foo.h
" Args     : accepts one argument. If present it used the argument as the new
"            extension.
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
" History  : + When an alternate can't be found in the same directory as the
"              source file, a search path will be traversed looking for the
"              alternates.
"            + Moved some code into a separate function, minor optimization
"            + rework to favor files in memory based on complete enumeration of
"              all files extensions and paths
function! AlternateFile(splitWindow, ...)
  let extension   = DetermineExtension(expand("%:p"))
  let baseName    = substitute(expand("%:t"), "\." . extension . '$', "", "")
  let currentPath = expand("%:p:h")

  if (a:0 != 0)
     let newFullname = currentPath . "/" .  baseName . "." . a:1
     call <SID>FindOrCreateBuffer(newFullname, a:splitWindow, 0)
  else
     let allfiles = ""
     if (extension != "")
        let allfiles1 = EnumerateFilesByExtension(currentPath, baseName, extension)
        let allfiles2 = EnumerateFilesByExtensionInPath(baseName, extension, g:alternateSearchPath, currentPath)

        if (allfiles1 != "")
           if (allfiles2 != "")
              let allfiles = allfiles1 . ',' . allfiles2
           else
              let allfiles = allfiles1
           endif
        else 
           let allfiles = allfiles2
        endif
     endif

     if (allfiles != "") 
        let bestFile = ""
        let bestScore = 0
        let score = 0
        let n = 1
         
        let onefile = <SID>GetNthItemFromList(allfiles, n)
        let bestFile = onefile
        while (onefile != "" && score < 2)
           let score = <SID>BufferOrFileExists(onefile)
           if (score > bestScore)
              let bestScore = score
              let bestFile = onefile
           endif
           let n = n + 1
           let onefile = <SID>GetNthItemFromList(allfiles, n)
        endwhile

        if (bestScore == 0 && g:alternateNoDefaultAlternate == 1)
           echo "No existing alternate available"
        else
           call <SID>FindOrCreateBuffer(bestFile, a:splitWindow, 1)
           let b:AlternateAllFiles = allfiles
        endif
     else
        echo "No alternate file/buffer available"
     endif
   endif
endfunction

" Function : AlternateOpenFileUnderCursor (PUBLIC)
" Purpose  : Opens file under the cursor
" Args     : splitWindow -- indicates how to open the file
" Returns  : Nothing
" Author   : Michael Sharpe (feline@irendi.com) www.irendi.com
function! AlternateOpenFileUnderCursor(splitWindow,...)
   let cursorFile = (a:0 > 0) ? a:1 : expand("<cfile>") 
   let currentPath = expand("%:p:h")
   let openCount = 1

   let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, openCount)
   if (fileName != "")
      call <SID>FindOrCreateBuffer(fileName, a:splitWindow, 1)
      let b:openCount = openCount
      let b:cursorFile = cursorFile
      let b:currentPath = currentPath
   else
      echo "Can't find file"
   endif
endfunction

" Function : AlternateOpenNextFile (PUBLIC)
" Purpose  : Opens the next file corresponding to the search which found the 
"            current file
" Args     : bang -- indicates what to do if the current file has not been 
"                    saved
" Returns  : nothing
" Author   : Michael Sharpe (feline@irendi.com) www.irendi.com
function! AlternateOpenNextFile(bang)
   let cursorFile = ""
   if (exists("b:cursorFile"))
      let cursorFile = b:cursorFile
   endif

   let currentPath = ""
   if (exists("b:currentPath"))
      let currentPath = b:currentPath
   endif

   let openCount = 0
   if (exists("b:openCount"))
      let openCount = b:openCount + 1
   endif

   if (cursorFile != ""  && currentPath != ""  && openCount != 0)
      let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, openCount)
      if (fileName != "")
         call <SID>FindOrCreateBuffer(fileName, "n".a:bang, 0)
         let b:openCount = openCount
         let b:cursorFile = cursorFile
         let b:currentPath = currentPath
      else 
         let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, 1)
         if (fileName != "")
            call <SID>FindOrCreateBuffer(fileName, "n".a:bang, 0)
            let b:openCount = 1
            let b:cursorFile = cursorFile
            let b:currentPath = currentPath
         else
            echo "Can't find next file"
         endif
      endif
   endif
endfunction

comm! -nargs=? -bang IH call AlternateOpenFileUnderCursor("n<bang>", <f-args>)
comm! -nargs=? -bang IHS call AlternateOpenFileUnderCursor("h<bang>", <f-args>)
comm! -nargs=? -bang IHV call AlternateOpenFileUnderCursor("v<bang>", <f-args>)
comm! -nargs=? -bang IHT call AlternateOpenFileUnderCursor("t<bang>", <f-args>)
comm! -nargs=? -bang IHN call AlternateOpenNextFile("<bang>")
imap <Leader>ih <ESC>:IHS<CR>
nmap <Leader>ih :IHS<CR>
imap <Leader>is <ESC>:IHS<CR>:A<CR>
nmap <Leader>is :IHS<CR>:A<CR>
imap <Leader>ihn <ESC>:IHN<CR>
nmap <Leader>ihn :IHN<CR>

"function! <SID>PrintList(theList) 
"   let n = 1
"   let oneFile = <SID>GetNthItemFromList(a:theList, n)
"   while (oneFile != "")
"      let n = n + 1
"      let oneFile = <SID>GetNthItemFromList(a:theList, n)
"   endwhile
"endfunction

" Function : NextAlternate (PUBLIC)
" Purpose  : Used to cycle through any other alternate file which existed on
"            the search path.
" Args     : bang (IN) - used to implement the AN vs AN! functionality
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
function! NextAlternate(bang)
   if (exists('b:AlternateAllFiles'))
      let currentFile = expand("%")
      let n = 1
      let onefile = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
      while (onefile != "" && !<SID>EqualFilePaths(fnamemodify(onefile,":p"), fnamemodify(currentFile,":p")))
         let n = n + 1
         let onefile = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
      endwhile

      if (onefile != "")
         let stop = n
         let n = n + 1
         let foundAlternate = 0
         let nextAlternate = ""
         while (n != stop)
            let nextAlternate = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
            if (nextAlternate == "")
               let n = 1
               continue
            endif
            let n = n + 1
            if (<SID>EqualFilePaths(fnamemodify(nextAlternate, ":p"), fnamemodify(currentFile, ":p")))
                continue
            endif
            if (filereadable(nextAlternate))
                " on cygwin filereadable("foo.H") returns true if "foo.h" exists
               if (has("unix") && $WINDIR != "" && fnamemodify(nextAlternate, ":p") ==? fnamemodify(currentFile, ":p")) 
                  continue
               endif
               let foundAlternate = 1
               break
            endif
         endwhile
         if (foundAlternate == 1)
            let s:AlternateAllFiles = b:AlternateAllFiles
            "silent! execute ":e".a:bang." " . nextAlternate
            call <SID>FindOrCreateBuffer(nextAlternate, "n".a:bang, 0)
            let b:AlternateAllFiles = s:AlternateAllFiles
         else 
            echo "Only this alternate file exists"
         endif
      else 
         echo "Could not find current file in alternates list"
      endif
   else 
      echo "No other alternate files exist"
   endif
endfunction

comm! -nargs=? -bang A call AlternateFile("n<bang>", <f-args>)
comm! -nargs=? -bang AS call AlternateFile("h<bang>", <f-args>)
comm! -nargs=? -bang AV call AlternateFile("v<bang>", <f-args>)
comm! -nargs=? -bang AT call AlternateFile("t<bang>", <f-args>)
comm! -nargs=? -bang AN call NextAlternate("<bang>")

" Function : BufferOrFileExists (PRIVATE)
" Purpose  : determines if a buffer or a readable file exists
" Args     : fileName (IN) - name of the file to check
" Returns  : 2 if it exists in memory, 1 if it exists, 0 otherwise
" Author   : Michael Sharpe <feline@irendi.com>
" History  : Updated code to handle buffernames using just the
"            filename and not the path.
function! <SID>BufferOrFileExists(fileName)
   let result = 0

   let lastBuffer = bufnr("$")
   let i = 1
   while i <= lastBuffer
     if <SID>EqualFilePaths(expand("#".i.":p"), a:fileName)
       let result = 2
       break
     endif
     let i = i + 1
   endwhile

   if (!result) 
      let bufName = fnamemodify(a:fileName,":t")
      let memBufName = bufname(bufName)
      if (memBufName != "")
         let memBufBasename = fnamemodify(memBufName, ":t")
         if (bufName == memBufBasename)
            let result = 2
         endif
      endif

      if (!result)
         let result  = bufexists(bufName) || bufexists(a:fileName) || filereadable(a:fileName)
      endif
   endif

   if (!result)
      let result = filereadable(a:fileName)
   endif
   return result
endfunction

" Function : FindOrCreateBuffer (PRIVATE)
" Purpose  : searches the buffer list (:ls) for the specified filename. If
"            found, checks the window list for the buffer. If the buffer is in
"            an already open window, it switches to the window. If the buffer
"            was not in a window, it switches to that buffer. If the buffer did
"            not exist, it creates it.
" Args     : filename (IN) -- the name of the file
"            doSplit (IN) -- indicates whether the window should be split
"                            ("v", "h", "n", "v!", "h!", "n!", "t", "t!") 
"            findSimilar (IN) -- indicate weather existing buffers should be
"                                prefered
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
" History  : + bufname() was not working very well with the possibly strange
"            paths that can abound with the search path so updated this
"            slightly.  -- Bindu
"            + updated window switching code to make it more efficient -- Bindu
"            Allow ! to be applied to buffer/split/editing commands for more
"            vim/vi like consistency
"            + implemented fix from Matt Perry
function! <SID>FindOrCreateBuffer(fileName, doSplit, findSimilar)
  " Check to see if the buffer is already open before re-opening it.
  let FILENAME = escape(a:fileName, ' ')
  let bufNr = -1
  let lastBuffer = bufnr("$")
  let i = 1
  if (a:findSimilar) 
     while i <= lastBuffer
       if <SID>EqualFilePaths(expand("#".i.":p"), a:fileName)
         let bufNr = i
         break
       endif
       let i = i + 1
     endwhile

     if (bufNr == -1)
        let bufName = bufname(a:fileName)
        let bufFilename = fnamemodify(a:fileName,":t")

        if (bufName == "")
           let bufName = bufname(bufFilename)
        endif

        if (bufName != "")
           let tail = fnamemodify(bufName, ":t")
           if (tail != bufFilename)
              let bufName = ""
           endif
        endif
        if (bufName != "")
           let bufNr = bufnr(bufName)
           let FILENAME = bufName
        endif
     endif
  endif

  if (g:alternateRelativeFiles == 1)                                            
        let FILENAME = fnamemodify(FILENAME, ":p:.")
  endif

  let splitType = a:doSplit[0]
  let bang = a:doSplit[1]
  if (bufNr == -1)
     " Buffer did not exist....create it
     let v:errmsg=""
     if (splitType == "h")
        silent! execute ":split".bang." " . FILENAME
     elseif (splitType == "v")
        silent! execute ":vsplit".bang." " . FILENAME
     elseif (splitType == "t")
        silent! execute ":tab split".bang." " . FILENAME
     else
        silent! execute ":e".bang." " . FILENAME
     endif
     if (v:errmsg != "")
        echo v:errmsg
     endif
  else

     " Find the correct tab corresponding to the existing buffer
     let tabNr = -1
     " iterate tab pages
     for i in range(tabpagenr('$'))
        " get the list of buffers in the tab
        let tabList =  tabpagebuflist(i + 1)
        let idx = 0
        " iterate each buffer in the list
        while idx < len(tabList)
           " if it matches the buffer we are looking for...
           if (tabList[idx] == bufNr)
              " ... save the number
              let tabNr = i + 1
              break
           endif
           let idx = idx + 1
        endwhile
        if (tabNr != -1)
           break
        endif
     endfor
     " switch the the tab containing the buffer
     if (tabNr != -1)
        execute "tabn ".tabNr
     endif

     " Buffer was already open......check to see if it is in a window
     let bufWindow = bufwinnr(bufNr)
     if (bufWindow == -1) 
        " Buffer was not in a window so open one
        let v:errmsg=""
        if (splitType == "h")
           silent! execute ":sbuffer".bang." " . FILENAME
        elseif (splitType == "v")
           silent! execute ":vert sbuffer " . FILENAME
        elseif (splitType == "t")
           silent! execute ":tab sbuffer " . FILENAME
        else
           silent! execute ":buffer".bang." " . FILENAME
        endif
        if (v:errmsg != "")
           echo v:errmsg
        endif
     else
        " Buffer is already in a window so switch to the window
        execute bufWindow."wincmd w"
        if (bufWindow != winnr()) 
           " something wierd happened...open the buffer
           let v:errmsg=""
           if (splitType == "h")
              silent! execute ":split".bang." " . FILENAME
           elseif (splitType == "v")
              silent! execute ":vsplit".bang." " . FILENAME
           elseif (splitType == "t")
              silent! execute ":tab split".bang." " . FILENAME
           else
              silent! execute ":e".bang." " . FILENAME
           endif
           if (v:errmsg != "")
              echo v:errmsg
           endif
        endif
     endif
  endif
endfunction

" Function : EqualFilePaths (PRIVATE)
" Purpose  : Compares two paths. Do simple string comparison anywhere but on
"            Windows. On Windows take into account that file paths could differ
"            in usage of separators and the fact that case does not matter.
"            "c:\WINDOWS" is the same path as "c:/windows". has("win32unix") Vim
"            version does not count as one having Windows path rules.
" Args     : path1 (IN) -- first path
"            path2 (IN) -- second path
" Returns  : 1 if path1 is equal to path2, 0 otherwise.
" Author   : Ilya Bobir <ilya@po4ta.com>
function! <SID>EqualFilePaths(path1, path2)
  if has("win16") || has("win32") || has("win64") || has("win95")
    return substitute(a:path1, "\/", "\\", "g") ==? substitute(a:path2, "\/", "\\", "g")
  else
    return a:path1 == a:path2
  endif
endfunction

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
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

"=================================================================================
"
"   Following file contains the commands on how to run the currently open code.
"   The default mapping is set to F5 like most code editors.
"   Change it as you feel comfortable with, keeping in mind that it does not
"   clash with any other keymapping.
"
"   NOTE: Compilers for different systems may differ. For example, in the case
"   of C and C++, we have assumed it to be gcc and g++ respectively, but it may
"   not be the same. It is suggested to check first if the compilers are installed
"   before running the code, or maybe even switch to a different compiler.
"
"   NOTE: Adding support for more programming languages
"
"   Just add another elseif block before the 'endif' statement in the same
"   way it is done in each case. Take care to add tabbed spaces after each
"   elseif block (similar to python). For example:
"
"   elseif &filetype == '<your_file_extension>'
"       exec '!<your_compiler> %'
"
"   NOTE: The '%' sign indicates the name of the currently open file with extension.
"         The time command displays the time taken for execution. Remove the
"         time command if you dont want the system to display the time
"
"=================================================================================

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
endif
endfunc

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
