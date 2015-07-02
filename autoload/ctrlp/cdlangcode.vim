" =============================================================================
" File:          autoload/ctrlp/cdlangcode.vim
" Description:   Example extension for ctrlp.vim
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['cdlangcode']
"
" Where 'cdlangcode' is the name of the file 'cdlangcode.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ ]

" Load guard
if ( exists('g:loaded_ctrlp_cdlangcode') && g:loaded_ctrlp_cdlangcode )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_cdlangcode = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#cdlangcode#init()',
	\ 'accept': 'ctrlp#cdlangcode#accept',
	\ 'lname': 'cd',
	\ 'sname': 'cd',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#cdlangcode#enter()',
	\ 'exit': 'ctrlp#cdlangcode#exit()',
	\ 'opts': 'ctrlp#cdlangcode#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#cdlangcode#init()
	" let input = [
    " \ '/import/codeanalyzer/menghali/code/lang',
    " \ '/workspace/menghali/code/lang_code/lang',
    " \ '/home/menghali/lang_code/lang',
    " \ '/home/menghali/lang_code_3/lang',
	" 	\ ]
	" return input
  return g:ctrlp_cdlangcode_input
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#cdlangcode#accept(mode, str)
	" For this example, just exit ctrlp and run help
  exe "cd " . a:str
	call ctrlp#exit()
  NERDTreeCWD
  if (a:mode == 'v')
    silent !gnome-terminal --profile=zsh
    let ssh_command = "\"cd ".a:str."; bash\""
    let ccc = "silent !gnome-terminal --profile=sparc-S2-color -x ssh -t kaepernick-l4 " . ssh_command
    echo ccc
    " silent execute ccc
    call system(ccc)
  endif
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#cdlangcode#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#cdlangcode#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#cdlangcode#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#cdlangcode#id()
	return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/cdlangcode.vim
" command! CtrlPcdlangcode call ctrlp#init(ctrlp#cdlangcode#id())


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
