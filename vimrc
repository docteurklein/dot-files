
" auto reload the config file after modifications
" autocmd BufWrite $MYVIMRC source $MYVIMRC

"
" General behavior
"
set nocompatible                " Use vim defaults
filetype off                    " deactivate filetype for pathogen to load snipmate correctly

set rtp+=/usr/lib/python3.3/site-packages/powerline/bindings/vim

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

let g:feature_filetype = "behat"


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

autocmd BufReadPost fugitive://* set bufhidden=delete

" Highlight current line/column
set cursorline
set cursorcolumn

au   InsertEnter   *   hi   CursorLine   gui=bold   cterm=bold
au   InsertLeave   *   hi   CursorLine   gui=none   cterm=none

" Remove trailing whitespaces and ^M chars
autocmd FileType php,js,css,html,xml,yaml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_quiet_warnings = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_php_checkers=['php']
highlight link SyntasticStyleErrorSign SyntasticStyleWarningSign
highlight link SyntasticStyleErrorLine SyntasticStyleWarningLine

" Disable folding by default
set nofoldenable

"undo
set undolevels=1000             " use many levels of undo
"set noundofile

"activate mouse!
set mouse=a

"unmap arrows
"noremap  <up>    <nop>
"noremap  <down>  <nop>
"noremap  <left>  <nop>
"noremap  <right> <nop>
"vnoremap <up>    <nop>
"vnoremap <down>  <nop>
"vnoremap <left>  <nop>
"vnoremap <right> <nop>

" tmux specific mapping
"inoremap <Esc>[A <Up>
"inoremap <Esc>[B <Down>
"inoremap <Esc>[C <Left>
"inoremap <Esc>[D <Right>


let g:Powerline_symbols = 'unicode'

if has('gui_running')
    set guifont=Droid\ Sans\ Mono\ For\ Powerline\ 15
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
set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif

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

" paste "0, ie: before-last yanked register
nnoremap <leader>p "0p
vnoremap <leader>p "0p


" buf delete all
cabbrev bda bufdo bd<cr>
" buf wipeout all
cabbrev bwa bufdo bwi<cr>

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



"
" ctags, cscope
"
set cscopetag cst
set csto=1
cscope add cscope.out

set tags=tags,vendor.tags,pear.tags

" map for cscope
nmap <C-@>s :cscope find s <C-R>=expand("<cword>")<CR>
nmap <C-@>g :cscope find g <C-R>=expand("<cword>")<CR>
nmap <C-@>c :cscope find c <C-R>=expand("<cword>")<CR>
nmap <C-@>t :cscope find t <C-R>=expand("<cword>")<CR>
nmap <C-@>e :cscope find e <C-R>=expand("<cword>")<CR>
nmap <C-@>f :cscope find f <C-R>=expand("<cfile>")<CR>
nmap <C-@>i :cscope find i <C-R>=expand("<cfile>")<CR>
nmap <C-@>d :cscope find d <C-R>=expand("<cword>")<CR>


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
let g:ctrlp_match_window_bottom = 0


autocmd BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call mkdir(a:directory, 'p')
    endif
endfunction

" do a grep search on the selected text
vmap <leader>f y:grep -Rn "<C-r>""
" do a grep search on the word under cursor
nmap <leader>f :grep -Rn "<C-r><C-w>"
" search on php.net for current word
command! Browse : ! xdg-open http://php.net/<cword>

cmap w!! w ! sudo tee % > /dev/null


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

match ErrorMsg '\s\+$'

"
"
""""""""""""""""""""""""""""""""""""""""
"
"  UltiSnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


