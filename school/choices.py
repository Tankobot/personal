"""Choices, choices."""

import time
import sys
import pickle
import binascii
import textwrap

blank = 50


def save(obj):
    return binascii.hexlify(pickle.dumps(obj)).decode()


def load(obj_str):
    return pickle.loads(binascii.unhexlify(obj_str))


def speak(msg, amount):
    for i in msg:
        print(i, end='')
        sys.stdout.flush()
        time.sleep(amount / len(msg))
    print()


class Master(Exception):
    pass


class Decision:
    def __init__(self, slug, message, speed, name=''):
        self.slug = slug
        self.message = message
        self.speed = speed
        self.name = name
        self.options = []

    def ask(self):
        """
        Ask prompt.

        Responses:
            h, help : Shows this super helpful text!
            e, exit : Exits the game and returns save data.
        """

        print('\n' * blank)
        speak(self.message, self.speed)
        print()

        for i, v in enumerate(self.options):
            if type(v) == Point:
                v = v()  # Evaluate pointer
                self.options[i] = v
            print('   ', i, ': ', v.slug)
        print()

        chosen = input('> ')

        # Check for commands
        if chosen in {'h', 'help'}:
            print(textwrap.dedent(self.ask.__doc__[1:]))
            input("Hit enter when you're finished.")
            return self
        elif chosen in {'e', 'exit', 'leave'}:
            return 'Exit'
        elif chosen in {'gu', 'give up'}:
            print('You stopped and gave up.')
            input("Hit enter, your're finished.")
            raise Master('The player has given up.')

        try:
            chosen = int(chosen)
        except ValueError:
            print('Location: ' + save(old_point.name))
            input('Hit enter when finished.')
            raise

        return self.options[chosen]

    def add(self, v):
        self.options.append(v)

    def load_function(self, source):
        self.code = source

    def load_before(self, source):
        self.before = source

    def copy(self):
        new_me = Decision(self.slug, self.message, self.speed)
        new_me.options = self.options.copy()
        return new_me


every = dict()


# Handle self-referential assignment
class Point:
    def __init__(self, location):
        self.location = location
        self.data = None

    def __call__(self):
        self.data = eval('every')
        return self.data[self.location]


def connect(data):
    name = data['name']
    slug = data['slug']
    message = data['msg']
    speed = data['speed']

    active = Decision(slug, message, speed, name=name)

    # Add pointers for references.
    every[name] = active

    del data['name'], data['slug'], data['msg'], data['speed']
    for (i, v) in data.items():
        if type(i) == int:
            if type(v) == dict:
                next_choice = connect(v)
                active.add(next_choice)
            elif (type(v) == Decision) or (type(v) == Point):
                active.add(v)
            elif type(v) == tuple:
                next_choice = v[0].copy()
                v.slug = v[1]
                active.add(next_choice)
            else:
                raise ValueError('unexpected value %s' % repr(v))
        else:
            raise KeyError('unexpected key %s ' % repr(i))
    return active


# ----------------- #
# Begin Actual Game #
# ----------------- #
# Not to self,
# "don't use the
# key 'self.'"

story = {
    'name': 'first',
    'slug': 'Back to the beginning.',
    'msg': 'Welcome to your new story.',
    'speed': 3,
    0: {
        'name': 'adventure_sign',
        'slug': 'To the Adventure!',
        'msg': 'There is a sign with the word "Adventure" written on it.',
        'speed': 1,
        0: Point('first'),
    },
    1: {
        'name': 'nothing',
        'slug': 'Nothing.',
        'msg': 'There\'s nothing here. What did you expect?',
        'speed': 1,
        0: Point('first'),
    },
}


def __main__():
    global old_point
    points = connect(story)

    print('\n' * blank)
    response = input('Location (hit enter for beginning): ')
    if response:
        old_point = every[load(response)]
    else:
        old_point = points
    while True:
        new_point = old_point.ask()
        if new_point == 'Exit':
            print('\n' * blank)
            print('Location: ' + save(old_point.name))
            input('Hit enter when finished.')
            break
        else:
            old_point = new_point

if __name__ == '__main__':
    __main__()
