" Author: Eric Van Dewoestine <ervandew@gmail.com>
"         Original concept and versions up to 0.32 written by
"         Gergely Kontra <kgergely@mcl.hu>
" Version: 2.1
" GetLatestVimScripts: 1643 1 :AutoInstall: supertab.vim
"
" Description: {{{
"   Use your tab key to do all your completion in insert mode!
"   You can cycle forward and backward with the <Tab> and <S-Tab> keys
"   Note: you must press <Tab> once to be able to cycle back
"
"   http://www.vim.org/scripts/script.php?script_id=1643
" }}}
"
" License: {{{
"   Copyright (c) 2002 - 2016
"   All rights reserved.
"
"   Redistribution and use of this software in source and binary forms, with
"   or without modification, are permitted provided that the following
"   conditions are met:
"
"   * Redistributions of source code must retain the above
"     copyright notice, this list of conditions and the
"     following disclaimer.
"
"   * Redistributions in binary form must reproduce the above
"     copyright notice, this list of conditions and the
"     following disclaimer in the documentation and/or other
"     materials provided with the distribution.
"
"   * Neither the name of Gergely Kontra or Eric Van Dewoestine nor the names
"   of its contributors may be used to endorse or promote products derived
"   from this software without specific prior written permission of Gergely
"   Kontra or Eric Van Dewoestine.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
"   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
"   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
"   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
"   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
"   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
"   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
"   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
"   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
"   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
"   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" }}}
"
" Testing Info: {{{
"   Running vim + supertab with the absolute bare minimum settings:
"     $ vim -u NONE -U NONE -c "set nocp | runtime plugin/supertab.vim"
" }}}

if v:version < 700
  finish
endif

if exists('complType') " Integration with other completion functions.
  finish
endif

if exists("loaded_supertab")
  finish
endif
let loaded_supertab = 1

let s:save_cpo=&cpo
set cpo&vim

" Global Variables {{{

  if !exists("g:SuperTabDefaultCompletionType")
    let g:SuperTabDefaultCompletionType = "<c-p>"
  endif

  if !exists("g:SuperTabContextDefaultCompletionType")
    let g:SuperTabContextDefaultCompletionType = "<c-p>"
  endif

  if !exists("g:SuperTabContextTextMemberPatterns")
    let g:SuperTabContextTextMemberPatterns = ['\.', '>\?::', '->']
  endif

  if !exists("g:SuperTabCompletionContexts")
    let g:SuperTabCompletionContexts = ['s:ContextText']
  endif

  if !exists("g:SuperTabRetainCompletionDuration")
    let g:SuperTabRetainCompletionDuration = 'insert'
  endif

  if !exists("g:SuperTabNoCompleteBefore")
    " retain backwards compatability
    if exists("g:SuperTabMidWordCompletion") && !g:SuperTabMidWordCompletion
      let g:SuperTabNoCompleteBefore = ['\k']
    else
      let g:SuperTabNoCompleteBefore = []
    endif
  endif

  if !exists("g:SuperTabNoCompleteAfter")
    " retain backwards compatability
    if exists("g:SuperTabLeadingSpaceCompletion") && g:SuperTabLeadingSpaceCompletion
      let g:SuperTabNoCompleteAfter = []
    else
      let g:SuperTabNoCompleteAfter = ['^', '\s']
    endif
  endif

  if !exists("g:SuperTabMappingForward")
    let g:SuperTabMappingForward = '<tab>'
  endif
  if !exists("g:SuperTabMappingBackward")
    let g:SuperTabMappingBackward = '<s-tab>'
  endif

  if !exists("g:SuperTabMappingTabLiteral")
    let g:SuperTabMappingTabLiteral = '<c-tab>'
  endif

  if !exists("g:SuperTabLongestEnhanced")
    let g:SuperTabLongestEnhanced = 0
  endif

  if !exists("g:SuperTabLongestHighlight")
    let g:SuperTabLongestHighlight = 0
  endif

  if !exists("g:SuperTabCrMapping")
    let g:SuperTabCrMapping = 0
  endif

  if !exists("g:SuperTabClosePreviewOnPopupClose")
    let g:SuperTabClosePreviewOnPopupClose = 0
  endif

  if !exists("g:SuperTabUndoBreak")
    let g:SuperTabUndoBreak = 0
  endif

  if !exists("g:SuperTabCompleteCase")
    let g:SuperTabCompleteCase = 'inherit'
  endif

" }}}

" Script Variables {{{

  " construct the help text.
  let s:tabHelp =
    \ "Hit <CR> or CTRL-] on the completion type you wish to switch to.\n" .
    \ "Use :help ins-completion for more information.\n" .
    \ "\n" .
    \ "|<c-n>|      - Keywords in 'complete' searching down.\n" .
    \ "|<c-p>|      - Keywords in 'complete' searching up (SuperTab default).\n" .
    \ "|<c-x><c-l>| - Whole lines.\n" .
    \ "|<c-x><c-n>| - Keywords in current file.\n" .
    \ "|<c-x><c-k>| - Keywords in 'dictionary'.\n" .
    \ "|<c-x><c-t>| - Keywords in 'thesaurus', thesaurus-style.\n" .
    \ "|<c-x><c-i>| - Keywords in the current and included files.\n" .
    \ "|<c-x><c-]>| - Tags.\n" .
    \ "|<c-x><c-f>| - File names.\n" .
    \ "|<c-x><c-d>| - Definitions or macros.\n" .
    \ "|<c-x><c-v>| - Vim command-line.\n" .
    \ "|<c-x><c-u>| - User defined completion.\n" .
    \ "|<c-x><c-o>| - Omni completion.\n" .
    \ "|<c-x>s|     - Spelling suggestions."

  " set the available completion types and modes.
  let s:types =
    \ "\<c-e>\<c-y>\<c-l>\<c-n>\<c-k>\<c-t>\<c-i>\<c-]>" .
    \ "\<c-f>\<c-d>\<c-v>\<c-n>\<c-p>\<c-u>\<c-o>\<c-n>\<c-p>s"
  let s:modes = '/^E/^Y/^L/^N/^K/^T/^I/^]/^F/^D/^V/^P/^U/^O/s'
  let s:types = s:types . "np"
  let s:modes = s:modes . '/n/p'

" }}}

function! SuperTabSetDefaultCompletionType(type) " {{{
  " Globally available function that users can use to set the default
  " completion type for the current buffer, like in an ftplugin.

  " don't allow overriding what SuperTabChain has set, otherwise chaining may
  " not work.
  if exists('b:SuperTabChain')
    return
  endif

  " init hack for <c-x><c-v> workaround.
  let b:complCommandLine = 0

  let b:SuperTabDefaultCompletionType = a:type

  " set the current completion type to the default
  call SuperTabSetCompletionType(b:SuperTabDefaultCompletionType)
endfunction " }}}

function! SuperTabSetCompletionType(type) " {{{
  " Globally available function that users can use to create mappings to quickly
  " switch completion modes.  Useful when a user wants to restore the default or
  " switch to another mode without having to kick off a completion of that type
  " or use SuperTabHelp.  Note, this function only changes the current
  " completion type, not the default, meaning that the default will still be
  " restored once the configured retension duration has been met (see
  " g:SuperTabRetainCompletionDuration).  To change the default for the current
  " buffer, use SuperTabDefaultCompletionType(type) instead.  Example mapping to
  " restore SuperTab default:
  "   nmap <F6> :call SetSuperTabCompletionType("<c-p>")<cr>

  " don't allow overriding what SuperTabChain has set, otherwise chaining may
  " not work.
  if exists('b:SuperTabChain')
    return
  endif

  call s:InitBuffer()
  exec "let b:complType = \"" . escape(a:type, '<') . "\""
endfunction " }}}

function! SuperTabAlternateCompletion(type) " {{{
  " Function which can be mapped to a key to kick off an alternate completion
  " other than the default.  For instance, if you have 'context' as the default
  " and want to map ctrl+space to issue keyword completion.
  " Note: due to the way vim expands ctrl characters in mappings, you cannot
  " create the alternate mapping like so:
  "    imap <c-space> <c-r>=SuperTabAlternateCompletion("<c-p>")<cr>
  " instead, you have to use \<lt> to prevent vim from expanding the key
  " when creating the mapping.
  "    gvim:
  "      imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-p>")<cr>
  "    console:
  "      imap <nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-p>")<cr>

  call SuperTabSetCompletionType(a:type)
  " end any current completion before attempting to start the new one.
  " use feedkeys to prevent possible remapping of <c-e> from causing issues.
  "call feedkeys("\<c-e>", 'n')
  " ^ since we can't detect completion mode vs regular insert mode, we force
  " vim into keyword completion mode and end that mode to prevent the regular
  " insert behavior of <c-e> from occurring.
  call feedkeys("\<c-x>\<c-p>\<c-e>", 'n')
  call feedkeys(b:complType, 'n')
  return ''
endfunction " }}}

function! SuperTabLongestHighlight(dir) " {{{
  " When longest highlight is enabled, this function is used to do the actual
  " selection of the completion popup entry.

  if !pumvisible()
    return ''
  endif
  return a:dir == -1 ? "\<up>" : "\<down>"
endfunction " }}}

function! s:Init() " {{{
  " Setup mechanism to restore original completion type upon leaving insert
  " mode if configured to do so
  if g:SuperTabRetainCompletionDuration == 'insert'
    augroup supertab_retain
      autocmd!
      autocmd InsertLeave * call s:SetDefaultCompletionType()
    augroup END
  endif
endfunction " }}}

function! s:InitBuffer() " {{{
  if exists('b:SuperTabNoCompleteBefore')
    return
  endif

  let b:complReset = 0
  let b:complTypeManual = !exists('b:complTypeManual') ? '' : b:complTypeManual
  let b:complTypeContext = ''

  " init hack for <c-x><c-v> workaround.
  let b:complCommandLine = 0

  if !exists('b:SuperTabNoCompleteBefore')
    let b:SuperTabNoCompleteBefore = g:SuperTabNoCompleteBefore
  endif
  if !exists('b:SuperTabNoCompleteAfter')
    let b:SuperTabNoCompleteAfter = g:SuperTabNoCompleteAfter
  endif

  if !exists('b:SuperTabDefaultCompletionType')
    let b:SuperTabDefaultCompletionType = g:SuperTabDefaultCompletionType
  endif

  if !exists('b:SuperTabContextDefaultCompletionType')
    let b:SuperTabContextDefaultCompletionType =
      \ g:SuperTabContextDefaultCompletionType
  endif

  " set the current completion type to the default
  call SuperTabSetCompletionType(b:SuperTabDefaultCompletionType)

  " hack to programatically revert a change to snipmate that breaks supertab
  " but which the new maintainers don't care about:
  " http://github.com/garbas/vim-snipmate/issues/37
  let snipmate = maparg('<tab>', 'i')
  if snipmate =~ '<C-G>u' && g:SuperTabMappingForward =~? '<tab>'
    let snipmate = substitute(snipmate, '<C-G>u', '', '')
    iunmap <tab>
    exec "inoremap <silent> <tab> " . snipmate
  endif
endfunction " }}}

function! s:ManualCompletionEnter() " {{{
  " Handles manual entrance into completion mode.

  if &smd
    echo '' | echohl ModeMsg | echo '-- ^X++ mode (' . s:modes . ')' | echohl None
  endif
  let complType = nr2char(getchar())
  if stridx(s:types, complType) != -1
    if !exists('b:supertab_close_preview')
      let b:supertab_close_preview = !s:IsPreviewOpen()
    endif

    if stridx("\<c-e>\<c-y>", complType) != -1 " no memory, just scroll...
      return "\<c-x>" . complType
    elseif stridx('np', complType) != -1
      let complType = nr2char(char2nr(complType) - 96)
    else
      let complType = "\<c-x>" . complType
    endif

    let b:complTypeManual = complType

    if index(['insert', 'session'], g:SuperTabRetainCompletionDuration) != -1
      let b:complType = complType
    endif

    " Hack to workaround bug when invoking command line completion via <c-r>=
    if complType == "\<c-x>\<c-v>"
      return s:CommandLineCompletion()
    endif

    call s:InitBuffer()

    " optionally enable enhanced longest completion
    if g:SuperTabLongestEnhanced && &completeopt =~ 'longest'
      call s:EnableLongestEnhancement()
    " handle backspacing which triggers g:SuperTabNoCompleteAfter match
    elseif s:IsNoCompleteAfterReset()
      call s:EnableNoCompleteAfterReset()
    endif

    if g:SuperTabLongestHighlight &&
     \ &completeopt =~ 'longest' &&
     \ &completeopt =~ 'menu' &&
     \ !s:CompletionMode()
      let dir = (complType == "\<c-x>\<c-p>") ? -1 : 1
      call feedkeys("\<c-r>=SuperTabLongestHighlight(" . dir . ")\<cr>", 'n')
    endif

    call s:StartCompletionMode()
    return complType
  endif

  echohl "Unknown mode"
  return complType
endfunction " }}}

function! s:SetCompletionType() " {{{
  " Sets the completion type based on what the user has chosen from the help
  " buffer.

  let chosen = substitute(getline('.'), '.*|\(.*\)|.*', '\1', '')
  if chosen != getline('.')
    let winnr = b:winnr
    close
    exec winnr . 'winc w'
    call SuperTabSetCompletionType(chosen)
  endif
endfunction " }}}

function! s:SetDefaultCompletionType() " {{{
  if exists('b:SuperTabDefaultCompletionType') &&
  \ (!exists('b:complCommandLine') || !b:complCommandLine)
    call SuperTabSetCompletionType(b:SuperTabDefaultCompletionType)
  endif
