" Vim syntax file
" Language RTI
" Maintainer menghali
" Latest Revision: 04 May 2015

if exists("b:current_syntax")
  finish
endif

syntax match sectionHeader "\v*.*$"
highlight link sectionHeader PreProc

" syntax match slash contained "\/" 
syntax keyword componentKeyword COMPILER POSTOPT DISCOVER ENGINE INSTRUMENT
highlight link componentKeyword Constant

