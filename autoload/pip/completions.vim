function! pip#completions#command(prefix, line, cursor_pos)
python << EOB
from pip.basecommand import command_names

prefix = vim.eval('a:prefix')
line = vim.eval('a:line')
cursor_pos = vim.eval('a:cursor_pos')

command_parts = line.split(' ')

vim_command = command_parts[0]

try:
    sub_command = command_parts[1]
except AttributeError:
    sub_command = None

if sub_command == prefix:
    commands = command_names()

    commands = [command for command in command_names()
                    if command.startswith(prefix)]

    vim.command('return '+str(commands))

else:
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



EOB
endfunction
