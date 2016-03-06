"""Basic tools for designing a text adventure."""


class Game:
    """Hold all game variables."""

    def __init__(self):
        self.data = dict()

    def save(self):
        printable = repr(self.data)

        print(printable)


class GameObject:
    """General class for tracking game objects."""

    def __init__(self, name, location=None):
        """Setup game object details."""

        self.name = name
        self.location = location

    def move(self, location):
        """Move object to new container.

        :param location: New container for object.
        :type location: Container
        """
        assert type(location) == Container, 'Put location not Container'

        old_location = self.location

        self.location = location
        location.add(self)
        old_location.remove(self)


class Container(GameObject):
    """Hold set of game objects."""

    def __init__(self, name, location=None, contents=set()):
        """Create empty game container."""

        super().__init__(name=name, location=location)
        self.contents = contents

    def __add__(self, other):
        """Add game object to container."""
        self.contents.add(other)

    def add(self, game_object):
        self.__add__(game_object)

    def __sub__(self, other):
        """Remove game object from container."""
        self.contents.remove(other)

    def remove(self, game_object):
        self.__sub__(game_object)

    def __len__(self):
        return len(self.contents)


class Area(Container):
    """Hold a combination of game objects and location description."""

    def __init__(self, name, location=None, contents=set(), description='Not Defined'):
        """Create area for player to view."""

        super().__init__(name, location=location, contents=contents)
        self.description = description


class Character(Container):
    """Represent game character."""


class Item(GameObject):
    """Represent movable item."""


class Dialogue(GameObject):
    """Object to open character dialogues."""
