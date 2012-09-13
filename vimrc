
" auto reload the config file after modifications
" autocmd BufWrite $MYVIMRC source $MYVIMRC

"
" General behavior
"
set nocompatible                " Use vim defaults
filetype off                    " deactivate filetype for pathogen to load snipmate correctly

"
" Coloration
"
set t_Co=256
colorscheme jellybeans

" Tabs & Indentation
"
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set list
set listchars=eol:↩,trail:‧,tab:>⁙
if has('gui_running')
    set listchars=eol:↩,trail:‧,tab:>⁙
endif

" But make it easy to switch it
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

let g:feature_filetype = "behat"
let g:syntastic_phpcs_disable = 1

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"      PLUGINS CONFIGURATION
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


call pathogen#infect()
syntax on

filetype plugin indent on
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

"
" omnicompletion
set completeopt=menuone

set laststatus=2                   " Show the status line all the time
set statusline=
"set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Change line numbers color
autocmd InsertEnter * hi LineNr      ctermfg=16 ctermbg=214 guifg=Orange guibg=#151515
autocmd InsertLeave * hi LineNr      term=underline ctermfg=59 ctermbg=232 guifg=#605958 guibg=#151515

" Change statusline color
autocmd InsertEnter * hi StatusLine  ctermfg=16 ctermbg=214 guifg=Orange guibg=#151515
autocmd InsertLeave * hi StatusLine  term=bold,reverse ctermfg=16 ctermbg=252 gui=italic guifg=#000000 guibg=#dddddd

autocmd BufEnter    * hi SpellCap    guisp=Orange
autocmd BufEnter    * hi Comment     gui=NONE

autocmd BufReadPost fugitive://* set bufhidden=delete

" Highlight current line
set cursorline

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,css,html,xml,yml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_quiet_warnings = 0
let g:syntastic_enable_balloons = 1

" Enable folding by indentation
set foldmethod=indent
"set fillchars=fold:⋯
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

" tmux specific mapping
inoremap <Esc>[A <Up>
inoremap <Esc>[B <Down>
inoremap <Esc>[C <Left>
inoremap <Esc>[D <Right>


let g:Powerline_symbols = 'unicode'

if has('gui_running')
    set guifont=Monaco\ For\ Powerline\ 12
    let g:Powerline_symbols = 'fancy'
endif

"
" Interface
"

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

"
" Command line
"

set wildmenu                        " Better completion
set wildmode=list:longest           " BASH style completion
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*.log,**/cache/**,**/logs/**,**/zend/**,**/vendor/**/vendor/**,web/css,web/js,web/bundles,*/project/*,*/target/*,*.hi

"
" Navigation & Viewport
"

set scrolloff=5
set sidescrolloff=5
set hidden                          " Allow switch beetween modified buffers
set backspace=indent,eol,start      " Improve backspacing

" Restore cursor position
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-j> 3j
nnoremap <C-k> 3k

" Faster window resizing
" vertical
nnoremap + 3<c-w>+
nnoremap 6 3<c-w>-
" horizontal
nnoremap = 3<c-w>>
nnoremap - 3<c-w><

"command mode
inoremap jj <Esc>
inoremap <S-CR> <Esc>

" querty like
imap '' {
imap == }
imap (( [
imap )) ]
imap /§ \

" paste "0, ie: before-last yanked register
nnoremap <leader>p "0p
vnoremap <leader>p "0p


cabbrev bda bufdo bd<cr>

"
" Chars
"
set encoding=utf-8

"
" Syntax & File types
"

filetype on
filetype plugin on
filetype indent on

" Automatically remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"
" Ctags
"
set tags=tags,vendor.tags,pear.tags


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

map <C-Tab> <C-W><C-W>
map <S-Right> :bnext<CR>
map <S-Left> :bprevious<CR>


"
" CtrlP
"
"let g:ctrlp_map = '<leader>t'
"nmap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlPMRU'


autocmd BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

"
" do a grep search on the word under cursor
nmap <leader>f :grep -Rno "<C-r><C-w>"
" do a grep search on the selected text
vmap <leader>f y:grep -Rno "<C-r>"
" search on php.net for current word
command! Browse : ! $BROWSER php.net/<cword>


" Processing results in quickfix http://efiquest.org/2009-02-19/32/
com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry
com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

" do not auto insert comment chars on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" phpunit compilation
com! -nargs=* Phpunit make <q-args> | cw

" dont use ":" as a keyword separator
set iskeyword-=:

"
" Snipmate
let g:snips_author = 'Florian Klein <florian.klein@free.fr>'

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
