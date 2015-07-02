set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

Plugin 'tpope/vim-commentary'
" cpp highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'terryma/vim-expand-region'
map <space> <Plug>(expand_region_expand)

Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" press <CTRL-x> to type in regular expression

Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

" Plugin 'Lokaltog/vim-easymotion'
" let g:EasyMotion_leader_key = 'f'
Plugin 'wilywampa/vim-easymotion'
" this version of easymotion works with vim 7.2
map f <Plug>(easymotion-prefix)

Plugin 'kien/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_max_depth = 1
let g:ctrlp_extensions = ['cdlangcode']
let g:ctrlp_cdlangcode_input =  [
      \ '/import/codeanalyzer/menghali/code/lang/postopt/src',
      \ '/workspace/menghali/code/lang_code/lang/postopt/src',
      \ '/home/menghali/lang_code/lang/postopt/src',
      \ '/home/menghali/lang_code_3/lang/postopt/src',
      \ '/import/codeanalyzer/menghali/workspace',
      \ '/workspace/menghali/workspace',
      \ ]


Plugin 'ivalkeen/vim-ctrlp-tjump'
let g:ctrlp_tjump_only_silent = 1
nnoremap <c-]> :CtrlPtjump<cr>
" nnoremap g] :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Plugin 'bling/vim-airline'
" let g:airline_theme             = 'bubblegum'
" let g:airline_enable_branch     = 1
" " let g:airline_enable_syntastic  = 1
" " let g:airline_powerline_fonts = 1
" set laststatus=2 " show airline even if only one file opened

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set diffopt+=iwhite
set nu sts=2 ts=8 sw=2 et si ai
"ts=tabstop sts=softtabstop sw=shiftwidth
"et=expandtab, si=smart indent, ai=auto indent
set ruler hlsearch
set cul
set ignorecase

"set cursorcolumn  " Highlight the current column
set cursorline    " Highlight the current line
"set colorcolumn=80

set showcmd showmode
" set list
set listchars=tab:>-,trail:-

"vertical/horizontal scroll off settings
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

"set background=dark
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"colorscheme solarized

if has('gui_running')
        set background=dark
        colorscheme gruvbox
        " colorscheme solarized
endif

set guioptions-=T  "remove toolbar"

"set guifont=Monaco:h12

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " leader
" let mapleader=","

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" move to beginning or end of line in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

noremap  <F3> :!date<cr>
inoremap <F3> <esc>:!date<cr>

" noremap <F4> :cd /home/menghali/lang_code/lang/postopt/src<cr>
" inoremap <F4> <esc>:cd /home/menghali/lang_code/lang/postopt/src<cr>

imap <C-c> <esc>
noremap ; :

set hidden "jump to tags without having to save first
set guifont=Source\ Code\ Pro\ Medium\ 10

" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
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
endfunction " }}}

function! RmHiInterestingWord(n) " {{{
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
endfunction " }}}

" Mappings {{{

nnoremap <silent> =1 :call HiInterestingWord(1)<cr>
nnoremap <silent> =2 :call HiInterestingWord(2)<cr>
nnoremap <silent> =3 :call HiInterestingWord(3)<cr>
nnoremap <silent> =4 :call HiInterestingWord(4)<cr>
nnoremap <silent> =5 :call HiInterestingWord(5)<cr>
nnoremap <silent> =6 :call HiInterestingWord(6)<cr>

nnoremap <silent> -1 :call RmHiInterestingWord(1)<cr>
nnoremap <silent> -2 :call RmHiInterestingWord(2)<cr>
nnoremap <silent> -3 :call RmHiInterestingWord(3)<cr>
nnoremap <silent> -4 :call RmHiInterestingWord(4)<cr>
nnoremap <silent> -5 :call RmHiInterestingWord(5)<cr>
nnoremap <silent> -6 :call RmHiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}
"

let mapleader=","
nnoremap <leader>a :echo("\<leader\> works! It is set to <leader>")<CR>
nnoremap <leader>f oprintf(" -- %s begin --\n", __func__);<esc>
nnoremap <leader>d oprintf(" -- %s end --\n", __func__);<esc>
nnoremap <leader>s :set list!<CR>
nnoremap <leader>x :%!xxd<CR>
nnoremap <leader>c :%!xxd -r<CR>

