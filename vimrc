
let mapleader=","               " Use the comma as leader

" auto reload the config file after modifications
" autocmd BufWrite $MYVIMRC source $MYVIMRC

set nocompatible                " Use vim defaults
filetype off                    " deactivate filetype for pathogen to load snipmate correctly
call pathogen#infect()
filetype plugin indent on
filetype plugin indent on               " reactivate filetype as before
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

"
" omnicompletion
set completeopt=menuone

set laststatus=2                   " Show the status line all the time

" use php man pages
set keywordprg=pman
runtime ftplugin/man.vim

" display trailing whitespace as error
match ErrorMsg '\s\+$'


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
" do a grep search on the selected text
vmap <leader>f y:grep -Rn "<C-r>""
" do a grep search on the word under cursor
nmap <leader>f :grep -Rn "<C-r><C-w>"
" search on php.net for current word
command! Browse : ! xdg-open http://php.net/<cword>

cmap w!! w ! sudo tee % > /dev/null

"let g:ctrlp_map = '<leader>t'
nmap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_bottom = 1



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


let g:feature_filetype = "behat"

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

let g:Powerline_symbols = 'unicode'
set rtp+=/usr/lib/python3.3/site-packages/powerline/bindings/vim
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