endfunction " }}}

function! SuperTab(command) " {{{
  " Used to perform proper cycle navigation as the user requests the next or
  " previous entry in a completion list, and determines whether or not to simply
  " retain the normal usage of <tab> based on the cursor position.

  if exists('b:SuperTabDisabled') && b:SuperTabDisabled
    if exists('s:Tab')
      return s:Tab()
    endif
    return (
        \ g:SuperTabMappingForward ==? '<tab>' ||
        \ g:SuperTabMappingBackward ==? '<tab>'
      \ ) ? "\<tab>" : ''
  endif

  call s:InitBuffer()

  if s:WillComplete()
    if !exists('b:supertab_close_preview')
      let b:supertab_close_preview = !s:IsPreviewOpen()
    endif

    " optionally enable enhanced longest completion
    if g:SuperTabLongestEnhanced && &completeopt =~ 'longest'
      call s:EnableLongestEnhancement()
    " handle backspacing which triggers g:SuperTabNoCompleteAfter match
    elseif s:IsNoCompleteAfterReset()
      call s:EnableNoCompleteAfterReset()
    endif

    if !s:CompletionMode()
      let b:complTypeManual = ''
    endif

    " exception: if in <c-p> mode, then <c-n> should move up the list, and
    " <c-p> down the list.
    if a:command == 'p' && !b:complReset &&
      \ (b:complType == "\<c-p>" ||
      \   (b:complType == 'context' &&
      \    b:complTypeManual == '' &&
      \    b:complTypeContext == "\<c-p>"))
      return "\<c-n>"

    elseif a:command == 'p' && !b:complReset &&
      \ (b:complType == "\<c-n>" ||
      \   (b:complType == 'context' &&
      \    b:complTypeManual == '' &&
      \    b:complTypeContext == "\<c-n>"))
      return "\<c-p>"

    " already in completion mode and not resetting for longest enhancement, so
    " just scroll to next/previous
    elseif s:CompletionMode() && !b:complReset
      let type = b:complType == 'context' ? b:complTypeContext : b:complType
      if a:command == 'n'
        return type == "\<c-p>" || type == "\<c-x>\<c-p>" ? "\<c-p>" : "\<c-n>"
      endif
      return type == "\<c-p>" || type == "\<c-x>\<c-p>" ? "\<c-n>" : "\<c-p>"
    endif

    " handle 'context' completion.
    if b:complType == 'context'
      let complType = s:ContextCompletion()
      if complType == ''
        exec "let complType = \"" .
          \ escape(b:SuperTabContextDefaultCompletionType, '<') . "\""
      endif
      let b:complTypeContext = complType

    " Hack to workaround bug when invoking command line completion via <c-r>=
    elseif b:complType == "\<c-x>\<c-v>"
      let complType = s:CommandLineCompletion()
    else
      let complType = b:complType
    endif

    " switch <c-x><c-p> / <c-x><c-n> completion in <c-p> mode
    if a:command == 'p'
      if complType == "\<c-x>\<c-p>"
        let complType = "\<c-x>\<c-n>"
      elseif complType == "\<c-x>\<c-n>"
        let complType = "\<c-x>\<c-p>"
      endif
    endif

    " highlight first result if longest enabled
    if g:SuperTabLongestHighlight &&
     \ &completeopt =~ 'longest' &&
     \ &completeopt =~ 'menu' &&
     \ (!s:CompletionMode() || b:complReset)
      let dir = (complType == "\<c-p>") ? -1 : 1
      call feedkeys("\<c-r>=SuperTabLongestHighlight(" . dir . ")\<cr>", 'n')
    endif

    if b:complReset
      let b:complReset = 0
      " not an accurate condition for everyone, but better than sending <c-e>
      " at the wrong time.
      if s:CompletionMode()
        return "\<c-e>" . complType
      endif
    endif

    if g:SuperTabUndoBreak && !s:CompletionMode()
      call s:StartCompletionMode()
      return "\<c-g>u" . complType
    endif

    if g:SuperTabCompleteCase == 'ignore' ||
     \ g:SuperTabCompleteCase == 'match'
      if exists('##CompleteDone')
        let ignorecase = g:SuperTabCompleteCase == 'ignore' ? 1 : 0
        if &ignorecase != ignorecase
          let b:supertab_ignorecase_save = &ignorecase
          let &ignorecase = ignorecase
          augroup supertab_ignorecase
            autocmd CompleteDone <buffer>
              \ let &ignorecase = b:supertab_ignorecase_save |
              \ unlet b:supertab_ignorecase_save |
              \ autocmd! supertab_ignorecase
          augroup END
        endif
      endif
    endif

    call s:StartCompletionMode()
    return complType
  endif

  if (a:command == 'n' && g:SuperTabMappingForward ==? '<tab>') ||
   \ (a:command == 'p' && g:SuperTabMappingBackward ==? '<tab>')

    " trigger our func ref to the smart tabs plugin if present.
    if exists('s:Tab')
      return s:Tab()
    endif

    return "\<tab>"
  endif

  if (a:command == 'n' && g:SuperTabMappingForward ==? '<s-tab>') ||
   \ (a:command == 'p' && g:SuperTabMappingBackward ==? '<s-tab>')
    " support triggering <s-tab> mappings users might have.
    if exists('s:ShiftTab')
      if type(s:ShiftTab) == 2
        return s:ShiftTab()
      else
        call feedkeys(s:ShiftTab, 'n')
      endif
    endif
  endif

  return ''
endfunction " }}}

function! s:SuperTabHelp() " {{{
  " Opens a help window where the user can choose a completion type to enter.

  let winnr = winnr()
  if bufwinnr("SuperTabHelp") == -1
    keepalt botright split SuperTabHelp

    setlocal noswapfile
    setlocal buftype=nowrite
    setlocal bufhidden=wipe

    silent put =s:tabHelp
    call cursor(1, 1)
    silent 1,delete _
    call cursor(4, 1)
    exec "resize " . line('$')

    syntax match Special "|.\{-}|"

    setlocal readonly
    setlocal nomodifiable

    nmap <silent> <buffer> <cr> :call <SID>SetCompletionType()<cr>
    nmap <silent> <buffer> <c-]> :call <SID>SetCompletionType()<cr>
  else
    exec bufwinnr("SuperTabHelp") . "winc w"
  endif
  let b:winnr = winnr
endfunction " }}}

function! s:CompletionMode() " {{{
  return pumvisible() || exists('b:supertab_completion_mode')
endfunction " }}}

function! s:StartCompletionMode() " {{{
  if exists('##CompleteDone')
    let b:supertab_completion_mode = 1
    augroup supertab_completion_mode
      autocmd CompleteDone <buffer>
        \ if exists('b:supertab_completion_mode') |
          \ unlet b:supertab_completion_mode |
        \ endif |
        \ autocmd! supertab_completion_mode
    augroup END
  endif
endfunction " }}}

function! s:WillComplete(...) " {{{
  " Determines if completion should be kicked off at the current location.
  " Optional arg:
  "   col: The column to check at, otherwise use the current column.

  " if an arg was supplied, then we will re-check even if already in
  " completion mode.
  if s:CompletionMode() && !a:0
    return 1
  endif

  let line = getline('.')
  let cnum = a:0 ? a:1 : col('.')

  " honor SuperTabNoCompleteAfter
  let pre = cnum >= 2 ? line[:cnum - 2] : ''
  let complAfterType = type(b:SuperTabNoCompleteAfter)
  if complAfterType == 3
    " the option was provided as a list of patterns
    for pattern in b:SuperTabNoCompleteAfter
      if pre =~ pattern . '$'
        return 0
      endif
    endfor
  elseif complAfterType == 2
    " the option was provided as a funcref
    return !b:SuperTabNoCompleteAfter(pre)
  endif

  " honor SuperTabNoCompleteBefore
  " Within a word, but user does not have mid word completion enabled.
  let post = line[cnum - 1:]
  let complBeforeType = type(b:SuperTabNoCompleteBefore)
  if complBeforeType == 3
    " a list of patterns
    for pattern in b:SuperTabNoCompleteBefore
      if post =~ '^' . pattern
        return 0
      endif
    endfor
  elseif complBeforeType == 2
    " the option was provided as a funcref
    return !b:SuperTabNoCompleteBefore(post)
  endif

  return 1
endfunction " }}}

function! s:EnableLongestEnhancement() " {{{
  augroup supertab_reset
    autocmd!
    autocmd InsertLeave,CursorMovedI <buffer>
      \ call s:ReleaseKeyPresses() | autocmd! supertab_reset
  augroup END
  call s:CaptureKeyPresses()
endfunction " }}}

function! s:IsNoCompleteAfterReset() " {{{
  " if the user has g:SuperTabNoCompleteAfter set, then re-map <bs> so that
  " backspacing to a point where one of the g:SuperTabNoCompleteAfter
  " entries matches will cause completion mode to exit.
  let complAfterType = type(b:SuperTabNoCompleteAfter)
  if complAfterType == 2
    return 1
  endif
  return len(g:SuperTabNoCompleteAfter) && g:SuperTabNoCompleteAfter != ['^', '\s']
endfunction " }}}

function! s:EnableNoCompleteAfterReset() " {{{
  augroup supertab_reset
    autocmd!
    autocmd InsertLeave,CursorMovedI <buffer>
      \ call s:ReleaseKeyPresses() | autocmd! supertab_reset
  augroup END

  " short version of s:CaptureKeyPresses
  if !exists('b:capturing') || !b:capturing
    let b:capturing = 1
    let b:capturing_start = col('.')
    let b:captured = {
        \ '<bs>': s:CaptureKeyMap('<bs>'),
        \ '<c-h>': s:CaptureKeyMap('<c-h>'),
      \ }
    imap <buffer> <bs> <c-r>=<SID>CompletionReset("\<lt>bs>")<cr>
    imap <buffer> <c-h> <c-r>=<SID>CompletionReset("\<lt>c-h>")<cr>
  endif
endfunction " }}}

function! s:CompletionReset(char) " {{{
  let b:complReset = 1

  " handle exiting completion mode if user has g:SuperTabNoCompleteAfter set
  " and they are about to backspace to a point where that maches one of the
  " entries in that var.
  if (a:char == "\<bs>" || a:char == "\<c-h>") && s:IsNoCompleteAfterReset()
    if !s:WillComplete(col('.') - 1)
      " Exit from completion mode then issue the currently requested
      " backspace (mapped).
      call feedkeys("\<space>\<bs>", 'n')
      call s:ReleaseKeyPresses()
      call feedkeys("\<bs>", 'mt')
      return ''
    endif
  endif

  return a:char
endfunction " }}}

function! s:CaptureKeyPresses() " {{{
  if !exists('b:capturing') || !b:capturing
    let b:capturing = 1
    let b:capturing_start = col('.')
    " save any previous mappings
    let b:captured = {
        \ '<bs>': s:CaptureKeyMap('<bs>'),
        \ '<c-h>': s:CaptureKeyMap('<c-h>'),
      \ }
    " TODO: use &keyword to get an accurate list of chars to map
    for c in split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_', '.\zs')
      let existing = s:CaptureKeyMap(c)
      let b:captured[c] = existing
      exec 'imap <buffer> ' . c . ' <c-r>=<SID>CompletionReset("' . c . '")<cr>'
    endfor
    imap <buffer> <bs> <c-r>=<SID>CompletionReset("\<lt>bs>")<cr>
    imap <buffer> <c-h> <c-r>=<SID>CompletionReset("\<lt>c-h>")<cr>
  endif
endfunction " }}}

function! s:CaptureKeyMap(key) " {{{
  " as of 7.3.032 maparg supports obtaining extended information about the
  " mapping.
  if s:has_dict_maparg
    return maparg(a:key, 'i', 0, 1)
  endif
  return maparg(a:key, 'i')
endfunction " }}}

function! s:IsPreviewOpen() " {{{
  let wins = tabpagewinnr(tabpagenr(), '$')
  let winnr = 1
  while winnr <= wins
    if getwinvar(winnr, '&previewwindow') == 1
      return 1
    endif
    let winnr += 1
  endwhile
  return 0
endfunction " }}}

function! s:ClosePreview() " {{{
  if exists('b:supertab_close_preview') && b:supertab_close_preview
    let preview = 0
    for bufnum in tabpagebuflist()
      if getwinvar(bufwinnr(bufnum), '&previewwindow')
        let preview = 1
        break
      endif
    endfor
    if preview
      pclose
      try
        doautocmd <nomodeline> supertab_preview_closed User <supertab>
      catch /E216/
        " ignore: no autocmds defined
      endtry
    endif
  endif
  silent! unlet b:supertab_close_preview
endfunction " }}}

function! s:ReleaseKeyPresses() " {{{
  if exists('b:capturing') && b:capturing
    let b:capturing = 0
    for c in keys(b:captured)
      exec 'iunmap <buffer> ' . c
    endfor

    " restore any previous mappings
    for [key, mapping] in items(b:captured)
      if !len(mapping)
        continue
      endif

      if type(mapping) == 4
        let restore = mapping.noremap ? "inoremap" : "imap"
        let restore .= " <buffer>"
        if mapping.silent
          let restore .= " <silent>"
        endif
        if mapping.expr
          let restore .= " <expr>"
        endif
        let rhs = substitute(mapping.rhs, '<SID>\c', '<SNR>' . mapping.sid . '_', 'g')
        let restore .= ' ' . key . ' ' . rhs
        exec restore
      elseif type(c) == 1
        let args = substitute(mapping, '.*\(".\{-}"\).*', '\1', '')
        if args != mapping
          let args = substitute(args, '<', '<lt>', 'g')
          let expr = substitute(mapping, '\(.*\)".\{-}"\(.*\)', '\1%s\2', '')
          let mapping = printf(expr, args)
        endif
        exec printf("imap <silent> <buffer> %s %s", key, mapping)
      endif
    endfor
    unlet b:captured

    if mode() == 'i' && &completeopt =~ 'menu' && b:capturing_start != col('.')
      " force full exit from completion mode (don't exit insert mode since
      " that will break repeating with '.')
      call feedkeys("\<space>\<bs>", 'n')
    endif
    unlet b:capturing_start
  endif
