import random

print('''
Welcome to Mover!
Move around by pressing a sequence of wasd commands then hitting enter.
The commands will be interpreted in the order typed.
''')

loadSave = input('Save data (or hit enter for new save):')
commandCount = 1
if len(loadSave):
    oldSave = loadSave.split('|')
    pad = eval(oldSave[0])
    commandCount = eval(oldSave[2])
else:
    oldSave = None
    commandCount = 0
    difficulty = int(input('Difficulty [2, 9]: '))
    assert((difficulty <= 9) and (difficulty >= 2))

    pad = [[False for i in range(difficulty)] for i in range(difficulty)]


def crunch():
    unsolved = 0
    for x in range(len(pad)):
        for y in range(len(pad[x])):
            unsolved += pad[x][y]
    return unsolved


def tonum(input_list):
    out_list = []
    for i in input_list:
        out_list.append(str(int(i)))
    return out_list


def draw():
    y_list = []
    for i in range(difficulty):
        y_list.append(''.join(tonum(pad[i])))
    y_num = 0
    for y_string in y_list:
        x_num = 0
        for x_character in y_string:
            if (x_num == bot.loc[0]) and (y_num == bot.loc[1]):
                if int(x_character):
                    print('I', end='')
                else:
                    print('Q', end='')
            else:
                print(x_character, end='')
            x_num += 1
        print()
        y_num += 1


def pop(x, y):
    pad[x][(y + 1) % difficulty] = not pad[x][(y + 1) % difficulty]
    pad[x][(y - 1) % difficulty] = not pad[x][(y - 1) % difficulty]
    pad[(x + 1) % difficulty][y] = not pad[(x + 1) % difficulty][y]
    pad[(x - 1) % difficulty][y] = not pad[(x - 1) % difficulty][y]


class Error(Exception):
    def __init__(self):
        print('An error has occurred. Here is a representation of the current game.')
        print(repr(pad) + '|' +
              repr(bot.loc) + '|' +
              str(commandCount))


class InputError(Error):
    def __init__(self, message):
        super(InputError, self).__init__()
        self.message = message


class Player:
    # Initialize starting position
    def __init__(self):
        self.loc = [0, 0]
        if oldSave:
            self.loc = eval(oldSave[1])

    # Player Movement
    def move(self, commands):
        commands_list = []
        # Separate string of commands into usable list
        for i in range(len(commands)):
            commands_list.append(commands[i])
        del commands
        # Iterate over list of commands
        x = self.loc[0]
        y = self.loc[1]
        for i in commands_list:
            if (i == 's') and (y < difficulty):    # Move down
                self.loc[1] += 1
            elif (i == 'w') and (y > difficulty):  # Move up
                self.loc[1] -= 1
            elif (i == 'a') and (x < difficulty):  # Move right
                self.loc[0] += 1
            elif (i == 'd') and (x > difficulty):  # Move left
                self.loc[0] -= 1
            else:
                raise InputError('Unknown command entered.')
            pop(x, y)

    def scramble(self):
        possible = ['w', 'a', 's', 'd']
        command_list = ''
        for i in range(difficulty * 9):
            command_list += possible[random.randint(0, 3)]
        self.move(command_list)


# Setup game
bot = Player()
if oldSave:
    bot.scramble()
# Main Game Loop
while True:
    print('Pad:')
    draw()
    user_input = input('Commands:')
    bot.move(user_input)
    commandCount += 1
    # break  # Temporary
