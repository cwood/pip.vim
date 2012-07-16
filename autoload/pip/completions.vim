function! pip#completions#command(prefix, line, cursor_pos)
python << EOB
from pip.basecommand import command_names
import os

prefix = vim.eval('a:prefix')
line = vim.eval('a:line')
cursor_pos = vim.eval('a:cursor_pos')

command_parts = line.split(' ')

vim_command = command_parts[0]

def _autocomplete_commands(prefix):
    commands = command_names()

    commands = [command for command in command_names()
                    if command.startswith(prefix)]

    vim.command('return '+str(commands))

try:
    sub_command = command_parts[1]
except AttributeError:
    sub_command = None

try:
    sub_command_flags = command_parts[2]
except (IndexError, AttributeError, KeyError):
    sub_command_flags = None

if sub_command == prefix:
    _autocomplete_commands(prefix)

elif prefix.startswith('-'):
    module = __import__('pip.commands.%s' % (sub_command),
                        fromlist=['%sCommand' % (sub_command.capitalize())])

    command_class = getattr(module, '%sCommand' % (sub_command.capitalize()))
    command_options = command_class().parser.option_list

    flags = []
    for option in command_options:
        flags.append(option.get_opt_string())

    if prefix:
        flags = [flag for flag in flags if flag.startswith(prefix)]
    vim.command('return'+str(flags))
else:
    if not sub_command:
        _autocomplete_commands(prefix)
    else:
        current_file = vim.eval('expand("%:p")')
        directory, filename = os.path.split(current_file)

        try:
            prefix_directory, prefix_filename = os.path.split(prefix)
        except (AttributeError, KeyError):
            prefix_directory = None
            prefix_filename = prefix

        if prefix_directory:
            directory = os.path.join(directory, prefix_directory)

        items = os.listdir(directory)

        prefix_items = [item for item in items
                            if item.startswith(prefix_filename)]

        vim.command('return'+str(prefix_items))
EOB
endfunction