endfunction " }}}

function! s:CommandLineCompletion() " {{{
  " Hack needed to account for apparent bug in vim command line mode completion
  " when invoked via <c-r>=

  " This hack will trigger InsertLeave which will then invoke
  " s:SetDefaultCompletionType.  To prevent default completion from being
  " restored prematurely, set an internal flag for s:SetDefaultCompletionType
  " to check for.
  let b:complCommandLine = 1
  return "\<c-\>\<c-o>:call feedkeys('\<c-x>\<c-v>\<c-v>', 'n') | " .
    \ "let b:complCommandLine = 0\<cr>"
endfunction " }}}

function! s:ContextCompletion() " {{{
  let contexts = exists('b:SuperTabCompletionContexts') ?
    \ b:SuperTabCompletionContexts : g:SuperTabCompletionContexts

  for context in contexts
    try
      let Context = function(context)
      let complType = Context()
      unlet Context
      if type(complType) == 1 && complType != ''
        return complType
      endif
    catch /E700/
      echohl Error
      echom 'supertab: no context function "' . context . '" found.'
      echohl None
    endtry
  endfor
  return ''
endfunction " }}}

function! s:ContextDiscover() " {{{
  let discovery = exists('g:SuperTabContextDiscoverDiscovery') ?
    \ g:SuperTabContextDiscoverDiscovery : []

  " loop through discovery list to find the default
  if !empty(discovery)
    for pair in discovery
      let var = substitute(pair, '\(.*\):.*', '\1', '')
      let type = substitute(pair, '.*:\(.*\)', '\1', '')
      exec 'let value = ' . var
      if value !~ '^\s*$' && value != '0'
        exec "let complType = \"" . escape(type, '<') . "\""
        return complType
      endif
    endfor
  endif
endfunction " }}}

function! s:ContextText() " {{{
  let exclusions = exists('g:SuperTabContextTextFileTypeExclusions') ?
    \ g:SuperTabContextTextFileTypeExclusions : []

  if index(exclusions, &ft) == -1
    let curline = getline('.')
    let cnum = col('.')
    let synname = synIDattr(synID(line('.'), cnum - 1, 1), 'name')

    let member_patterns = exists('b:SuperTabContextTextMemberPatterns') ?
      \ b:SuperTabContextTextMemberPatterns : g:SuperTabContextTextMemberPatterns
    let member_pattern = join(member_patterns, '\|')

    " don't kick off file completion if the pattern is '</' (to account for
    " sgml languanges), that's what the following <\@<! pattern is doing.
    if curline =~ '<\@<!/\.\?\w*\%' . cnum . 'c' ||
      \ ((has('win32') || has('win64')) && curline =~ '\\\w*\%' . cnum . 'c')

      return "\<c-x>\<c-f>"

    elseif curline =~ '\(' . member_pattern . '\)\w*\%' . cnum . 'c' &&
      \ synname !~ '\(String\|Comment\)'
      let omniPrecedence = exists('g:SuperTabContextTextOmniPrecedence') ?
        \ g:SuperTabContextTextOmniPrecedence : ['&completefunc', '&omnifunc']
      let omniPrecedence = exists('b:SuperTabContextTextOmniPrecedence') ?
        \ b:SuperTabContextTextOmniPrecedence : omniPrecedence

      for omniFunc in omniPrecedence
        if omniFunc !~ '^&'
          let omniFunc = '&' . omniFunc
        endif
        if getbufvar(bufnr('%'), omniFunc) != ''
          return omniFunc == '&omnifunc' ? "\<c-x>\<c-o>" : "\<c-x>\<c-u>"
        endif
      endfor
    endif
  endif
endfunction " }}}

function! s:ExpandMap(map) " {{{
  let map = a:map
  if map =~ '<Plug>'
    let plug = substitute(map, '.\{-}\(<Plug>\w\+\).*', '\1', '')
    let plug_map = maparg(plug, 'i')
    let map = substitute(map, '.\{-}\(<Plug>\w\+\).*', plug_map, '')
  endif
  return map
endfunction " }}}

function! SuperTabChain(completefunc, completekeys, ...) " {{{
  if a:completefunc != 'SuperTabCodeComplete'
    call s:InitBuffer()
    if (a:0 && a:1) || (!a:0 && b:SuperTabDefaultCompletionType == 'context')
      let b:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
      call SuperTabSetDefaultCompletionType("context")
    else
      call SuperTabSetDefaultCompletionType("<c-x><c-u>")
    endif

    let b:SuperTabChain = [a:completefunc, a:completekeys]
    setlocal completefunc=SuperTabCodeComplete
  endif
endfunction " }}}

function! SuperTabCodeComplete(findstart, base) " {{{
  if !exists('b:SuperTabChain')
    echoe 'No completion chain has been set.'
    return -2
  endif

  if len(b:SuperTabChain) != 2
    echoe 'Completion chain can only be used with 1 completion function ' .
        \ 'and 1 fallback completion key binding.'
    return -2
  endif

  let Func = function(b:SuperTabChain[0])

  if a:findstart
    let start = Func(a:findstart, a:base)
    if start >= 0
      return start
    endif

    return col('.') - 1
  endif

  let results = Func(a:findstart, a:base)
  " Handle dict case, with 'words' and 'refresh' (optional).
  " This is used by YouCompleteMe. (See complete-functions).
  if type(results) == type({}) && has_key(results, 'words')
    if len(results.words)
      return results
    endif
  elseif len(results)
    return results
  endif

  exec 'let keys = "' . escape(b:SuperTabChain[1], '<') . '"'
  " <c-e>: stop completion and go back to the originally typed text.
  call feedkeys("\<c-e>" . keys, 'nt')
  return []
endfunction " }}}

" Autocmds {{{
  if g:SuperTabClosePreviewOnPopupClose
    augroup supertab_close_preview
      autocmd!
      autocmd InsertLeave,CursorMovedI * call s:ClosePreview()
    augroup END
  endif
" }}}

" Key Mappings {{{
  " map a regular tab to ctrl-tab (note: doesn't work in console vim)
  exec 'inoremap ' . g:SuperTabMappingTabLiteral . ' <tab>'

  inoremap <silent> <c-x> <c-r>=<SID>ManualCompletionEnter()<cr>

  imap <script> <Plug>SuperTabForward <c-r>=SuperTab('n')<cr>
  imap <script> <Plug>SuperTabBackward <c-r>=SuperTab('p')<cr>

  let s:has_dict_maparg = v:version > 703 || (v:version == 703 && has('patch32'))

  " support delegating to smart tabs plugin
  if g:SuperTabMappingForward ==? '<tab>' || g:SuperTabMappingBackward ==? '<tab>'
    let existing_tab = maparg('<tab>', 'i')
    if existing_tab =~ '\d\+_InsertSmartTab()$'
      let s:Tab = function(substitute(existing_tab, '()$', '', ''))
    endif
  endif

  " save user's existing <s-tab> mapping if they have one.
  " Note: this could cause more problems than it solves if it picks up <s-tab>
  " mappings from other plugins and misinterprets them, etc, so this block is
  " experimental and could be removed later.
  if g:SuperTabMappingForward ==? '<s-tab>' || g:SuperTabMappingBackward ==? '<s-tab>'
    let stab = maparg('<s-tab>', 'i')
    if s:has_dict_maparg
      let existing_stab = maparg('<s-tab>', 'i', 0, 1)
      if len(existing_stab) && existing_stab.expr
        let stab = substitute(stab, '<SID>\c', '<SNR>' . existing_stab.sid . '_', '')
        let stab = substitute(stab, '()$', '', '')
        let stab = ''
      endif
    endif
    if stab != ''
      let stab = substitute(stab, '\(<[-a-zA-Z0-9]\+>\)', '\\\1', 'g')
      exec "let stab = \"" . stab . "\""
      let s:ShiftTab = stab
    endif
  endif

  exec 'imap ' . g:SuperTabMappingForward . ' <Plug>SuperTabForward'
  exec 'imap ' . g:SuperTabMappingBackward . ' <Plug>SuperTabBackward'

  if g:SuperTabCrMapping
    let expr_map = 0
    if s:has_dict_maparg
      let map_dict = maparg('<cr>', 'i', 0, 1)
      let expr_map = has_key(map_dict, 'expr') && map_dict.expr
    else
      let expr_map = maparg('<cr>', 'i') =~? '\<cr>'
    endif

    redir => iabbrevs
    silent iabbrev
    redir END
    let iabbrev_map = iabbrevs =~? '\<cr>'

    if expr_map
      " Not compatible w/ expr mappings. This is most likely a user mapping,
      " typically with the same functionality anyways.
      let g:SuperTabCrMapping = 0
    elseif iabbrev_map
      " Not compatible w/ insert abbreviations containing <cr>
      let g:SuperTabCrMapping = 0
    elseif maparg('<CR>', 'i') =~ '<Plug>delimitMateCR'
      " Not compatible w/ delimitMate since it doesn't play well with others
      " and will always return a <cr> which we don't want when selecting a
      " completion.
      let g:SuperTabCrMapping = 0
    elseif maparg('<CR>', 'i') =~ '<CR>'
      let map = maparg('<cr>', 'i')
      let cr = !(map =~? '\(^\|[^)]\)<cr>' || map =~ 'ExpandCr')
      let map = s:ExpandMap(map)
      exec "inoremap <script> <cr> <c-r>=<SID>SelectCompletion(" . cr . ")<cr>" . map
    else
      inoremap <silent> <cr> <c-r>=<SID>SelectCompletion(1)<cr>
    endif
    function! s:SelectCompletion(cr)
      " selecting a completion
      if s:CompletionMode()
        " ugly hack to let other <cr> mappings for other plugins cooperate
        " with supertab
        let b:supertab_pumwasvisible = 1

        " close the preview window if configured to do so
        if &completeopt =~ 'preview' && g:SuperTabClosePreviewOnPopupClose
          if !exists('b:supertab_close_preview')
            let b:supertab_close_preview = !s:IsPreviewOpen()
          endif
          call s:ClosePreview()
        endif

        return "\<c-y>"
      endif

      " only needed when chained with other mappings and one of them will
      " issue a <cr>.
      if exists('b:supertab_pumwasvisible') && !a:cr
        unlet b:supertab_pumwasvisible
        return ''
      endif

      " not so pleasant hack to keep <cr> working for abbreviations
      let word = substitute(getline('.'), '^.*\s\+\(.*\%' . col('.') . 'c\).*', '\1', '')
      let result = maparg(word, 'i', 1)
      if result != ''
        let bs = ""
        let i = 0
        while i < len(word)
          let bs .= "\<bs>"
          let i += 1
        endwhile
        " escape keys
        let result = substitute(result, '\(<[a-zA-Z][-a-zA-Z]*>\)', '\\\1', 'g')
        " ensure escaped keys are properly recognized
        exec 'let result = "' . escape(result, '"') . '"'
        return bs . result . (a:cr ? "\<cr>" : "")
      endif

      " only return a cr if nothing else is mapped to it since we don't want
      " to duplicate a cr returned by another mapping.
      return a:cr ? "\<cr>" : ""
    endfunction
  endif
" }}}

" Command Mappings {{{
  if !exists(":SuperTabHelp")
    command SuperTabHelp :call <SID>SuperTabHelp()
  endif
" }}}

call s:Init()

function! TestSuperTabCodeComplete(findstart, base) " {{{
  " Test supertab completion chaining w/ a minimal vim environment:
  " $ vim -u NONE -U NONE \
  "   --cmd "set nocp | sy on" \
  "   -c "so ~/.vim/plugin/supertab.vim" \
  "   -c "let g:SuperTabDefaultCompletionType = '<c-x><c-u>'" \
  "   -c "set completefunc=TestSuperTabCodeComplete" \
  "   -c "call SuperTabChain(&completefunc, '<c-p>')"
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    if line[start] =~ '\.'
      let start -= 1
    endif
    while start > 0 && line[start - 1] =~ '\w'
      let start -= 1
    endwhile
    return start
  else
    let completions = []
    if getline('.') =~ 'TestC'
      call add(completions, {
          \ 'word': 'test1(',
          \ 'kind': 'm',
          \ 'menu': 'test1(...)',
        \ })
      call add(completions, {
          \ 'word': 'testing2(',
          \ 'kind': 'm',
          \ 'menu': 'testing2(...)',
        \ })
    endif

    return completions
  endif
endfunction " }}}

let &cpo = s:save_cpo

" vim:ft=vim:fdm=marker








"ListToggle
" Copyright (C) 2012  Strahinja Val Markovic  <val@markovic.io>
"
" This file is part of ListToggle.
"
" ListToggle is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" ListToggle is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with ListToggle.  If not, see <http://www.gnu.org/licenses/>.
"
"
" See ':help listtoggle' for more information.

if exists('g:loaded_listtoggle')
  finish
endif
let g:loaded_listtoggle = 1

