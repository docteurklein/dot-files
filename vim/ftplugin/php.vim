map <buffer> ns :call PhpInsertUse()<CR>

nnoremap <C-P> :call PhpDocSingle()<CR>

fun! CompleteSymfonyContainer(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        " find symfony services id matching with "a:base"
        let res = []
        let shellcmd = 'php app/console container:debug'
        let output = system(shellcmd)
        if v:shell_error
            return 0
        endif

        for m in split(output, "\n")
            let row = split(m)
            if len(row) == 3
                let [service, context, class] = row
                if service =~ '^' . a:base
                    call add(res, service)
                endif
            endif
        endfor
        return res
    endif
endfun

set completefunc=CompleteSymfonyContainer
