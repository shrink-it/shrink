"""
tui.py

The handler for the terminal aspect of user input
and output throughout the project. 

Exports:
  startShrink() -> str | NoReturn
"""

import sys
from typing import NoReturn

TUI_TEXT_MAIN: str = """\n\n
Shrink
A simple file compression tool

Options:
Type any filename to shrink
Type ? followed by:
    quit
    help

> """

filename: str

def _startShrink() -> int:
    res: str

    res = input(
        TUI_TEXT_MAIN
    )

    if res.startswith("?"):
        cmd = res.removeprefix("?")

        match cmd:
            case "quit": return -1
            case "help": return 1
    
def startShrink() -> str | NoReturn:
    while True:
        match _startShrink():
            case -1:
                sys.exit(0)
            case 0:
                return filename
            case 1:
                continue
