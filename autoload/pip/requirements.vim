function! pip#requirements#update(...)

    if len(a:000) == 2
        let start_line = a:1
        let end_line = a:2
    else
        let start_line = line(0)
        let end_line = search("^$")
    endif

    let current_requirements_conent = split(system('pip freeze -l'), '\n')

    let current_requirements = pip#utils#split(current_requirements_conent)
    let local_requirements = pip#utils#split(getline(start_line, end_line))

    for [requirement, info] in items(local_requirements)
        let current_req = get(current_requirements, requirement)

        if type(current_req) == type({})
            if current_req.version != info.version

                if info.is_editable == 0
                    let new_line = join([current_req.version, requirement], '#egg=')
                else
                    let new_line = requirement . "==" . current_req.version
                endif

                call setline(info.line_number, new_line)
            endif
        endif

        unlet current_req
    endfor

endfunction


function! pip#requirements#updateall(...)
    let current_file = expand('%:p')
    execute '!pip install -r ' . current_file
endfunc
