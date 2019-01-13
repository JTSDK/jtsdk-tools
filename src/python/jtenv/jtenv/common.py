# -*- coding: utf-8 -*-
import os
import sys
from platform import python_version


def get_python_version():
    """Retruns Python Version"""
    return python_version()


def clear_screen():
    """Clear screen based on platform."""
    os.system('cls' if os.name == 'nt' else 'clear ||:')
