
syntax match phpspecExampleName / \(its\|it\)_[^(]*/ contained containedin=phpRegion
syntax match phpspecExampleSubject / \(its_[^_]*\|it\)/ contained containedin=phpspecExampleName
syntax match phpspecExampleDelimiter "_" conceal cchar=  contained containedin=phpspecExampleName,phpspecExampleSubject

setlocal conceallevel=2

nmap <leader>s :NeoCompleteLock <CR> :set completefunc=CompleteSymfony <CR>
nmap <leader>S :NeoCompleteUnlock <CR>
