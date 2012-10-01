function! pip#requirements#update(...)
    let current_file = expand('%:p')
    if match(current_file, g:pip_default_requirments)

    endif
endfunction


function! pip#requirements#updateall(...)
    let current_file = expand('%:p')
    echo current_file
    execute '!pip install -r ' . current_file
endfunc
