import random

diff = input('Diff: ')
diff = int(diff)

assert(diff > 0)

while True:    
    pairs = [0 for i in range(diff)]
    
    for i in range(2 * diff):
        print('\n' * 50)
        ran1 = random.randint(1, diff)
        ran2 = random.randint(1, diff)
        pairs[ran1 - 1] = ran2
        print(str(ran1) + ':' + str(ran2))
        input('Next')
    
    print('\n' * 50)
    score = 0
    for i in range(diff):
        answer = input(str(i+1) + ':')
        if int(answer) == pairs[i]:
            score += 1
    
    print('\n' * 50)
    print('Score: ' + str(score / diff))
    
    if score / diff < 0.5:
        break
    else:
        diff += 1
        input('New diff: ' + str(diff))
