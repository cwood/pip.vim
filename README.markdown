Pip.vim
===============================================================================

Manage pip/virtualenv through ViM.


Commands
===============================================================================

``Pip`` is a base wrapper around your virtual enviroments pip or your system
pip. Whichever is first found on your ``$PATH``. It will autocomplete
subcommands, flags and then directories. Other plans for autocomplete is to be
more context aware.

``PipGithub`` will install a repo in a project. It only takes the
``usernname/repo`` as its argument. This will do a -e and install with git.


Plans
===============================================================================
                    This is a really early into development.

* Expand syntax to highlight -e vcs+url#egg=someegg
* Create mappings to manage your env through requirments.pip
    * Should allow to update
    * Remove
    * Install right from your requirments.pip

* Manage and update the requirments file automagically. I really want this so
that I dont forget packages I have installed.

* Expand mappings to work for setup.py too.
