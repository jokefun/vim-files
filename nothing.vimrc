set diffopt+=iwhite
set nu sts=4 ts=4 sw=4 et si ai
"ts=tabstop sts=softtabstop sw=shiftwidth
"et=expandtab, si=smart indent, ai=auto indent
set ruler hlsearch
set cul
set ignorecase

"set cursorcolumn  " Highlight the current column
set cursorline    " Highlight the current line
set colorcolumn=80

set showcmd showmode
set list
set listchars=tab:>⋅,trail:⋅,nbsp:⋅

"vertical/horizontal scroll off settings
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

syntax on
set background=dark
colorscheme solarized

set guifont=Monaco:h12

set nocompatible              " be iMproved
filetype off                  " required!  
set rtp+=~/.vim/bundle/vundle/
call vundle#rc() 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'terryma/vim-multiple-cursors'

Bundle 'tpope/vim-commentary'
autocmd FileType matlab set commentstring=%\ %s

Bundle 'terryma/vim-expand-region'
map <space> <Plug>(expand_region_expand)

Bundle 'junegunn/vim-easy-align'

Bundle 'jiangmiao/auto-pairs'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'

Bundle 'kien/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'

Bundle 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_custom_indent = 0
let g:LatexBox_show_warnings = 0

Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['cpp'] }

Bundle 'bling/vim-airline'
let g:airline_theme             = 'bubblegum'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
" let g:airline_powerline_fonts = 1 
set laststatus=2 " show airline even if only one file opened


filetype plugin indent on "on after vundle

nmap <CR> zz
" auto complete for omni-
inoremap <C-f><C-f> <C-x><C-o>


