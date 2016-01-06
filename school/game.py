print(r'
Welcome to Mover! 
Move around by pressing a sequence of wasd commands then hitting enter.
The commands will be interpreted in the order typed. 
')
difficulty = int(input('Difficulty [1, 9]: '))
assert((difficulty <= 9) and (difficulty >= 1))

pad = [[False for i in range(3)] for i in range(3)]

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
  
class InputError(Exception):
  def __init__(self, message):
    self.message = message

class player:
  self.loc = [0, 0]
  def move(commands):
    cmds = []
    for i in range(len(commands)):
      cmds.append(commands[i])
    
    for i in cmds:
      x = self.loc[0]
      y = self.loc[1]
      if i == 's':
        self.loc[1] = y + 1
      elif i == 'w':
        self.loc[1] = y - 1
      elif i == 'a':
        self.loc[0] = x + 1
      elif i == 'd':
        self.loc[0] = x - 1
      else
        raise InputError()
