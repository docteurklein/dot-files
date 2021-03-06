let mapleader=","               " Use the comma as leader

" auto reload the config file after modifications
" autocmd BufWrite $MYVIMRC source $MYVIMRC

set exrc
set nocompatible                " Use vim defaults
filetype on
filetype indent off
filetype plugin on
syntax on

set t_Co=256
"set termguicolors
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 0

set nomodeline
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set list
set listchars=nbsp:¬,eol:↩,trail:…,tab:▸▸
set encoding=utf-8
set fileencoding=utf-8
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
" Highlight current line/column
set cursorline
set cursorcolumn
set laststatus=2                   " Show the status line all the time
set completeopt=menuone,preview,noinsert
set pumheight=10
set nofoldenable
set scrolloff=5
set sidescrolloff=5
set hidden                          " Allow switch beetween modified buffers
set backspace=indent,eol,start      " Improve backspacing
set wildmenu                        " Better completion
set wildmode=list:longest
set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc
set undolevels=1000             " use many levels of undo
set noundofile
"set cscopetag
"set cscopetagorder=1
set tags=tags,vendor.tags
if !empty(glob('*tags')) | exe 'set tags='.substitute(glob('*tags'), "\n", ',', 'g') | endif

cscope add cscope.out
cscope add cscope.vendor.out
set cscopequickfix=s+ " populate the quickfix list
" map for cscope
nmap <C-@>s :cscope find s <C-R>=expand("<cword>")<CR>
nmap <C-@>g :cscope find g <C-R>=expand("<cword>")<CR>
nmap <C-@>c :cscope find c <C-R>=expand("<cword>")<CR>
nmap <C-@>t :cscope find t <C-R>=expand("<cword>")<CR>
nmap <C-@>e :cscope find e <C-R>=expand("<cword>")<CR>
nmap <C-@>f :cscope find f <C-R>=expand("<cfile>")<CR>
nmap <C-@>i :cscope find i <C-R>=expand("<cfile>")<CR>
nmap <C-@>d :cscope find d <C-R>=expand("<cword>")<CR>
nmap <C-@>a :cscope find a <C-R>=expand("<cword>")<CR>


" Explore tags list for the word under the cursor OR go directly to it if only one result
map <C-l> g<C-]>
map tt g<C-]>
map TT <C-T>
" Back to previous location after browsing tags
map <C-h> <C-T>
" Jump to next tag match
map ]t :tnext<CR>
" Jump to previous tag match
map [t :tprevious<CR>

map <leader>lp :LustyJugglePrevious<cr>

map <C-Tab> <C-W><C-W>
map <S-Right> :bnext<CR>
map <S-Left> :bprevious<CR>

"set grepprg=ag\ --nogroup\ --nocolor\ -r
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
" do a grep search on the selected text
vmap <leader>f y:grep -r '<C-r>"'
" do a grep search on the word under cursor
nmap <leader>f :grep -r '<C-r><C-w>'

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
cabbrev w!! W

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

nnoremap <tab> <c-w><c-w>

"command mode
inoremap <nowait> jj <Esc>
nnoremap <nowait> vv :w<cr>

" paste "0, ie: before-last yanked register
nnoremap <leader>p "0p
vnoremap <leader>p "0p


" buf delete all
cabbrev bda bufdo bd<cr>
" buf wipeout all
cabbrev bwa bufdo bwi<cr>


"unmap arrows
nnoremap  <up>    <nop>
nnoremap  <down>  <nop>
nnoremap  <left>  <nop>
nnoremap  <right> <nop>
vnoremap <up>    <nop>
vnoremap <down>  <nop>
vnoremap <left>  <nop>
vnoremap <right> <nop>

noremap Q <nop>
noremap gQ <nop>

runtime ftplugin/man.vim

" display trailing whitespace as error
match ErrorMsg '\s\+$'


set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k
autocmd FileType gitcommit,markdown setlocal spell

" Restore cursor position
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" do not auto insert comment chars on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"au   InsertEnter   *   hi   CursorLine   gui=bold   cterm=bold
"au   InsertLeave   *   hi   CursorLine   gui=none   cterm=none

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE

highlight link SyntasticStyleErrorSign SyntasticStyleWarningSign
highlight link SyntasticStyleErrorLine SyntasticStyleWarningLine

"highlight SpecialKey guibg=Red ctermbg=9 " red tabs

"let g:ctrlp_map = '<leader>t'
nmap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_bottom = 1

let g:feature_filetype = "behat"

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ For\ Powerline\ 12
    let g:Powerline_symbols = 'fancy'
endif

let g:LustyJugglerShowKeys = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0

let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

let g:gitgutter_async = 0

imap   <C-X><C-O>
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['ghcide', '--lsp'],
    \ }
let g:rainbow_active = 0
