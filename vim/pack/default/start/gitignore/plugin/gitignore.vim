let filename = '.gitignore'
if filereadable(filename)
    let igstring = ''
    for oline in readfile(filename)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == '' | con  | endif
        if line =~ '^!' | con  | endif
        if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        let line = "*/" . line
        let igstring .= "," . line
    endfor
    let patterns = substitute(igstring, '^,', '', "g")
    let execstring = "set wildignore=".patterns
    execute execstring
endif
