if !has('python')
    echoerr "Need python to run. Please compile vim with +python support"
    finish
endif

if !exists('g:pip_default_requirments')
    let g:pip_default_requirments = 'requirments.pip'
endif

command! -nargs=? -complete=customlist,pip#completions#command Pip call pip#command#wrapper(<q-args>)
command! -nargs=0 -range PipUpdate <line1>,<line2>call pip#requirements#update(<q-args>)
command! -nargs=1 PipGithub call pip#github#install(<q-args>)
