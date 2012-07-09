function! pip#command#wrapper(command)
    exec '!pip '.a:command
endfunction
