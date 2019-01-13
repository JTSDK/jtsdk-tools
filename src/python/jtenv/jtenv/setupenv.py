# -*- coding: utf-8 -*-
import os
import sys

from .printenv import print_header
from .common import clear_screen
from . import __version__ as version
from . import __name__ as name


def create_directories(appdirs):
    """Setup JTSDK Directory Structure"""
    msg = "Setting up directories based on file system hierarchy"
    clear_screen()
    print_header(name, version, msg)

    # loop through the dirs and create if not exist
    for key, value in appdirs.items():
        try:
            if os.path.exists(value):
                pass
            else:
                os.makedirs(value)
        finally:
            print('{0:<20} {1}'.format(key, value))

    print("\nFinished")

# end setupenv.py