let g:lt_height = get( g:, 'lt_height', 10 )
let g:lt_location_list_toggle_map =
      \ get( g:, 'lt_location_list_toggle_map', '<leader>l' )
let g:lt_quickfix_list_toggle_map =
      \ get( g:, 'lt_quickfix_list_toggle_map', '<leader>q' )

" If the user has explicitly set some mappings, then we don't use <unique> when
" creating the mappings; the user obviously wants to use them
if g:lt_location_list_toggle_map != '<leader>l' ||
      \ g:lt_quickfix_list_toggle_map != '<leader>q'
  let s:unique = ''
else
  let s:unique = '<unique>'
endif

function! s:LListToggle() abort
    let buffer_count_before = s:BufferCount()
    " Location list can't be closed if there's cursor in it, so we need
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose

    if s:BufferCount() == buffer_count_before
        execute "silent! lopen " . g:lt_height
    endif
endfunction

function! s:QListToggle() abort
    let buffer_count_before = s:BufferCount()
    silent! cclose

    if s:BufferCount() == buffer_count_before
        execute "silent! botright copen " . g:lt_height
    endif
endfunction

function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1'))
endfunction






"thesaurus
" An thesaurus query & replacing framework written in python.
" Author:       HE Chong [[chong.he.1989@gmail.com][E-mail]]
"
" part of the code and idea of using online resources for thesaurus query:
"       Anton Beloglazov <http://beloglazov.info/>

if exists("g:loaded_thesaurus_query")
    finish
endif
let g:loaded_thesaurus_query = 1

let s:save_cpo = &cpo
set cpo&vim


" --------------------------------
"  Basic settings
" --------------------------------
"
if !exists("g:tq_map_keys")
    let g:tq_map_keys = 1
endif

if !exists("g:tq_use_vim_autocomplete")
    let g:tq_use_vim_autocomplete = 1
endif


" --------------------------------
"  Expose our commands to the user
" --------------------------------
"
command! ThesaurusQueryReplaceCurrentWord :call thesaurus_query#Thesaurus_Query_Lookup(expand('<cword>'), 1)
command! ThesaurusQueryLookupCurrentWord :call thesaurus_query#Thesaurus_Query_Lookup(expand('<cword>'), 0)
command! ThesaurusQueryReset :call thesaurus_query#Thesaurus_Query_Restore_Handler()

command! -nargs=1 Thesaurus :call thesaurus_query#Thesaurus_Query_Lookup(<q-args>, 0)

command! -nargs=1 ThesaurusQueryReplace :call thesaurus_query#Thesaurus_Query_Lookup(<q-args>, 1)


" --------------------------------
"  Map keys
" --------------------------------

if g:tq_map_keys
    nnoremap <unique><silent> <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR>
    vnoremap <unique><silent> <Leader>cs "ky:ThesaurusQueryReplace <C-r>k<CR>
    nnoremap <silent> <LocalLeader>cs :ThesaurusQueryReplaceCurrentWord<CR>
    vnoremap <silent> <LocalLeader>cs "ky:ThesaurusQueryReplace <C-r>k<CR>
endif

if g:tq_use_vim_autocomplete
    set completefunc=thesaurus_query#auto_complete_integrate
endif

let &cpo = s:save_cpo







"ultisnips
if exists('did_plugin_ultisnips') || &cp
    finish
endif
let did_plugin_ultisnips=1

if version < 704
   echohl WarningMsg
   echom  "UltiSnips requires Vim >= 7.4"
   echohl None
   finish
endif

" The Commands we define.
command! -bang -nargs=? -complete=customlist,UltiSnips#FileTypeComplete UltiSnipsEdit
    \ :call UltiSnips#Edit(<q-bang>, <q-args>)

command! -nargs=1 UltiSnipsAddFiletypes :call UltiSnips#AddFiletypes(<q-args>)

augroup UltiSnips_AutoTrigger
    au!
    au InsertCharPre * call UltiSnips#TrackChange()
    au TextChangedI * call UltiSnips#TrackChange()
    if exists('##TextChangedP')
        au TextChangedP * call UltiSnips#TrackChange()
    endif
augroup END

call UltiSnips#map_keys#MapKeys()

" vim: ts=8 sts=4 sw=4






"autocomplpop
"=============================================================================
" Copyright (c) 2007-2009 Takeshi NISHIDA
"
" GetLatestVimScripts: 1879 1 :AutoInstall: AutoComplPop
"=============================================================================
" LOAD GUARD {{{1

if exists('g:loaded_acp')
  finish
elseif v:version < 702
  echoerr 'AutoComplPop does not support this version of vim (' . v:version . ').'
  finish
endif
let g:loaded_acp = 1

" }}}1
"=============================================================================
" FUNCTION: {{{1

"
function s:defineOption(name, default)
  if !exists(a:name)
    let {a:name} = a:default
  endif
endfunction

