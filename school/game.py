print(r'
Welcome to Mover! 
Move around by pressing a sequence of wasd commands then hitting enter.
The commands will be interpreted in the order typed. 
')

loadsave = input('Save data (or hit enter for new):')
if len(loadsave):
  oldsave = loadsave.split('|')
  pad = eval(oldsave[0])
else:
  oldsave = None
  difficulty = int(input('Difficulty [1, 9]: '))
  assert((difficulty <= 9) and (difficulty >= 1))
  
  pad = [[False for i in range(3)] for i in range(3)]

def crunch():
  unsolved = 0
  for x in pad:
    for y in pad:
      unsolved += pad[x][y]
  return unsolved

def draw():
  for x in pad:
    for y in x:
      if (x == player.loc[0]) and (y == player.loc[1]):
        if pad[x][y]:
          print('I', end='')
        else:
          print('Q', end='')
      else:
        print(pad[x][y], end='')
    print()

def pop(x, y):
  pad[x][y+1] = not pad[x][y+1]
  pad[x][y-1] = not pad[x][y-1]
  pad[x+1][y] = not pad[x+1][y]
  pad[x-1][y] = not pad[x-1][y]

class Error(Exception):
  print('An error has occurred. Here is a representation of the current game.')
  print(repr(pad) + '|' + repr(player.loc))

class InputError(Error):
  def __init__(self, message):
    super(InputError, self).__init__()
    self.message = message

class player:
  self.loc = [0, 0]
  # Initialize starting position
  def __init__(self):
    if oldsave:
      self.loc = eval(oldsave[1])
  
  # Player Movement
  def move(self, commands):
    cmds = []
    # Separate string of commands into usable list
    for i in range(len(commands)):
      cmds.append(commands[i])
    del commands
    # Iterate over list of commands
    for i in cmds:
      x = self.loc[0]
      y = self.loc[1]
      if i == 's':  # Move down
        self.loc[1] = y + 1
      elif i == 'w':# Move up
        self.loc[1] = y - 1
      elif i == 'a':# Move right
        self.loc[0] = x + 1
      elif i == 'd':# Move left
        self.loc[0] = x - 1
      else
        raise InputError('Unknown command entered.')
      pop(self.loc[0], self.loc[1])
  
  def random(self, amount):
    
# Setup bot
bot = player()
# Main Game Loop
while True:
  
