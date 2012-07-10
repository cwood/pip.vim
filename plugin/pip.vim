if !has('python')
    echoerr "Need python to run. Please compile vim with +python support"
    finish
endif

if !has('g:pip_default_requirments')
    let g:pip_default_requirments = 'requirments.pip'
endif

command! -nargs=? -complete=customlist,pip#completions#command Pip call pip#command#wrapper(<q-args>)