print(r'
Welcome to Mover! 
Move around by pressing a sequence of wasd commands then hitting enter.
The commands will be interpreted in the order typed. 
')
difficulty = int(input('Difficulty [1, 9]: '))
assert((difficulty <= 9) and (difficulty >= 1))

pad = [[False for i in range(3)] for i in range(3)]

def draw():
  for i in pad:
    for j in i:
      

def pop(x, y):
  pad[x][y+1] = not pad[x][y+1]
  pad[x][y-1] = not pad[x][y-1]
  pad[x+1][y] = not pad[x+1][y]
  pad[x-1][y] = not pad[x-1][y]

class player:
  self.loc = [0, 0]
  def move(commands):
    cmds = []
    for i in range(len(commands)):
      cmds.append(commands[i])
    
    for i in cmds:
      x = self.loc[0]
      y = self.loc[1]
      if i == 'd':
        self.loc[0] = x + 1
      elif i == :
        