"
function s:makeDefaultBehavior()
  let behavs = {
        \   '*'      : [],
        \   'ruby'   : [],
        \   'python' : [],
        \   'perl'   : [],
        \   'xml'    : [],
        \   'html'   : [],
        \   'xhtml'  : [],
        \   'css'    : [],
        \ }
  "---------------------------------------------------------------------------
  if !empty(g:acp_behaviorUserDefinedFunction) &&
        \ !empty(g:acp_behaviorUserDefinedMeets)
    for key in keys(behavs)
      call add(behavs[key], {
            \   'command'      : "\<C-x>\<C-u>",
            \   'completefunc' : g:acp_behaviorUserDefinedFunction,
            \   'meets'        : g:acp_behaviorUserDefinedMeets,
            \   'repeat'       : 0,
            \ })
    endfor
  endif
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command'      : "\<C-x>\<C-u>",
          \   'completefunc' : 'acp#completeSnipmate',
          \   'meets'        : 'acp#meetsForSnipmate',
          \   'onPopupClose' : 'acp#onPopupCloseSnipmate',
          \   'repeat'       : 0,
          \ })
  endfor
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command' : g:acp_behaviorKeywordCommand,
          \   'meets'   : 'acp#meetsForKeyword',
          \   'repeat'  : 0,
          \ })
  endfor
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command' : "\<C-x>\<C-f>",
          \   'meets'   : 'acp#meetsForFile',
          \   'repeat'  : 1,
          \ })
  endfor
  "---------------------------------------------------------------------------
  call add(behavs.ruby, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForRubyOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.python, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForPythonOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.perl, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForPerlOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.xml, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForXmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.html, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForHtmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.xhtml, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForHtmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.css, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'acp#meetsForCssOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  return behavs
endfunction

" }}}1
"=============================================================================
" INITIALIZATION {{{1

"-----------------------------------------------------------------------------
call s:defineOption('g:acp_enableAtStartup', 1)
call s:defineOption('g:acp_mappingDriven', 0)
call s:defineOption('g:acp_ignorecaseOption', 1)
call s:defineOption('g:acp_completeOption', '.,w,b,k')
call s:defineOption('g:acp_completeoptPreview', 0)
call s:defineOption('g:acp_behaviorUserDefinedFunction', '')
call s:defineOption('g:acp_behaviorUserDefinedMeets', '')
call s:defineOption('g:acp_behaviorSnipmateLength', -1)
call s:defineOption('g:acp_behaviorKeywordCommand', "\<C-n>")
call s:defineOption('g:acp_behaviorKeywordLength', 2)
call s:defineOption('g:acp_behaviorKeywordIgnores', [])
call s:defineOption('g:acp_behaviorFileLength', 0)
call s:defineOption('g:acp_behaviorRubyOmniMethodLength', 0)
call s:defineOption('g:acp_behaviorRubyOmniSymbolLength', 1)
call s:defineOption('g:acp_behaviorPythonOmniLength', 0)
call s:defineOption('g:acp_behaviorPerlOmniLength', -1)
call s:defineOption('g:acp_behaviorXmlOmniLength', 0)
call s:defineOption('g:acp_behaviorHtmlOmniLength', 0)
call s:defineOption('g:acp_behaviorCssOmniPropertyLength', 1)
call s:defineOption('g:acp_behaviorCssOmniValueLength', 0)
call s:defineOption('g:acp_behavior', {})
"-----------------------------------------------------------------------------
call extend(g:acp_behavior, s:makeDefaultBehavior(), 'keep')
"-----------------------------------------------------------------------------
command! -bar -narg=0 AcpEnable  call acp#enable()
command! -bar -narg=0 AcpDisable call acp#disable()
command! -bar -narg=0 AcpLock    call acp#lock()
command! -bar -narg=0 AcpUnlock  call acp#unlock()
"-----------------------------------------------------------------------------
" legacy commands
command! -bar -narg=0 AutoComplPopEnable  AcpEnable
command! -bar -narg=0 AutoComplPopDisable AcpDisable
command! -bar -narg=0 AutoComplPopLock    AcpLock
command! -bar -narg=0 AutoComplPopUnlock  AcpUnlock
"-----------------------------------------------------------------------------
if g:acp_enableAtStartup
  AcpEnable
endif
"-----------------------------------------------------------------------------

" }}}1
"=============================================================================
" vim: set fdm=marker:







"esformatter
" ============================================================================
" File:        esformatter.vim
" Maintainer:  Miller Medeiros <http://blog.millermedeiros.com/>
" Description: Expose commands to execute the esformatter binary on normal and
"              visual modes.
" Last Change: 2015-06-26
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================

" heavily inspired by: https://gist.github.com/nisaacson/6939960

if !exists('g:esformatter_debug') && (exists('loaded_esformatter') || &cp)
  finish
endif

let loaded_esformatter = 1

if !exists('g:esformatter_autosave')
    let g:esformatter_autosave = 0
endif

if g:esformatter_autosave
    autocmd BufWritePre *.js,*.jsx,*.mjs :Esformatter
endif

function! s:EsformatterNormal()
  " store current cursor position and change the working directory
  let win_view = winsaveview()
  let file_wd = expand('%:p:h')
  let current_wd = getcwd()
  execute ':lcd ' . file_wd

  " pass whole buffer content to esformatter
  let output = system('esformatter', join(getline(1,'$'), "\n"))

  if v:shell_error
    echom "Error while executing esformatter! no changes made."
    echo output
  else
    " delete whole buffer content and append the formatted code
    normal! ggdG
    call append(0, split(output, "\n"))
    " need to delete the last line since append() will add an extra line
    execute ':$d'
  endif

  " Clean up: restore previous cursor position and working directory
  call winrestview(win_view)
  execute ':lcd ' . current_wd
endfunction


function! s:EsformatterVisual() range
  " store current cursor position and change the working directory
  let win_view = winsaveview()
  let file_wd = expand('%:p:h')
  let current_wd = getcwd()
  execute ':lcd ' . file_wd

  " get lines from the current selection and store the first line number
  let range_start = line("'<")
  let input = getline("'<", "'>")

  " if first/last lines are empty they will be removed after the formatting so
  " we set a flag to restore it later
  let restore_first_line = 0
  if input[0] == ''
    let restore_first_line = 1
  endif
  let restore_last_line = 0
  if input[-1] == ''
    let restore_last_line = 1
  endif

  let output = system('esformatter', join(input, "\n"))

  if v:shell_error
    echom 'Error while executing esformatter! no changes made.'
    echo output
  else
    " delete the old lines
    normal! gvd

    let new_lines = split(l:output, '\n')

    if 1 == restore_first_line
      call insert(new_lines, '')
    endif
    if 1 == restore_last_line
      call add(new_lines, '')
    endif

    " add new lines to the buffer
    call append(range_start - 1, new_lines)

    " Clean up: restore previous cursor position
    call winrestview(win_view)
    " recreate the visual selection and cancel it, so that the formatted code
    " can be reselected using gv
    execute "normal! V" . (len(new_lines)-1) . "j\<esc>"
  endif

  " Clean up: restore working directory
  execute ':lcd ' . current_wd
endfunction





"snipmate
" File:          snipMate.vim
" Author:        Michael Sanders
" Version:       0.84
" Description:   snipMate.vim implements some of TextMate's snippets features in
"                Vim. A snippet is a piece of often-typed text that you can
"                insert into your document using a trigger word followed by a "<tab>".
"
"                For more help see snipMate.txt; you can do this by using:
"                :helptags ~/.vim/doc
"                :h snipMate.txt

if exists('loaded_snips') || &cp || version < 700
	finish
endif
let loaded_snips = 1
if !exists('snips_author') | let snips_author = 'Me' | endif

au BufRead,BufNewFile *.snippets\= set ft=snippet
au FileType snippet setl noet fdm=indent

let s:snippets = {} | let s:multi_snips = {}

if !exists('snippets_dir')
	let snippets_dir = substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g')
endif

fun! MakeSnip(scope, trigger, content, ...)
	let multisnip = a:0 && a:1 != ''
	let var = multisnip ? 's:multi_snips' : 's:snippets'
	if !has_key({var}, a:scope) | let {var}[a:scope] = {} | endif
	if !has_key({var}[a:scope], a:trigger)
		let {var}[a:scope][a:trigger] = multisnip ? [[a:1, a:content]] : a:content
	elseif multisnip | let {var}[a:scope][a:trigger] += [[a:1, a:content]]
	else
		echom 'Warning in snipMate.vim: Snippet '.a:trigger.' is already defined.'
				\ .' See :h multi_snip for help on snippets with multiple matches.'
	endif
endf

fun! ExtractSnips(dir, ft)
	for path in split(globpath(a:dir, '*'), "\n")
		if isdirectory(path)
			let pathname = fnamemodify(path, ':t')
			for snipFile in split(globpath(path, '*.snippet'), "\n")
				call s:ProcessFile(snipFile, a:ft, pathname)
			endfor
		elseif fnamemodify(path, ':e') == 'snippet'
			call s:ProcessFile(path, a:ft)
		endif
	endfor
endf

" Processes a single-snippet file; optionally add the name of the parent
" directory for a snippet with multiple matches.
fun s:ProcessFile(file, ft, ...)
	let keyword = fnamemodify(a:file, ':t:r')
	if keyword  == '' | return | endif
	try
		let text = join(readfile(a:file), "\n")
	catch /E484/
		echom "Error in snipMate.vim: couldn't read file: ".a:file
	endtry
	return a:0 ? MakeSnip(a:ft, a:1, text, keyword)
			\  : MakeSnip(a:ft, keyword, text)
endf

fun! ExtractSnipsFile(file, ft)
	if !filereadable(a:file) | return | endif
	let text = readfile(a:file)
	let inSnip = 0
	for line in text + ["\n"]
		if inSnip && (line[0] == "\t" || line == '')
			let content .= strpart(line, 1)."\n"
			continue
		elseif inSnip
			call MakeSnip(a:ft, trigger, content[:-2], name)
			let inSnip = 0
		endif

		if line[:6] == 'snippet'
			let inSnip = 1
			let trigger = strpart(line, 8)
			let name = ''
			let space = stridx(trigger, ' ') + 1
			if space " Process multi snip
				let name = strpart(trigger, space)
				let trigger = strpart(trigger, 0, space - 1)
			endif
			let content = ''
		endif
	endfor
endf

" Reset snippets for filetype.
fun! ResetSnippets(ft)
	let ft = a:ft == '' ? '_' : a:ft
	for dict in [s:snippets, s:multi_snips, g:did_ft]
		if has_key(dict, ft)
			unlet dict[ft]
		endif
	endfor
endf

" Reset snippets for all filetypes.
fun! ResetAllSnippets()
	let s:snippets = {} | let s:multi_snips = {} | let g:did_ft = {}
endf

" Reload snippets for filetype.
fun! ReloadSnippets(ft)
	let ft = a:ft == '' ? '_' : a:ft
	call ResetSnippets(ft)
	call GetSnippets(g:snippets_dir, ft)
endf

" Reload snippets for all filetypes.
fun! ReloadAllSnippets()
	for ft in keys(g:did_ft)
		call ReloadSnippets(ft)
	endfor
endf

let g:did_ft = {}
fun! GetSnippets(dir, filetypes)
	for ft in split(a:filetypes, '\.')
		if has_key(g:did_ft, ft) | continue | endif
		call s:DefineSnips(a:dir, ft, ft)
		if ft == 'objc' || ft == 'cpp' || ft == 'cs'
			call s:DefineSnips(a:dir, 'c', ft)
		elseif ft == 'xhtml'
			call s:DefineSnips(a:dir, 'html', 'xhtml')
		endif
		let g:did_ft[ft] = 1
	endfor
endf

" Define "aliasft" snippets for the filetype "realft".
fun s:DefineSnips(dir, aliasft, realft)
	for path in split(globpath(a:dir, a:aliasft.'/')."\n".
					\ globpath(a:dir, a:aliasft.'-*/'), "\n")
		call ExtractSnips(path, a:realft)
	endfor
	for path in split(globpath(a:dir, a:aliasft.'.snippets')."\n".
					\ globpath(a:dir, a:aliasft.'-*.snippets'), "\n")
		call ExtractSnipsFile(path, a:realft)
	endfor
endf

fun! TriggerSnippet()
	if exists('g:SuperTabMappingForward')
		if g:SuperTabMappingForward == "<tab>"
			let SuperTabKey = "\<c-n>"
		elseif g:SuperTabMappingBackward == "<tab>"
			let SuperTabKey = "\<c-p>"
		endif
	endif

	if pumvisible() " Update snippet if completion is used, or deal with supertab
		if exists('SuperTabKey')
			call feedkeys(SuperTabKey) | return ''
		endif
		call feedkeys("\<esc>a", 'n') " Close completion menu
		call feedkeys("\<tab>") | return ''
	endif

	if exists('g:snipPos') | return snipMate#jumpTabStop(0) | endif

	let word = matchstr(getline('.'), '\S\+\%'.col('.').'c')
	for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
		let [trigger, snippet] = s:GetSnippet(word, scope)
		" If word is a trigger for a snippet, delete the trigger & expand
		" the snippet.
		if snippet != ''
			let col = col('.') - len(trigger)
			sil exe 's/\V'.escape(trigger, '/\.').'\%#//'
			return snipMate#expandSnip(snippet, col)
		endif
	endfor

	if exists('SuperTabKey')
		call feedkeys(SuperTabKey)
		return ''
	endif
	return "\<tab>"
endf

fun! BackwardsSnippet()
	if exists('g:snipPos') | return snipMate#jumpTabStop(1) | endif

	if exists('g:SuperTabMappingForward')
		if g:SuperTabMappingBackward == "<s-tab>"
			let SuperTabKey = "\<c-p>"
		elseif g:SuperTabMappingForward == "<s-tab>"
			let SuperTabKey = "\<c-n>"
		endif
	endif
	if exists('SuperTabKey')
		call feedkeys(SuperTabKey)
		return ''
	endif
	return "\<s-tab>"
endf

" Check if word under cursor is snippet trigger; if it isn't, try checking if
" the text after non-word characters is (e.g. check for "foo" in "bar.foo")
fun s:GetSnippet(word, scope)
	let word = a:word | let snippet = ''
	while snippet == ''
		if exists('s:snippets["'.a:scope.'"]["'.escape(word, '\"').'"]')
			let snippet = s:snippets[a:scope][word]
		elseif exists('s:multi_snips["'.a:scope.'"]["'.escape(word, '\"').'"]')
			let snippet = s:ChooseSnippet(a:scope, word)
			if snippet == '' | break | endif
		else
			if match(word, '\W') == -1 | break | endif
			let word = substitute(word, '.\{-}\W', '', '')
		endif
	endw
	if word == '' && a:word != '.' && stridx(a:word, '.') != -1
		let [word, snippet] = s:GetSnippet('.', a:scope)
	endif
	return [word, snippet]
endf

fun s:ChooseSnippet(scope, trigger)
	let snippet = []
	let i = 1
	for snip in s:multi_snips[a:scope][a:trigger]
		let snippet += [i.'. '.snip[0]]
		let i += 1
	endfor
	if i == 2 | return s:multi_snips[a:scope][a:trigger][0][1] | endif
	let num = inputlist(snippet) - 1
	return num == -1 ? '' : s:multi_snips[a:scope][a:trigger][num][1]
endf

fun! ShowAvailableSnips()
	let line  = getline('.')
	let col   = col('.')
	let word  = matchstr(getline('.'), '\S\+\%'.col.'c')
	let words = [word]
	if stridx(word, '.')
		let words += split(word, '\.', 1)
	endif
	let matchlen = 0
	let matches = []
	for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
		let triggers = has_key(s:snippets, scope) ? keys(s:snippets[scope]) : []
		if has_key(s:multi_snips, scope)
			let triggers += keys(s:multi_snips[scope])
		endif
		for trigger in triggers
			for word in words
				if word == ''
					let matches += [trigger] " Show all matches if word is empty
				elseif trigger =~ '^'.word
					let matches += [trigger]
					let len = len(word)
					if len > matchlen | let matchlen = len | endif
				endif
			endfor
		endfor
	endfor

	" This is to avoid a bug with Vim when using complete(col - matchlen, matches)
	" (Issue#46 on the Google Code snipMate issue tracker).
	call setline(line('.'), substitute(line, repeat('.', matchlen).'\%'.col.'c', '', ''))
	call complete(col, matches)
	return ''
endf
" vim:noet:sw=4:ts=4:ft=vim





"byffexplorer
"============================================================================
"    Copyright: Copyright (c) 2001-2018, Jeff Lanzarotta
"               All rights reserved.
"
"               Redistribution and use in source and binary forms, with or
"               without modification, are permitted provided that the
"               following conditions are met:
"
"               * Redistributions of source code must retain the above
"                 copyright notice, this list of conditions and the following
"                 disclaimer.
"
"               * Redistributions in binary form must reproduce the above
"                 copyright notice, this list of conditions and the following
"                 disclaimer in the documentation and/or other materials
"                 provided with the distribution.
"
"               * Neither the name of the {organization} nor the names of its
"                 contributors may be used to endorse or promote products
"                 derived from this software without specific prior written
"                 permission.
"
"               THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
"               CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
"               INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
"               MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
"               DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
"               CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
"               SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
"               NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
"               LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
"               HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
"               CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
"               OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
"               EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" Name Of File: bufexplorer.vim
"  Description: Buffer Explorer Vim Plugin
"   Maintainer: Jeff Lanzarotta (delux256-vim at outlook dot com)
" Last Changed: Saturday, 08 December 2018
"      Version: See g:bufexplorer_version for version number.
"        Usage: This file should reside in the plugin directory and be
"               automatically sourced.
"
"               You may use the default keymappings of
"
"                 <Leader>be  - Opens BufExplorer
"                 <Leader>bt  - Toggles BufExplorer open or closed
"                 <Leader>bs  - Opens horizontally split window BufExplorer
"                 <Leader>bv  - Opens vertically split window BufExplorer
"
"               Or you can override the defaults and define your own mapping
"               in your vimrc file, for example:
"
"                   nnoremap <silent> <F11> :BufExplorer<CR>
"                   nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
"                   nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
"                   nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>
"
"               Or you can use
"
"                 ":BufExplorer"                - Opens BufExplorer
"                 ":ToggleBufExplorer"          - Opens/Closes BufExplorer
"                 ":BufExplorerHorizontalSplit" - Opens horizontally window BufExplorer
"                 ":BufExplorerVerticalSplit"   - Opens vertically split window BufExplorer
"
"               For more help see supplied documentation.
"      History: See supplied documentation.
"=============================================================================

" Exit quickly if already running or when 'compatible' is set. {{{1
if exists("g:bufexplorer_version") || &cp
    finish
endif
"1}}}

" Version number
let g:bufexplorer_version = "7.4.21"

" Plugin Code {{{1
" Check for Vim version {{{2
if !exists("g:bufExplorerVersionWarn")
    let g:bufExplorerVersionWarn = 1
endif

if v:version < 700
    if g:bufExplorerVersionWarn
        echohl WarningMsg
        echo "Sorry, bufexplorer ".g:bufexplorer_version." required Vim 7.0 or greater."
        echohl None
    endif
    finish
endif
" Check to see if the version of Vim has the correct patch applied, if not, do
" not used <nowait>.
if v:version > 703 || v:version == 703 && has('patch1261') && has('patch1264')
    " We are good to go.
else
    if g:bufExplorerVersionWarn
        echohl WarningMsg
        echo "Sorry, bufexplorer ".g:bufexplorer_version." required Vim 7.3 or greater with patch1261 and patch1264."
        echohl None
    endif
    finish
endif

" Create commands {{{2
command! BufExplorer :call BufExplorer()
command! ToggleBufExplorer :call ToggleBufExplorer()
command! BufExplorerHorizontalSplit :call BufExplorerHorizontalSplit()
command! BufExplorerVerticalSplit :call BufExplorerVerticalSplit()

" Set {{{2
function! s:Set(var, default)
    if !exists(a:var)
        if type(a:default)
            execute "let" a:var "=" string(a:default)
        else
            execute "let" a:var "=" a:default
        endif

        return 1
    endif

    return 0
endfunction

" Script variables {{{2
let s:MRU_Exclude_List = ["[BufExplorer]","__MRU_Files__","[Buf\ List]"]
let s:MRUList = []
let s:name = '[BufExplorer]'
let s:originBuffer = 0
let s:running = 0
let s:sort_by = ["number", "name", "fullpath", "mru", "extension"]
let s:splitMode = ""
let s:types = {"fullname": ':p', "path": ':p:h', "relativename": ':~:.', "relativepath": ':~:.:h', "shortname": ':t'}

" Setup the autocommands that handle the MRUList and other stuff. {{{2
autocmd VimEnter * call s:Setup()

" Setup {{{2
function! s:Setup()
    call s:Reset()

    " Now that the MRUList is created, add the other autocmds.
    augroup BufExplorer
        autocmd!
        autocmd BufEnter,BufNew * call s:ActivateBuffer()
        autocmd BufWipeOut * call s:DeactivateBuffer(1)
        autocmd BufDelete * call s:DeactivateBuffer(0)
        autocmd BufWinEnter \[BufExplorer\] call s:Initialize()
        autocmd BufWinLeave \[BufExplorer\] call s:Cleanup()
    augroup END
endfunction

" Reset {{{2
function! s:Reset()
    " Build initial MRUList. This makes sure all the files specified on the
    " command line are picked up correctly.
    let s:MRUList = range(1, bufnr('$'))

    " Initialize the association of buffers to tabs for any buffers
    " that have been created prior to now, e.g., files specified as
    " vim command line arguments
    call s:CatalogBuffers()
endfunction

" CatalogBuffers {{{2
" Create tab associations for any existing buffers
function! s:CatalogBuffers()
    let ct = tabpagenr()

    for tab in range(1, tabpagenr('$'))
        silent execute 'normal! ' . tab . 'gt'
        for buf in tabpagebuflist()
            call s:UpdateTabBufData(buf)
        endfor
    endfor

    silent execute 'normal! ' . ct . 'gt'
endfunction

" AssociatedTab {{{2
" Return the number of the tab associated with the specified buffer.
" If the buffer is associated with more than one tab, the first one
" found is returned. If the buffer is not associated with any tabs,
" -1 is returned.
function! s:AssociatedTab(bufnr)
    for tab in range(1, tabpagenr('$'))
        let list = gettabvar(tab, 'bufexp_buf_list', [])
        let idx = index(list, a:bufnr)
        if idx != -1
            return tab
        endif
    endfor

    return -1
endfunction

" RemoveBufFromOtherTabs {{{2
" Remove the specified buffer from the buffer lists of all tabs
" except the current tab.
function! s:RemoveBufFromOtherTabs(bufnr)
    for tab in range(1, tabpagenr('$'))
        if tab == tabpagenr()
            continue
        endif

        let list = gettabvar(tab, 'bufexp_buf_list', [])
        let idx = index(list, a:bufnr)
        if idx == -1
            continue
        endif

        call remove(list, idx)
        call settabvar(tab, 'bufexp_buf_list', list)
    endfor
endfunction

" AddBufToCurrentTab {{{2
" Add the specified buffer to the list of buffers associated
" with the current tab
function! s:AddBufToCurrentTab(bufnr)
    if index(t:bufexp_buf_list, a:bufnr) == -1
        call add(t:bufexp_buf_list, a:bufnr)
    endif
endfunction

" IsInCurrentTab {{{2
" Returns whether the specified buffer is associated
" with the current tab
function! s:IsInCurrentTab(bufnr)
    " It shouldn't happen that the list of buffers is
    " not defined but if it does, play it safe and
    " include the buffer
    if !exists('t:bufexp_buf_list')
        return 1
    endif

    return (index(t:bufexp_buf_list, a:bufnr) != -1)
endfunction

" UpdateTabBufData {{{2
" Update the tab buffer data for the specified buffer
"
" The current tab's list is updated. If a buffer is only
" allowed to be associated with one tab, it is removed
" from the lists of any other tabs with which it may have
" been associated.
"
" The associations between tabs and buffers are maintained
" in separate lists for each tab, which are stored in tab-
" specific variables 't:bufexp_buf_list'.
function! s:UpdateTabBufData(bufnr)
    " The first time we add a tab, Vim uses the current buffer
    " as its starting page even though we are about to edit a
    " new page, and another BufEnter for the new page is triggered
    " later. Use this first BufEnter to initialize the list of
    " buffers, but don't add the buffer number to the list if
    " it is already associated with another tab
    "
    " Unfortunately, this doesn't work right when the first
    " buffer opened in the tab should be associated with it,
    " such as when 'tab split +buffer N' is used
    if !exists("t:bufexp_buf_list")
        let t:bufexp_buf_list = []

        if s:AssociatedTab(a:bufnr) != -1
            return
        endif
    endif

    call s:AddBufToCurrentTab(a:bufnr)

    if g:bufExplorerOnlyOneTab
        call s:RemoveBufFromOtherTabs(a:bufnr)
    endif
endfunction

" ActivateBuffer {{{2
function! s:ActivateBuffer()
    let _bufnr = bufnr("%")
    call s:UpdateTabBufData(_bufnr)
    call s:MRUPush(_bufnr)
endfunction

" DeactivateBuffer {{{2
function! s:DeactivateBuffer(remove)
    let _bufnr = str2nr(expand("<abuf>"))
    call s:MRUPop(_bufnr)
endfunction

" MRUPop {{{2
function! s:MRUPop(bufnr)
    call filter(s:MRUList, 'v:val != '.a:bufnr)
endfunction

" MRUPush {{{2
function! s:MRUPush(buf)
    " Skip temporary buffer with buftype set. Don't add the BufExplorer window
    " to the list.
    if s:ShouldIgnore(a:buf) == 1
        return
    endif

    " Remove the buffer number from the list if it already exists.
    call s:MRUPop(a:buf)

    " Add the buffer number to the head of the list.
    call insert(s:MRUList, a:buf)
endfunction

" ShouldIgnore {{{2
function! s:ShouldIgnore(buf)
    " Ignore temporary buffers with buftype set.
    if empty(getbufvar(a:buf, "&buftype") == 0)
        return 1
    endif

    " Ignore buffers with no name.
    if empty(bufname(a:buf)) == 1
        return 1
    endif

    " Ignore the BufExplorer buffer.
    if fnamemodify(bufname(a:buf), ":t") == s:name
        return 1
    endif

    " Ignore any buffers in the exclude list.
    if index(s:MRU_Exclude_List, bufname(a:buf)) >= 0
        return 1
    endif

    " Else return 0 to indicate that the buffer was not ignored.
    return 0
endfunction

" Initialize {{{2
function! s:Initialize()
    call s:SetLocalSettings()
    let s:running = 1
endfunction

" Cleanup {{{2
function! s:Cleanup()
    if exists("s:_insertmode")
        let &insertmode = s:_insertmode
    endif

    if exists("s:_showcmd")
        let &showcmd = s:_showcmd
    endif

    if exists("s:_cpo")
        let &cpo = s:_cpo
    endif

    if exists("s:_report")
        let &report = s:_report
    endif

    let s:running = 0
    let s:splitMode = ""

    delmarks!
endfunction

" SetLocalSettings {{{2
function! s:SetLocalSettings()
    let s:_insertmode = &insertmode
    set noinsertmode

    let s:_showcmd = &showcmd
    set noshowcmd

    let s:_cpo = &cpo
    set cpo&vim

    let s:_report = &report
    let &report = 10000

    setlocal nonumber
    setlocal foldcolumn=0
    setlocal nofoldenable
    setlocal cursorline
    setlocal nospell
    setlocal nobuflisted
    setlocal filetype=bufexplorer
endfunction

" BufExplorerHorizontalSplit {{{2
function! BufExplorerHorizontalSplit()
    let s:splitMode = "sp"
    execute "BufExplorer"
endfunction

" BufExplorerVerticalSplit {{{2
function! BufExplorerVerticalSplit()
    let s:splitMode = "vsp"
    execute "BufExplorer"
endfunction

" ToggleBufExplorer {{{2
function! ToggleBufExplorer()
    if exists("s:running") && s:running == 1 && bufname(winbufnr(0)) == s:name
        call s:Close()
    else
        call BufExplorer()
    endif
endfunction

" BufExplorer {{{2
function! BufExplorer()
    let name = s:name

    if !has("win32")
        " On non-Windows boxes, escape the name so that is shows up correctly.
        let name = escape(name, "[]")
    endif

    " Make sure there is only one explorer open at a time.
    if s:running == 1
        " Go to the open buffer.
        if has("gui")
            execute "drop" name
        endif

        return
    endif

    " Add zero to ensure the variable is treated as a number.
    let s:originBuffer = bufnr("%") + 0

    silent let s:raw_buffer_listing = s:GetBufferInfo(0)

    " We may have to split the current window.
    if s:splitMode != ""
        " Save off the original settings.
        let [_splitbelow, _splitright] = [&splitbelow, &splitright]

        " Set the setting to ours.
        let [&splitbelow, &splitright] = [g:bufExplorerSplitBelow, g:bufExplorerSplitRight]
        let _size = (s:splitMode == "sp") ? g:bufExplorerSplitHorzSize : g:bufExplorerSplitVertSize

        " Split the window either horizontally or vertically.
        if _size <= 0
            execute 'keepalt ' . s:splitMode
        else
            execute 'keepalt ' . _size . s:splitMode
        endif

        " Restore the original settings.
        let [&splitbelow, &splitright] = [_splitbelow, _splitright]
    endif

    if !exists("b:displayMode") || b:displayMode != "winmanager"
        " Do not use keepalt when opening bufexplorer to allow the buffer that
        " we are leaving to become the new alternate buffer
        execute "silent keepjumps hide edit".name
    endif

    call s:DisplayBufferList()

    " Position the cursor in the newly displayed list on the line representing
    " the active buffer.  The active buffer is the line with the '%' character
    " in it.
    execute search("%")
endfunction

" DisplayBufferList {{{2
function! s:DisplayBufferList()
    " Do not set bufhidden since it wipes out the data if we switch away from
    " the buffer using CTRL-^.
    setlocal buftype=nofile
    setlocal modifiable
    setlocal noswapfile
    setlocal nowrap

    call s:SetupSyntax()
    call s:MapKeys()

    " Wipe out any existing lines in case BufExplorer buffer exists and the
    " user had changed any global settings that might reduce the number of
    " lines needed in the buffer.
    silent keepjumps 1,$d _

    call setline(1, s:CreateHelp())
    call s:BuildBufferList()
    call cursor(s:firstBufferLine, 1)

    if !g:bufExplorerResize
        normal! zz
    endif

    setlocal nomodifiable
endfunction

" MapKeys {{{2
function! s:MapKeys()
    if exists("b:displayMode") && b:displayMode == "winmanager"
        nnoremap <buffer> <silent> <tab> :call <SID>SelectBuffer()<CR>
    endif

    nnoremap <script> <silent> <nowait> <buffer> <2-leftmouse> :call <SID>SelectBuffer()<CR>
    nnoremap <script> <silent> <nowait> <buffer> <CR>          :call <SID>SelectBuffer()<CR>
    nnoremap <script> <silent> <nowait> <buffer> <F1>          :call <SID>ToggleHelp()<CR>
    nnoremap <script> <silent> <nowait> <buffer> <s-cr>        :call <SID>SelectBuffer("tab")<CR>
    nnoremap <script> <silent> <nowait> <buffer> a             :call <SID>ToggleFindActive()<CR>
    nnoremap <script> <silent> <nowait> <buffer> b             :call <SID>SelectBuffer("ask")<CR>
    nnoremap <script> <silent> <nowait> <buffer> d             :call <SID>RemoveBuffer("delete")<CR>
    xnoremap <script> <silent> <nowait> <buffer> d             :call <SID>RemoveBuffer("delete")<CR>
    nnoremap <script> <silent> <nowait> <buffer> D             :call <SID>RemoveBuffer("wipe")<CR>
    xnoremap <script> <silent> <nowait> <buffer> D             :call <SID>RemoveBuffer("wipe")<CR>
    nnoremap <script> <silent> <nowait> <buffer> f             :call <SID>SelectBuffer("split", "sb")<CR>
    nnoremap <script> <silent> <nowait> <buffer> F             :call <SID>SelectBuffer("split", "st")<CR>
    nnoremap <script> <silent> <nowait> <buffer> m             :call <SID>MRUListShow()<CR>
    nnoremap <script> <silent> <nowait> <buffer> o             :call <SID>SelectBuffer()<CR>
    nnoremap <script> <silent> <nowait> <buffer> p             :call <SID>ToggleSplitOutPathName()<CR>
    nnoremap <script> <silent> <nowait> <buffer> q             :call <SID>Close()<CR>
    nnoremap <script> <silent> <nowait> <buffer> r             :call <SID>SortReverse()<CR>
    nnoremap <script> <silent> <nowait> <buffer> R             :call <SID>ToggleShowRelativePath()<CR>
    nnoremap <script> <silent> <nowait> <buffer> s             :call <SID>SortSelect()<CR>
    nnoremap <script> <silent> <nowait> <buffer> S             :call <SID>ReverseSortSelect()<CR>
    nnoremap <script> <silent> <nowait> <buffer> t             :call <SID>SelectBuffer("tab")<CR>
    nnoremap <script> <silent> <nowait> <buffer> T             :call <SID>ToggleShowTabBuffer()<CR>
    nnoremap <script> <silent> <nowait> <buffer> u             :call <SID>ToggleShowUnlisted()<CR>
    nnoremap <script> <silent> <nowait> <buffer> v             :call <SID>SelectBuffer("split", "vr")<CR>
    nnoremap <script> <silent> <nowait> <buffer> V             :call <SID>SelectBuffer("split", "vl")<CR>

    for k in ["G", "n", "N", "L", "M", "H"]
        execute "nnoremap <buffer> <silent>" k ":keepjumps normal!" k."<CR>"
    endfor
endfunction

" SetupSyntax {{{2
function! s:SetupSyntax()
    if has("syntax")
        syn match bufExplorerHelp     "^\".*" contains=bufExplorerSortBy,bufExplorerMapping,bufExplorerTitle,bufExplorerSortType,bufExplorerToggleSplit,bufExplorerToggleOpen
        syn match bufExplorerOpenIn   "Open in \w\+ window" contained
        syn match bufExplorerSplit    "\w\+ split" contained
        syn match bufExplorerSortBy   "Sorted by .*" contained contains=bufExplorerOpenIn,bufExplorerSplit
        syn match bufExplorerMapping  "\" \zs.\+\ze :" contained
        syn match bufExplorerTitle    "Buffer Explorer.*" contained
        syn match bufExplorerSortType "'\w\{-}'" contained
        syn match bufExplorerBufNbr   /^\s*\d\+/
        syn match bufExplorerToggleSplit  "toggle split type" contained
        syn match bufExplorerToggleOpen   "toggle open mode" contained

        syn match bufExplorerModBuf    /^\s*\d\+.\{4}+.*/
        syn match bufExplorerLockedBuf /^\s*\d\+.\{3}[\-=].*/
        syn match bufExplorerHidBuf    /^\s*\d\+.\{2}h.*/
        syn match bufExplorerActBuf    /^\s*\d\+.\{2}a.*/
        syn match bufExplorerCurBuf    /^\s*\d\+.%.*/
        syn match bufExplorerAltBuf    /^\s*\d\+.#.*/
        syn match bufExplorerUnlBuf    /^\s*\d\+u.*/
        syn match bufExplorerInactBuf  /^\s*\d\+ \{7}.*/

        hi def link bufExplorerBufNbr Number
        hi def link bufExplorerMapping NonText
        hi def link bufExplorerHelp Special
        hi def link bufExplorerOpenIn Identifier
        hi def link bufExplorerSortBy String
        hi def link bufExplorerSplit NonText
        hi def link bufExplorerTitle NonText
        hi def link bufExplorerSortType bufExplorerSortBy
        hi def link bufExplorerToggleSplit bufExplorerSplit
        hi def link bufExplorerToggleOpen bufExplorerOpenIn

        hi def link bufExplorerActBuf Identifier
        hi def link bufExplorerAltBuf String
        hi def link bufExplorerCurBuf Type
        hi def link bufExplorerHidBuf Constant
        hi def link bufExplorerLockedBuf Special
        hi def link bufExplorerModBuf Exception
        hi def link bufExplorerUnlBuf Comment
        hi def link bufExplorerInactBuf Comment
    endif
endfunction

" ToggleHelp {{{2
function! s:ToggleHelp()
    let g:bufExplorerDetailedHelp = !g:bufExplorerDetailedHelp

    setlocal modifiable

    " Save position.
    normal! ma

    " Remove old header.
    if s:firstBufferLine > 1
        execute "keepjumps 1,".(s:firstBufferLine - 1) "d _"
    endif

    call append(0, s:CreateHelp())

    silent! normal! g`a
    delmarks a

    setlocal nomodifiable

    if exists("b:displayMode") && b:displayMode == "winmanager"
        call WinManagerForceReSize("BufExplorer")
    endif
endfunction

" GetHelpStatus {{{2
function! s:GetHelpStatus()
    let ret = '" Sorted by '.((g:bufExplorerReverseSort == 1) ? "reverse " : "").g:bufExplorerSortBy
    let ret .= ' | '.((g:bufExplorerFindActive == 0) ? "Don't " : "")."Locate buffer"
    let ret .= ((g:bufExplorerShowUnlisted == 0) ? "" : " | Show unlisted")
    let ret .= ((g:bufExplorerShowTabBuffer == 0) ? "" : " | Show buffers/tab")
    let ret .= ((g:bufExplorerOnlyOneTab == 0) ? "" : " | One tab/buffer")
    let ret .= ' | '.((g:bufExplorerShowRelativePath == 0) ? "Absolute" : "Relative")
    let ret .= ' '.((g:bufExplorerSplitOutPathName == 0) ? "Full" : "Split")." path"

    return ret
endfunction

" CreateHelp {{{2
function! s:CreateHelp()
    if g:bufExplorerDefaultHelp == 0 && g:bufExplorerDetailedHelp == 0
        let s:firstBufferLine = 1
        return []
    endif

    let header = []

    if g:bufExplorerDetailedHelp == 1
        call add(header, '" Buffer Explorer ('.g:bufexplorer_version.')')
        call add(header, '" --------------------------')
        call add(header, '" <F1> : toggle this help')
        call add(header, '" <enter> or o or Mouse-Double-Click : open buffer under cursor')
        call add(header, '" <shift-enter> or t : open buffer in another tab')
        call add(header, '" a : toggle find active buffer')
        call add(header, '" b : Fast buffer switching with b<any bufnum>')
        call add(header, '" B : toggle if to save/use recent tab or not')
        call add(header, '" d : delete buffer')
        call add(header, '" D : wipe buffer')
        call add(header, '" F : open buffer in another window above the current')
        call add(header, '" f : open buffer in another window below the current')
        call add(header, '" p : toggle splitting of file and path name')
        call add(header, '" q : quit')
        call add(header, '" r : reverse sort')
        call add(header, '" R : toggle showing relative or full paths')
        call add(header, '" s : cycle thru "sort by" fields '.string(s:sort_by).'')
        call add(header, '" S : reverse cycle thru "sort by" fields')
        call add(header, '" T : toggle if to show only buffers for this tab or not')
        call add(header, '" u : toggle showing unlisted buffers')
        call add(header, '" V : open buffer in another window on the left of the current')
        call add(header, '" v : open buffer in another window on the right of the current')
    else
        call add(header, '" Press <F1> for Help')
    endif

    if (!exists("b:displayMode") || b:displayMode != "winmanager") || (b:displayMode == "winmanager" && g:bufExplorerDetailedHelp == 1)
        call add(header, s:GetHelpStatus())
        call add(header, '"=')
    endif

    let s:firstBufferLine = len(header) + 1

    return header
endfunction

" GetBufferInfo {{{2
function! s:GetBufferInfo(bufnr)
    redir => bufoutput

    " Show all buffers including the unlisted ones. [!] tells Vim to show the
    " unlisted ones.
    buffers!
    redir END

    if a:bufnr > 0
        " Since we are only interested in this specified buffer
        " remove the other buffers listed
        let bufoutput = substitute(bufoutput."\n", '^.*\n\(\s*'.a:bufnr.'\>.\{-}\)\n.*', '\1', '')
    endif

    let [all, allwidths, listedwidths] = [[], {}, {}]

    for n in keys(s:types)
        let allwidths[n] = []
        let listedwidths[n] = []
    endfor

    " Loop over each line in the buffer.
    for buf in split(bufoutput, '\n')
        let bits = split(buf, '"')

        " Use first and last components after the split on '"', in case a
        " filename with an embedded '"' is present.
        let b = {"attributes": bits[0], "line": substitute(bits[-1], '\s*', '', '')}

        let name = bufname(str2nr(b.attributes))
        let b["hasNoName"] = empty(name)
        if b.hasNoName
            let name = "[No Name]"
        endif

        for [key, val] in items(s:types)
            let b[key] = fnamemodify(name, val)
        endfor

        if getftype(b.fullname) == "dir" && g:bufExplorerShowDirectories == 1
            let b.shortname = "<DIRECTORY>"
        endif

        call add(all, b)

        for n in keys(s:types)
            call add(allwidths[n], s:StringWidth(b[n]))

            if b.attributes !~ "u"
                call add(listedwidths[n], s:StringWidth(b[n]))
            endif
        endfor
    endfor

    let [s:allpads, s:listedpads] = [{}, {}]

    for n in keys(s:types)
        let s:allpads[n] = repeat(' ', max(allwidths[n]))
        let s:listedpads[n] = repeat(' ', max(listedwidths[n]))
    endfor

    return all
endfunction

" BuildBufferList {{{2
function! s:BuildBufferList()
    let lines = []

    " Loop through every buffer.
    for buf in s:raw_buffer_listing
        " Skip unlisted buffers if we are not to show them.
        if !g:bufExplorerShowUnlisted && buf.attributes =~ "u"
            " Skip unlisted buffers if we are not to show them.
            continue
        endif

        " Skip "No Name" buffers if we are not to show them.
        if g:bufExplorerShowNoName == 0 && buf.hasNoName
            continue
        endif

        " Are we to show only buffer(s) for this tab?
        if g:bufExplorerShowTabBuffer && (!s:IsInCurrentTab(str2nr(buf.attributes)))
            continue
        endif

        let line = buf.attributes." "

        if exists("g:loaded_webdevicons")
            let line .= WebDevIconsGetFileTypeSymbol(buf.shortname)
            let line .= " "
        endif

        " Are we to split the path and file name?
        if g:bufExplorerSplitOutPathName
            let type = (g:bufExplorerShowRelativePath) ? "relativepath" : "path"
            let path = buf[type]
            let pad  = (g:bufExplorerShowUnlisted) ? s:allpads.shortname : s:listedpads.shortname
            let line .= buf.shortname." ".strpart(pad.path, s:StringWidth(buf.shortname))
        else
            let type = (g:bufExplorerShowRelativePath) ? "relativename" : "fullname"
            let path = buf[type]
            let line .= path
        endif

        let pads = (g:bufExplorerShowUnlisted) ? s:allpads : s:listedpads

        if !empty(pads[type])
            let line .= strpart(pads[type], s:StringWidth(path))." "
        endif

        let line .= buf.line

        call add(lines, line)
    endfor

    call setline(s:firstBufferLine, lines)
    call s:SortListing()
endfunction

" SelectBuffer {{{2
function! s:SelectBuffer(...)
    " Sometimes messages are not cleared when we get here so it looks like an
    " error has occurred when it really has not.
    "echo ""

    let _bufNbr = -1

    if (a:0 == 1) && (a:1 == "ask")
        " Ask the user for input.
        call inputsave()
        let cmd = input("Enter buffer number to switch to: ")
        call inputrestore()

        " Clear the message area from the previous prompt.
        redraw | echo

        if strlen(cmd) > 0
            let _bufNbr = str2nr(cmd)
        else
            call s:Error("Invalid buffer number, try again.")
            return
        endif
    else
        " Are we on a line with a file name?
        if line('.') < s:firstBufferLine
            execute "normal! \<CR>"
            return
        endif

        let _bufNbr = str2nr(getline('.'))

        " Check and see if we are running BufferExplorer via WinManager.
        if exists("b:displayMode") && b:displayMode == "winmanager"
            let _bufName = expand("#"._bufNbr.":p")

            if (a:0 == 1) && (a:1 == "tab")
                call WinManagerFileEdit(_bufName, 1)
            else
                call WinManagerFileEdit(_bufName, 0)
            endif

            return
        endif
    endif

    if bufexists(_bufNbr)
        if bufnr("#") == _bufNbr && !exists("g:bufExplorerChgWin")
            return s:Close()
        endif

        " Get the tab number where this bufer is located in.
        let tabNbr = s:GetTabNbr(_bufNbr)
        " Are we supposed to open the selected buffer in a tab?
        if (a:0 == 1) && (a:1 == "tab")

            " Restore [BufExplorer] buffer.
            execute "silent buffer!".s:originBuffer

            " Was the tab found?
            if tabNbr == 0
                " _bufNbr is not opened in any tabs. Open a new tab with the
                " selected buffer in it.
                if v:version > 704 || ( v:version == 704 && has('patch2237') )
                    " new syntax for last tab as of 7.4.2237
                    execute "$tab split +buffer" . _bufNbr
                else
                    execute "999tab split +buffer" . _bufNbr
                endif

                " Workaround for the issue mentioned in UpdateTabBufData.
                call s:UpdateTabBufData(_bufNbr)
            else
                " The _bufNbr is already opened in a tab, go to that tab.
                execute tabNbr . "tabnext"

                " Focus window.
                execute s:GetWinNbr(tabNbr, _bufNbr) . "wincmd w"
            endif
            " Are we supposed to open the selected buffer in a split?
        elseif (a:0 == 2) && (a:1 == "split")
            if g:bufExplorerFindActive
                call s:Close()
            endif
            " Was the tab found?
            if tabNbr != 0
                " Yes, the buffer is located in a tab. Go to that tab instead of
                " opening split
                execute tabNbr . "tabnext"
            else
                "Nope, the buffer is not in a tab, open it accordingly
                let _bufName = expand("#"._bufNbr.":p")
                if (a:2 == "vl")
                    execute _bufName ?
                                \ "vert topleft sb ".escape(_bufName, " ") :
                                \ "vert topleft sb "._bufNbr
                elseif (a:2 == "vr")
                    execute _bufName ?
                                \ "vert belowright sb ".escape(_bufName, " ") :
                                \ "vert belowright sb "._bufNbr
                elseif (a:2 == "st")
                    execute _bufName ?
                                \ "topleft sb ".escape(_bufName, " ") :
                                \ "topleft sb "._bufNbr
                else " = sb
                    execute _bufName ?
                                \ "belowright sb ".escape(_bufName, " ") :
                                \ "belowright sb "._bufNbr
                endif
            endif

            " Switch to selected buffer
            execute "keepalt silent b!" _bufNbr
            " Default, open in current window
        else
            " Are we suppose to move to the tab where the active buffer is?
            if exists("g:bufExplorerChgWin")
                execute g:bufExplorerChgWin."wincmd w"
            elseif bufloaded(_bufNbr) && g:bufExplorerFindActive
                if g:bufExplorerFindActive
                    call s:Close()
                endif

                " Was the tab found?
                if tabNbr != 0
                    " Yes, the buffer is located in a tab. Go to that tab number.
                    execute tabNbr . "tabnext"
                else
                    "Nope, the buffer is not in a tab. Simply switch to that
                    "buffer.
                    let _bufName = expand("#"._bufNbr.":p")
                    execute _bufName ? "drop ".escape(_bufName, " ") : "buffer "._bufNbr
                endif
            endif

            " Switch to the selected buffer.
            execute "keepjumps keepalt silent b!" _bufNbr
        endif

        " Make the buffer 'listed' again.
        call setbufvar(_bufNbr, "&buflisted", "1")

        " Call any associated function references. g:bufExplorerFuncRef may be
        " an individual function reference or it may be a list containing
        " function references. It will ignore anything that's not a function
        " reference.
        "
        " See  :help FuncRef  for more on function references.
        if exists("g:BufExplorerFuncRef")
            if type(g:BufExplorerFuncRef) == 2
                keepj call g:BufExplorerFuncRef()
            elseif type(g:BufExplorerFuncRef) == 3
                for FncRef in g:BufExplorerFuncRef
                    if type(FncRef) == 2
                        keepj call FncRef()
                    endif
                endfor
            endif
        endif
    else
        call s:Error("Sorry, that buffer no longer exists, please select another")
        call s:DeleteBuffer(_bufNbr, "wipe")
    endif
endfunction

" RemoveBuffer {{{2
function! s:RemoveBuffer(mode)
    " Are we on a line with a file name?
    if line('.') < s:firstBufferLine
        return
    endif

    let mode = a:mode

    " These commands are to temporarily suspend the activity of winmanager.
    if exists("b:displayMode") && b:displayMode == "winmanager"
        call WinManagerSuspendAUs()
    end

    let _bufNbr = str2nr(getline('.'))

    if getbufvar(_bufNbr, '&modified') == 1
        " Calling confirm() requires Vim built with dialog option
        if !has("dialog_con") && !has("dialog_gui")
            call s:Error("Sorry, no write since last change for buffer "._bufNbr.", unable to delete")
            return
        endif

        let answer = confirm('No write since last change for buffer '._bufNbr.'. Delete anyway?', "&Yes\n&No", 2)

        if a:mode == "delete" && answer == 1
            let mode = "force_delete"
        elseif a:mode == "wipe" && answer == 1
            let mode = "force_wipe"
        else
            return
        endif

    endif

    " Okay, everything is good, delete or wipe the buffer.
    call s:DeleteBuffer(_bufNbr, mode)

    " Reactivate winmanager autocommand activity.
    if exists("b:displayMode") && b:displayMode == "winmanager"
        call WinManagerForceReSize("BufExplorer")
        call WinManagerResumeAUs()
    end
endfunction

" DeleteBuffer {{{2
function! s:DeleteBuffer(buf, mode)
    " This routine assumes that the buffer to be removed is on the current line.
    try
        " Wipe/Delete buffer from Vim.
        if a:mode == "wipe"
            execute "silent bwipe" a:buf
        elseif a:mode == "force_wipe"
            execute "silent bwipe!" a:buf
        elseif a:mode == "force_delete"
            execute "silent bdelete!" a:buf
        else
            execute "silent bdelete" a:buf
        endif

        " Delete the buffer from the list on screen.
        setlocal modifiable
        normal! "_dd
        setlocal nomodifiable

        " Delete the buffer from the raw buffer list.
        call filter(s:raw_buffer_listing, 'v:val.attributes !~ " '.a:buf.' "')
    catch
        call s:Error(v:exception)
    endtry
endfunction

" ListedAndCurrentTab {{{2
" Returns whether the specified buffer is both listed and associated
" with the current tab
function! s:ListedAndCurrentTab(buf)
    return buflisted(a:buf) && s:IsInCurrentTab(a:buf)
endfunction

" Close {{{2
function! s:Close()
    " Get only the listed buffers associated with the current tab
    let listed = filter(copy(s:MRUList), "s:ListedAndCurrentTab(v:val)")
    if len(listed) == 0
        let listed = filter(range(1, bufnr('$')), "s:ListedAndCurrentTab(v:val)")
    endif

    " If we needed to split the main window, close the split one.
    if s:splitMode != "" && bufwinnr(s:originBuffer) != -1
        execute "wincmd c"
    endif

    " Check to see if there are anymore buffers listed.
    if len(listed) == 0
        " Since there are no buffers left to switch to, open a new empty
        " buffers.
        execute "enew"
    else
        " Since there are buffers left to switch to, switch to the previous and
        " then the current.
        for b in reverse(listed[0:1])
            execute "keepjumps silent b ".b
        endfor
    endif

    " Clear any messages.
    echo
endfunction

" ToggleSplitOutPathName {{{2
function! s:ToggleSplitOutPathName()
    let g:bufExplorerSplitOutPathName = !g:bufExplorerSplitOutPathName
    call s:RebuildBufferList()
    call s:UpdateHelpStatus()
endfunction

" ToggleShowRelativePath {{{2
function! s:ToggleShowRelativePath()
    let g:bufExplorerShowRelativePath = !g:bufExplorerShowRelativePath
    call s:RebuildBufferList()
    call s:UpdateHelpStatus()
endfunction

" ToggleShowTabBuffer {{{2
function! s:ToggleShowTabBuffer()
    let g:bufExplorerShowTabBuffer = !g:bufExplorerShowTabBuffer
    call s:RebuildBufferList(g:bufExplorerShowTabBuffer)
    call s:UpdateHelpStatus()
endfunction

" ToggleOnlyOneTab {{{2
function! s:ToggleOnlyOneTab()
    let g:bufExplorerOnlyOneTab = !g:bufExplorerOnlyOneTab
    call s:RebuildBufferList()
    call s:UpdateHelpStatus()
endfunction

" ToggleShowUnlisted {{{2
function! s:ToggleShowUnlisted()
    let g:bufExplorerShowUnlisted = !g:bufExplorerShowUnlisted
    let num_bufs = s:RebuildBufferList(g:bufExplorerShowUnlisted == 0)
    call s:UpdateHelpStatus()
endfunction

" ToggleFindActive {{{2
function! s:ToggleFindActive()
    let g:bufExplorerFindActive = !g:bufExplorerFindActive
    call s:UpdateHelpStatus()
endfunction

" RebuildBufferList {{{2
function! s:RebuildBufferList(...)
    setlocal modifiable

    let curPos = getpos('.')

    if a:0 && a:000[0] && (line('$') >= s:firstBufferLine)
        " Clear the list first.
        execute "silent keepjumps ".s:firstBufferLine.',$d _'
    endif

    let num_bufs = s:BuildBufferList()

    call setpos('.', curPos)

    setlocal nomodifiable

    return num_bufs
endfunction

" UpdateHelpStatus {{{2
function! s:UpdateHelpStatus()
    setlocal modifiable

    let text = s:GetHelpStatus()
    call setline(s:firstBufferLine - 2, text)

    setlocal nomodifiable
endfunction

" MRUCmp {{{2
function! s:MRUCmp(line1, line2)
    return index(s:MRUList, str2nr(a:line1)) - index(s:MRUList, str2nr(a:line2))
endfunction

" SortReverse {{{2
function! s:SortReverse()
    let g:bufExplorerReverseSort = !g:bufExplorerReverseSort
    call s:ReSortListing()
endfunction

" SortSelect {{{2
function! s:SortSelect()
    let g:bufExplorerSortBy = get(s:sort_by, index(s:sort_by, g:bufExplorerSortBy) + 1, s:sort_by[0])
    call s:ReSortListing()
endfunction

" ReverseSortSelect {{{2
function! s:ReverseSortSelect()
    let g:bufExplorerSortBy = get(s:sort_by, index(s:sort_by, g:bufExplorerSortBy) - 1, s:sort_by[-1])
    call s:ReSortListing()
endfunction

" ReSortListing {{{2
function! s:ReSortListing()
    setlocal modifiable

    let curPos = getpos('.')

    call s:SortListing()
    call s:UpdateHelpStatus()

    call setpos('.', curPos)

    setlocal nomodifiable
endfunction

" SortListing {{{2
function! s:SortListing()
    let sort = s:firstBufferLine.",$sort".((g:bufExplorerReverseSort == 1) ? "!": "")

    if g:bufExplorerSortBy == "number"
        " Easiest case.
        execute sort 'n'
    elseif g:bufExplorerSortBy == "name"
        " Sort by full path first
        execute sort 'ir /\zs\f\+\ze\s\+line/'

        if g:bufExplorerSplitOutPathName
            execute sort 'ir /\d.\{7}\zs\f\+\ze/'
        else
            execute sort 'ir /\zs[^\/\\]\+\ze\s*line/'
        endif
    elseif g:bufExplorerSortBy == "fullpath"
        if g:bufExplorerSplitOutPathName
            " Sort twice - first on the file name then on the path.
            execute sort 'ir /\d.\{7}\zs\f\+\ze/'
        endif

        execute sort 'ir /\zs\f\+\ze\s\+line/'
    elseif g:bufExplorerSortBy == "extension"
        " Sort by full path...
        execute sort 'ir /\zs\f\+\ze\s\+line/'

        " Sort by name...
        if g:bufExplorerSplitOutPathName
            " Sort twice - first on the file name then on the path.
            execute sort 'ir /\d.\{7}\zs\f\+\ze/'
        endif

        " Sort by extension.
        execute sort 'ir /\.\zs\w\+\ze\s/'
    elseif g:bufExplorerSortBy == "mru"
        let l = getline(s:firstBufferLine, "$")

        call sort(l, "<SID>MRUCmp")

        if g:bufExplorerReverseSort
            call reverse(l)
        endif

        call setline(s:firstBufferLine, l)
    endif
endfunction

" MRUListShow {{{2
function! s:MRUListShow()
    echomsg "MRUList=".string(s:MRUList)
endfunction

" Error {{{2
" Display a message using ErrorMsg highlight group.
function! s:Error(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl None
endfunction

" Warning {{{2
" Display a message using WarningMsg highlight group.
function! s:Warning(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction

" GetTabNbr {{{2
function! s:GetTabNbr(bufNbr)
    " Searching buffer bufno, in tabs.
    for i in range(tabpagenr("$"))
        if index(tabpagebuflist(i + 1), a:bufNbr) != -1
            return i + 1
        endif
    endfor

    return 0
endfunction

" GetWinNbr" {{{2
function! s:GetWinNbr(tabNbr, bufNbr)
    " window number in tabpage.
    let tablist = tabpagebuflist(a:tabNbr)
    " Number:     0
    " String:     1
    " Funcref:    2
    " List:       3
    " Dictionary: 4
    " Float:      5
    if type(tablist) == 3
        return index(tabpagebuflist(a:tabNbr), a:bufNbr) + 1
    else
        return 1
    endif
endfunction

" StringWidth" {{{2
if exists('*strwidth')
    function s:StringWidth(s)
        return strwidth(a:s)
    endfunction
else
    function s:StringWidth(s)
        return len(a:s)
    endfunction
endif

" Winmanager Integration {{{2
let g:BufExplorer_title = "\[Buf\ List\]"
call s:Set("g:bufExplorerResize", 1)
call s:Set("g:bufExplorerMaxHeight", 25) " Handles dynamic resizing of the window.

" function! to start display. Set the mode to 'winmanager' for this buffer.
" This is to figure out how this plugin was called. In a standalone fashion
" or by winmanager.
function! BufExplorer_Start()
    let b:displayMode = "winmanager"
    call s:SetLocalSettings()
    call BufExplorer()
endfunction

" Returns whether the display is okay or not.
function! BufExplorer_IsValid()
    return 0
endfunction

" Handles dynamic refreshing of the window.
function! BufExplorer_Refresh()
    let b:displayMode = "winmanager"
    call s:SetLocalSettings()
    call BufExplorer()
endfunction

function! BufExplorer_ReSize()
    if !g:bufExplorerResize
        return
    end

    let nlines = min([line("$"), g:bufExplorerMaxHeight])

    execute nlines." wincmd _"

    " The following lines restore the layout so that the last file line is also
    " the last window line. Sometimes, when a line is deleted, although the
    " window size is exactly equal to the number of lines in the file, some of
    " the lines are pushed up and we see some lagging '~'s.
    let pres = getpos(".")

    normal! $

    let _scr = &scrolloff
    let &scrolloff = 0

    normal! z-

    let &scrolloff = _scr

    call setpos(".", pres)
endfunction

" Default values {{{2
call s:Set("g:bufExplorerDisableDefaultKeyMapping", 0)  " Do not disable default key mappings.
call s:Set("g:bufExplorerDefaultHelp", 1)               " Show default help?
call s:Set("g:bufExplorerDetailedHelp", 0)              " Show detailed help?
call s:Set("g:bufExplorerFindActive", 1)                " When selecting an active buffer, take you to the window where it is active?
call s:Set("g:bufExplorerOnlyOneTab", 1)                " If ShowTabBuffer = 1, only store the most recent tab for this buffer.
call s:Set("g:bufExplorerReverseSort", 0)               " Sort in reverse order by default?
call s:Set("g:bufExplorerShowDirectories", 1)           " (Dir's are added by commands like ':e .')
call s:Set("g:bufExplorerShowRelativePath", 0)          " Show listings with relative or absolute paths?
call s:Set("g:bufExplorerShowTabBuffer", 0)             " Show only buffer(s) for this tab?
call s:Set("g:bufExplorerShowUnlisted", 0)              " Show unlisted buffers?
call s:Set("g:bufExplorerShowNoName", 0)                " Show 'No Name' buffers?
call s:Set("g:bufExplorerSortBy", "mru")                " Sorting methods are in s:sort_by:
call s:Set("g:bufExplorerSplitBelow", &splitbelow)      " Should horizontal splits be below or above current window?
call s:Set("g:bufExplorerSplitOutPathName", 1)          " Split out path and file name?
call s:Set("g:bufExplorerSplitRight", &splitright)      " Should vertical splits be on the right or left of current window?
call s:Set("g:bufExplorerSplitVertSize", 0)             " Height for a vertical split. If <=0, default Vim size is used.
call s:Set("g:bufExplorerSplitHorzSize", 0)             " Height for a horizontal split. If <=0, default Vim size is used.

" Default key mapping {{{2
if !hasmapto('BufExplorer') && g:bufExplorerDisableDefaultKeyMapping == 0
    nnoremap <script> <silent> <unique> <Leader>be :BufExplorer<CR>
endif

if !hasmapto('ToggleBufExplorer') && g:bufExplorerDisableDefaultKeyMapping == 0
    nnoremap <script> <silent> <unique> <Leader>bt :ToggleBufExplorer<CR>
endif

if !hasmapto('BufExplorerVerticalSplit') && g:bufExplorerDisableDefaultKeyMapping == 0
    nnoremap <script> <silent> <unique> <Leader>bv :BufExplorerVerticalSplit<CR>
endif

" vim:ft=vim foldmethod=marker sw=4
