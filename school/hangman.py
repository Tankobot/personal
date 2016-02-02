import random


print('''
Instructions: 
Give a word, and watch the computer try to solve it. 
''')


def separate(string):
    pieces = []
    for i in string:
        pieces.append(i)
    return pieces


letter_pos = dict()
def letter_add(letter, poisiton):
    if letter_pos[letter]:
        pass


word = separate(input('Word: '))

for i, v in enumerate(word):
    if v != ' ':
        letter_add(v, i)
    else:
        letter_add(0, i)

done_word = ['_' for i in range(len(word))]
