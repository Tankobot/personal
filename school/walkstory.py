"""Take a walk through an environment."""

# Declare Metadata
meta = {
    'name': 'The Office',
    'version': '1.0',
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

    def __init__(self, name: str) -> None:
        self.name = name
        self.text = ''
        self.options = []

    def text(self, viewer_text: str) -> None:
        self.text = viewer_text

    def add_option(self, option_text: str, func: staticmethod=None):
        """Add a single option to the menu.

        Parameters:
            option_text (str): The text to display when option is presented.
            func (staticmethod): The method to call after option has been chosen.
        """
        self.options.append([option_text, func])
        # TODO add option function call.

    def open(self):
        pass


class GameContainer:
    """Define a container to hold items."""


class GameItem:
    """Define an item for containers to hold."""

    def __init__(self):
        pass
