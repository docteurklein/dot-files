"
" General behavior
"

set nocompatible                " Use vim defaults
let mapleader=","               " Use the comma as leader
set history=1000                " Increase history
set nobackup                    " Do not backup files on overwrite
set directory=~/.vim/tmp        " Directory to put swap file

"
" Coloration
"

set t_Co=256
colorscheme jellybeans

if has('gui_running')
    set guifont=Monaco\ 12
endif

"
" Tabs & Indentation
"

set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=2<cr>

"
" Interface
"

set ls=2                            " Always show the status line
set ruler                           " Show cursor position
set number                          " Show line numbers
set notitle                         " Don't show title in console title bar
set novisualbell                    " Don't use the visual bell
set wrap                            " Wrap lineource $MYVIMRC
set showmatch                       " Show matching (){}[]

if (has('gui_running'))
    set guioptions-=m               " Remove menu bar
    set guioptions-=T               " Remove toolbar
    set guioptions-=r               " Remove right-hand scroll bar
endif

" Redraw screen
nmap <leader>r :redraw!<cr>

" Clear search highlight
nmap <silent> <leader>/ :let @/=""<cr>

" Change cursor color depending on the mode
if &term =~ "xterm"
    let &t_SI = "\<Esc>]12;orange\x7"
    let &t_EI = "\<Esc>]12;white\x7"
endif

" Change statusbar color depending on the mode
au InsertEnter * hi StatusLine ctermfg=226 ctermbg=16
au InsertLeave * hi StatusLine ctermfg=7 ctermfg=0

"
" Command line
"

set wildmenu                        " Better completion
set wildmode=list:longest           " BASH style completion

"
" Navigation & Viewport
"

set scrolloff=5
set sidescrolloff=5
set hidden                          " Allow switch beetween modified buffers
set backspace=indent,eol,start      " Improve backspacing

" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-j> 3j
nnoremap <C-k> 3k

"
" Chars
"

set encoding=utf-8

"
" Syntax & File types
"

syntax enable                       " Enable syntax highlighting
filetype on
filetype plugin on
filetype indent on

" Use the htmljinja syntax for twig files
au BufNewFile,BufRead *.twig setf htmljinja

" Automatically remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"      PLUGINS CONFIGURATION
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" Load bundles help & code
silent! call pathogen#helptabs()
silent! call pathogen#runtime_append_all_bundles()

"
" Ctags
"

" Explore tags for the word under the cursor
map <C-l> <C-]>
" Back to previous location after browsing tags
map <C-h> <C-T>
" Jump to next tag match
map ]t :tnext<CR>
" Jump to previous tag match
map [t :tprevious<CR>
" Open tag command
map <C-T> :tag 
let g:Tlist_Ctags_Cmd = 'ctags'
" Rebuild tag index
nnoremap <silent> <C-F7> :silent !ctags -h ".php" --PHP-kinds=+cf --recurse --exclude="*/cache/*" --exclude="*/logs/*" --exclude="*/data/*" --exclude="\.git" --exclude="\.svn" --languages=PHP &<cr>:CommandTFlush<cr>
" TagList
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
nnoremap <silent> <F7> :TlistToggle<CR>

"
" Lusty
"

map <leader>lp :LustyJugglePrevious<cr>
let g:LustyJugglerShowKeys = 0

"
" Command-T
"

let g:CommandTMaxFiles=30000        " Increase cache size

"
" Ack
"

let g:ackprg = 'ack-grep -H --nocolor --nogroup --column --type-add html=twig --ignore-dir=cache --ignore-dir=logs'
nmap <leader>a :Ack

"
" Snipmate
"

let g:snips_author = 'Antoine Hérault <antoine.herault@gmail.com>'
