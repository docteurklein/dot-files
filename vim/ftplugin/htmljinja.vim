
fun! CompleteSymfonyRouter(findstart, base)
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
        let shellcmd = 'php app/console router:debug'
        let output = system(shellcmd)
        if v:shell_error
            return 0
        endif

        for m in split(output, "\n")
            let row = split(m)
            if len(row) == 3
                let [route, lontext, url] = row
                if route =~ '^' . a:base
                    call add(res, route)
                endif
            endif
        endfor
        return res
    endif
endfun

set completefunc=CompleteSymfonyRouter
