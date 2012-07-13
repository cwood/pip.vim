function! pip#github#install(github_repository)
    "Installs a github repository into your project"
    let [user, repository] = split(a:github_repository, '/')
    let github_ssh_url = 'git+git@github.com:'.a:github_repository.'.git\#egg='.repository
    call pip#command#wrapper('install -e '.github_ssh_url)
endfunction
