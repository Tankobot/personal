"""Choices, choices."""

import time
import sys


print('\n\n\n')


def speak(msg, amount):
	for i in msg:
		print(i, end='')
		sys.stdout.flush()
		time.sleep(amount / len(msg))
	print()


class Decision:
	def __init__(self, slug, message, speed):
		self.slug = slug
		self.message = message
		self.speed = speed
		self.options = []
	
	def ask(self):
		print('\n' * 40)
		speak(self.message, self.speed)
		print()
		
		for i, v in enumerate(self.options):
			if type(v) == Point:
				v = v() # Evaluate pointer
				self.options[i] = v
			print(i, ': ', v.slug)
		
		chosen = int(input('>'))
		
		return self.options[chosen]
	
	def add(self, v):
		self.options.append(v)
	
	def copy(self):
		new_me = Decision(self, self.slug, self.message, self.speed)
		new_me.options = self.options.copy()
		return new_me


every = dict()


# Handle self-referencial assignment
class Point:
	def __init__(self, location):
		self.location = location
		self.data = None
	def __call__(self):
		self.data = eval('every')
		return self.data[self.location]


def connect(data, current_path):
	name = data['name']
	slug = data['slug']
	message = data['mesg']
	speed = data['sped']
	active = Decision(slug, message, speed)
	
	print(name, slug, message, speed, sep=':')
	
	# Add pointers for references.
	every[current_path] = active
	
	del data['name'], data['slug'], data['mesg'], data['sped']
	for (i, v) in data.items():
		# try:
		# 	i = int(i)
		# except ValueError:
		# 	i = i
		if type(i) == int:
			if type(v) == str:
				next_choice = Decision(v.split('///'))
				active.add(next_choice)
			elif type(v) == dict:
				next_choice = connect(v, current_path + ':' + name)
				active.add(next_choice)
			elif (type(v) == Decision) or (type(v) == Point):
				active.add(v)
			elif type(v) == tuple:
				next_choice = v[0].copy()
				v.slug = v[1]
				active.add(v)
			else:
				raise ValueError('unexpected value %s' % repr(v))
		else:
			raise KeyError('unexpected key %s ' % repr(i))
	return active


# Begin Actual Game #

story = {
	'name': 'first',
	'slug': 'Back to the beginning?',
	'mesg': 'Hello to your new story.',
	'sped': 3,
	0: {
		'name': 'second',
		'slug': 'To adventure!',
		'mesg': 'Adventure was a bummer.',
		'sped': 1,
		0: Point('first'),
	},
	1: {
		'name': 'nothing',
		'slug': 'Nothing.',
		'mesg': 'I am serious, there is nothing here.',
		'sped': 0,
		0: Point('first'),
	},
}

story_point = connect(story, story['name'])

if __name__ == '__main__':
	while True:
		story_point = story_point.ask()





