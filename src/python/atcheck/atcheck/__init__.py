# -*- coding: utf-8 -*-
"""
All text Check
==============

1. Python application to parse WSJT-X All.TXT file

usage: atcheck

"""
import os
import sys
import getpass
import platform
from os.path import expanduser


# All-Text-Check: meta-data
version_info = (0, 0, 1)
__version__ = '.'.join(str(c) for c in version_info)
__name__ = "atcheck"
__author__ = "Greg Beam, KI7MT"
__license__ = "GPLv3"
__email__ = "ki7mt@yahoo.com"


def get_username():
    """Get username based on getpass

    Returns
        str: username
    """
    return getpass.getuser()


def get_system():
    r"""Get system type based on platform

    Returns
        str: `Windows || Linux || Darwin || Posix`
    """
    system = ""
    if sys.platform.startswith('win32'):
        system = "Windows"
    elif sys.platform.startswith('linux'):
        system = "Linux"
    elif sys.platform.startswith('darwin'):
        system = "Darwin"
    else: # guess that its a posix system if not the others
        system = "Posix"

    return system


def get_user_home():
    r"""Get User Home Directory
    
    Returns
        Windows
            `%userprofile%`
        Linux | Posix
            `$HOME`
    """
    return expanduser("~")


def get_share_dir():
    r"""Get share directory based on platform

    Returns
        Windows
            str: %userprofile\AppData\Local\WSJT-X
        Linux
            str: /home/$USER/.local/share/WSJT-X
        Darwin
            str: /home/$USER/Library/Application Support/WSJT-X
        Posix
            str: /home/$USER/.local/share/WSJT-X    

    """
    sharedir = ""
    if sys.platform.startswith('win32'):
        sharedir = os.path.join(os.getenv('LOCALAPPDATA'),'WSJT-X')
    elif sys.platform.startswith('linux'):
        sharedir = os.path.join(get_user_home(),'.local','share','WSJT-X')
    elif sys.platform.startswith('darwin'):
            sharedir = os.path.join(get_user_home(),'Library','Application Support','WSJT-X')
    else:
        sharedir = os.path.join(get_user_home(),'.local','share','WSJT-X')

    return sharedir


# All-Text-Check: global variables
__username__ = get_username()
__homedir__ = get_user_home()
__sharedir__ = get_share_dir()


# All-Text-Check meta-data
__all__ = ['__version__',
            '__name__',
            '__author__',
            '__license__',
            '__email__',
            '__username__',
            '__homedir__',
            '__sharedir__'
            ]

# end __init__.py
