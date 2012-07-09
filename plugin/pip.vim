command! -nargs=? -complete=customlist,pip#completions#command Pip call pip#command#wrapper(<q-args>)
command! -nargs=1 PipGithub call pip#command#github(<q-args>)
command! -nargs=1 PipUninstall call pip#command#uninstall(<q-args>)
command! -nargs=1 PipUpdateReq call pip#requirments#update(<q-args>)
