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
    initialCrunch = eval(oldSave[3])
    difficulty = eval(oldSave[4])
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


def draw():
    y_num = 0
    for row in pad:
        x_num = 0
        for column in row:
            state = int(column)
            if (x_num == bot.loc[0]) and (y_num == bot.loc[1]):
                if state:
                    print('I', end='')
                else:
                    print('G', end='')
            else:
                print(str(state), end='')
            x_num += 1
        print()
        y_num += 1


def pop(x, y):
    if y < difficulty - 1:
        pad[x][y + 1] = not pad[x][y + 1]
    if y > 0:
        pad[x][y - 1] = not pad[x][y - 1]
    if x < difficulty - 1:
        pad[x + 1][y] = not pad[x + 1][y]
    if x > 0:
        pad[x - 1][y] = not pad[x - 1][y]


class Error(Exception):
    def __init__(self):
        print('An error has occurred. Here is a representation of the current game.\n' +
              repr(pad) + '|' +
              repr(bot.loc) + '|' +
              str(commandCount) + '|' +
              str(initialCrunch) + '|' +
              str(difficulty))


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
        # Iterate over list of commands
        for i in commands_list:
            x = self.loc[0]
            y = self.loc[1]
            if (i == 's') and (y < difficulty - 1):    # Move down
                self.loc[1] += 1
            elif (i == 'w') and (y > 0):  # Move up
                self.loc[1] -= 1
            elif (i == 'd') and (x < difficulty - 1):  # Move right
                self.loc[0] += 1
            elif (i == 'a') and (x > 0):  # Move left
                self.loc[0] -= 1
            elif i in {'w', 'a', 's', 'd'}:
                pass
            else:
                raise InputError('Unknown command entered.')
            # print('pop(', x, y, ')')
            pop(y, x)

    def scramble(self):
        possible = ['w', 'a', 's', 'd']
        command_list = ''
        for i in range(difficulty * 9):
            command_list += possible[random.randint(0, 3)]
        self.move(command_list)


# Setup game
bot = Player()
if not oldSave:
    bot.scramble()
    initialCrunch = crunch()
# Main Game Loop
while True:
    score = crunch()
    if not score:  # Temp pass
        print('You solved a ' +
              str(difficulty) + 'x' + str(difficulty) + ' in ' + str(commandCount) +
              ' moves from an initial crunch of ' + str(initialCrunch) + '!')
        break
    print()
    draw()
    print(repr(bot.loc))
    print('Count: ' + str(commandCount))
    print('Crunch: ' + str(score))
    user_input = input('Commands:')
    bot.move(user_input)
    commandCount += 1
