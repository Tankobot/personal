"""Choices, choices."""

import time
import sys


def speak(msg, amount):
	for i in msg:
		print(i, end='')
		sys.stdout.flush()
		time.sleep(amount / len(msg))
	print()


global data = dict()


def nothing_f():
	pass
	

def index(dic, *args):
	focus = dic
	for i in args:
		pass


class decision:
	def __init__(self, slug, message, speed):
		self.slug = slug
		self.message = message
		self.speed = speed
		self.options = []
	
	def ask():
		print('\n' * 40)
		speak(self.message, self.speed)
		
		for i, v in enumerate(self.options):
			print(i, ': ', v.slug)
		
		return self.options[i]
	
	def add(v):
		self.options.append(v)

def map_decisions(deci_map, beginning):
	for i, v in deci_map:
		if type(v) == dict:
			piece = map_decisions(v, deci_map['f_' + i])
		elif type(v) == str:
			beginning.add(lambda: story[v]())
		else
			beginning.add(v)


# Begin Actual Game #
