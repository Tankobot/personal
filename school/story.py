"""Basic tools for designing a text adventure."""


class Game:
    """Hold all game variables."""

    def __init__(self):
        self.data = dict()


class GameObject:
    """General class for tracking game objects."""

    def __init__(self, name):
        """Method to setup game object details."""

        self.name = name
        self.location = None

    def put(self, location):
        assert type(location) == Container, 'Put location not Container'

        old_location = self.location

        self.location = location
        location.add(self)
        old_location.sub(self)


class Area(GameObject):
    pass


class Container(GameObject):
    pass


class Item(GameObject):
    pass


class Character(GameObject):
    pass


class Text(GameObject):
    pass


class Dialogue(Text):
    pass
