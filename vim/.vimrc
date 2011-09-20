
" auto reload the config file after modifications
" au BufWrite $MYVIMRC source $MYVIMRC

"
" General behavior
"
set nocompatible                " Use vim defaults

" Tabs & Indentation
"
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set list
set listchars=eol:¤,trail:-,tab:>-
if has('gui_running')
    set listchars=eol:⳾,tab:▸\ ,trail:⳽
endif

" But make it easy to switch it
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"      PLUGINS CONFIGURATION
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


filetype off                    " deactivate filetype for pathogen to load snipmate correctly
" Load bundles help & code
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on               " reactivate filetype as before

set encoding=utf-8
set fileencoding=utf-8

let mapleader=","               " Use the comma as leader
set history=1000                " Increase history
set nospell

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch                     " Show matching char (like {})

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Use an SCM instead of swap files
"set directory=~/.vim/tmp        " Directory to put swap file

set laststatus=2                   " Show the status line all the time
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Change statusbar color
au InsertEnter * hi StatusLine ctermfg=16 ctermbg=214 guifg=Orange guibg=Black
au InsertEnter * hi LineNr     ctermfg=214 ctermbg=16  guifg=Orange guibg=Black
au InsertLeave * hi StatusLine ctermfg=242 ctermbg=233 guifg=Red guibg=Black
au InsertLeave * hi LineNr     ctermfg=238 ctermbg=233 guifg=Grey guibg=Black


" Highlight current line
set cursorline

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,css,html,xml,yml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

syntax enable

" Syntastic
let g:syntastic_enable_signs = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_warnings=0

" Enable folding by indentation
set foldmethod=indent
"set fillchars=fold:⋯
" go to next fold and open it
map zz zjzo
" Disable folding by default
set nofoldenable

"undo
set undolevels=1000             " use many levels of undo
"set noundofile

"activate mouse!
set mouse=a

"unmap arrows
"noremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>


"
" Coloration
"

set t_Co=256
colorscheme jellybeans

if has('gui_running')
    set guifont=Monaco\ 12
endif

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
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.log,**/cache/**,**/logs/**,**/zend/**,**/bootstrap.*,**/vendor/**/vendor/**,web/css,web/js,web/bundles,*/project/*,*/target/*,*.hi

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

"command mode
imap jk 

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


"
" Ctags
"

set tags=.git/tags

" Explore tags for the word under the cursor
"map <C-l> <C-]>
" Explore tags list for the word under the cursor OR go directly to it if only one result
map <C-l> g<C-]>
" Back to previous location after browsing tags
map <C-h> <C-T>
" Jump to next tag match
map ]t :tnext<CR>
" Jump to previous tag match
map [t :tprevious<CR>

" TagList
let g:Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
nnoremap <silent> <C-F8> :TlistToggle<CR>

"
" Lusty
"

map <leader>lp :LustyJugglePrevious<cr>
let g:LustyJugglerShowKeys = 0

"
" Command-T
"

let g:CommandTMaxFiles=30000        " Increase cache size
map <leader>t :CommandT<cr>
au BufCreate,BufFilePost * CommandTFlush

au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

"
" Ack
"

let g:ackprg = 'ack-grep -H --nocolor --nogroup --column --type-add html=twig --ignore-dir=cache --ignore-dir=logs'

" do a Ack search on the word under cursor
nmap <leader>f :Ack <C-r><C-w><CR>
" do a Ack search on the selected text
vmap <leader>f y:Ack <C-r>"<CR>


" Processing results in quickfix http://efiquest.org/2009-02-19/32/
com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry
com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry


"
" Snipmate
"

"let g:snips_author = 'Antoine Hérault <antoine.herault@gmail.com>'
let g:snips_author = 'Florian Klein <florian.klein@free.fr>'

