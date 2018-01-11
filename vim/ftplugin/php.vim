map <buffer> <leader>ns :call PhpInsertUse()<CR>
map <buffer> <leader>bns :call PhpExpandClass()<CR>

let g:ale_php_phpcs_standard = 'no'

setlocal keywordprg=pman
