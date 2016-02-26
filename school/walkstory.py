"""Take a walk through an environment.

Notes:
    The game is played by navigating a series of
    menus in order to reach an end goal.
"""

# Declare Metadata
meta = {
    'name': 'The Office',
    'version': '$1.0$',
}

# Declare Save Data
save = dict()

# Declare Assets
rna = {
    'menu': dict()
}


class GameMenu:
    """Define a menu for players to choose from a list of options.

    Rules:
        Menus must be given at least one option.

    Attributes:
        name (str): Describe the name of the menu.
        text (str): Describe the text that will be displayed to the player when the menu is opened.
        options (list): List of all menu options that the player can choose.
    """

    def __init__(self, name: str, menu_text: str):
        self.name = name
        self.text = menu_text
        self.options = []

    def text(self, menu_text: str):
        """Update visible text of menu.

        Args:
            menu_text (str): Specify menu text
        """

        self.text = menu_text

    def add_option(self, option_text: str, next_function: staticmethod=None):
        """Add a single option to the menu.

        Args:
            option_text (str): The text to display when option is presented.
            next_function (staticmethod): The method to call after option has been chosen.
        """

        self.options.append([option_text, next_function])
        return len(self.options)

    def change_text(self, option_number: int, new_text: str):
        """Update option text.

        Args:
            option_number (int): Specify option to change
            new_text (str): Specify new option text
        """

        self.options[option_number][0] = new_text

    def open(self) -> staticmethod:
        """Open menu and receive player decision."""

        print(self.name + '\n')
        print(self.text + '\n')
        for i, v in enumerate(self.options):
            print(i + 1, ')', v[0])
        print()
        decision = int(input(':')) - 1
        return self.options[decision][1]


class GameContainer:
    """Define a container to hold items."""

    def __init__(self):
        pass


class GameItem:
    """Define an item for containers to hold."""

    def __init__(self):
        pass
