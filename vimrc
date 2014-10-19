
let mapleader=","               " Use the comma as leader

" auto reload the config file after modifications
" autocmd BufWrite $MYVIMRC source $MYVIMRC

set nocompatible                " Use vim defaults
filetype off                    " deactivate filetype for pathogen to load snipmate correctly
call pathogen#infect()
filetype on
filetype indent on
filetype plugin on
syntax on

set t_Co=256
colorscheme jellybeans

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set list
set listchars=eol:↩,trail:‧,tab:▸▸
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
set completeopt=menuone
set pumheight=10
set keywordprg=pman
set nofoldenable
set scrolloff=5
set sidescrolloff=5
set hidden                          " Allow switch beetween modified buffers
set backspace=indent,eol,start      " Improve backspacing
set wildmenu                        " Better completion
set wildmode=longest:full
set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif
set undolevels=1000             " use many levels of undo
set noundofile
"set cscopetag
"set cscopetagorder=1
set tags=tags,vendor.tags,pear.tags

cscope add cscope.out
" map for cscope
nmap <C-@>s :cscope find s <C-R>=expand("<cword>")<CR>
nmap <C-@>g :cscope find g <C-R>=expand("<cword>")<CR>
nmap <C-@>c :cscope find c <C-R>=expand("<cword>")<CR>
nmap <C-@>t :cscope find t <C-R>=expand("<cword>")<CR>
nmap <C-@>e :cscope find e <C-R>=expand("<cword>")<CR>
nmap <C-@>f :cscope find f <C-R>=expand("<cfile>")<CR>
nmap <C-@>i :cscope find i <C-R>=expand("<cfile>")<CR>
nmap <C-@>d :cscope find d <C-R>=expand("<cword>")<CR>


" Explore tags list for the word under the cursor OR go directly to it if only one result
map <C-l> g<C-]>
map tt g<C-]>
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
" do a grep search on the selected text
vmap <leader>f y:grep -r "<C-r>""
" do a grep search on the word under cursor
nmap <leader>f :grep -r "<C-r><C-w>"
" search on php.net for current word
command! Browse : ! xdg-open http://php.net/<cword>

cmap w!! w ! sudo tee % > /dev/null


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
inoremap jj <Esc>
inoremap <S-CR> <Esc>

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

runtime ftplugin/man.vim

" display trailing whitespace as error
match ErrorMsg '\s\+$'


set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k
autocmd FileType gitcommit,markdown setlocal spell

" Restore cursor position
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufReadPost fugitive://* set bufhidden=delete
" Remove trailing whitespaces and ^M chars
autocmd FileType php,js,css,html,xml,yaml,vim autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
" do not auto insert comment chars on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au   InsertEnter   *   hi   CursorLine   gui=bold   cterm=bold
au   InsertLeave   *   hi   CursorLine   gui=none   cterm=none

highlight link SyntasticStyleErrorSign SyntasticStyleWarningSign
highlight link SyntasticStyleErrorLine SyntasticStyleWarningLine


function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call mkdir(a:directory, 'p')
    endif
endfunction


" Processing results in quickfix http://efiquest.org/2009-02-19/32/
com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry
com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

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

let g:Powerline_symbols = 'unicode'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if has('gui_running')
    set guifont=Droid\ Sans\ Mono\ For\ Powerline\ 15
    let g:Powerline_symbols = 'fancy'
endif

" Syntastic
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_php_checkers=['php']

let g:LustyJugglerShowKeys = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

let g:php_refactor_command='php ~/bin/refactor.phar'
let g:php_cs_fixer_path = '~/bin/php-cs-fixer.phar'

