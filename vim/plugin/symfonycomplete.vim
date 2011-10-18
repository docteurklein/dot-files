
fun! CompleteSymfonyContainer(base, res)
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
                call add(a:res, service)
            endif
        endif
    endfor
endfun

fun! CompleteSymfonyRouter(base, res)
    " find symfony routes matching with "a:base"
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
                call add(a:res, route)
            endif
        endif
    endfor
endfun

fun! CompleteSymfony(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\S'
            let start -= 1
        endwhile
        return start
    else
        " find symfony services id / routes matching with "a:base"
        let res = []
        call CompleteSymfonyContainer(a:base, res)
        call CompleteSymfonyRouter(a:base, res)

        return res
endfun
set completefunc=CompleteSymfony
