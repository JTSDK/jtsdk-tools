# -*- coding: utf-8 -*-
"""
JTenv
=====

Provides:
  1. Sets up application directories based on Windows, Linux, or Darwin FSH
  2. Prints Java, User, System, and JTSDK Environment variables

usage: jtenv [-h] [-a] [-j] [-s] [-S] [-u] [-z] [-v]

    Print Environment Variables

    optional arguments:
    -h, --help     show this help message and exit
    -a, --all      List all variables
    -j, --java     Java related variables
    -s, --system   System variables and exit
    -S, --setup    Creates JTSDK-Tools folders
    -u, --user     User variables and exit
    -z, --jtsdk    JTSDK-Tools variables
    -v, --version  The application version number

"""
import os
import sys
import getpass
import platform
from os.path import expanduser


# Package meta-data
version_info = (3, 0, 14)
__version__ = '.'.join(str(c) for c in version_info)
__name__ = "jtenv"
__author__ = "Greg Beam, KI7MT"
__license__ = "GPLv3"
__email__ = "ki7mt@yahoo.com"


def get_username():
    """Get username based on getpass

    Returns
        str: username
    """
    return getpass.getuser()


def get_host_name():
    """Get system host name

    Returns
        str: hostname
    """
    return str(platform.uname()[1])


def get_os():
    """Get operating system """
    return str(platform.uname()[0])


def get_osversion():
    """Get operating system version
    
    Returns
        str : operating system version
    """
    if sys.platform.startswith('win32'):
        return str(platform.uname()[3])
    else:
        return str(platform.uname()[2])


def get_arch():
    """Get architecture
    
    Returns
        str: system architecture
    
    """
    if sys.platform.startswith('win32'):
        return str(platform.uname()[4])
    else:
        return str(platform.uname()[3])


def get_processor():
    """Get processor
    
    Returns
        str : processor information
    
    """
    return str(platform.uname()[5])


def get_system():
    r"""Get system type based on platform

    Returns
        str: `Windows || Linux || Posix`
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
            str: %userprofile\AppData\Local\JTSDK
        Linux
            str: /home/$USER/.local/share/JTSDK
    """
    sharedir = ""
    if sys.platform.startswith('win32'):
        sharedir = os.path.join(os.getenv('LOCALAPPDATA'),'JTSDK')
    else:
        sharedir = os.path.join(get_user_home(),'.local','share','JTSDK')

    return sharedir


def get_config_dir():
    r"""Get config directory based on platform

    Returns
        Windows
            str: %userprofile%\AppData\Local\JTSDK\config
        Linux
            str: /home/$USER/.config/JTSDK/config
    """
    configdir = ""
    if sys.platform.startswith('win32'):
        configdir = os.path.join(get_share_dir(),'config')
    else: # for posix | linux systems
        configdir = os.path.join(get_user_home(),'.config','JTSDK')

    return configdir


def get_data_dir():
    r"""Get data directory based on platform

    Returns
        Windows
            str: %userprofile\AppData\Local\JTSDK\data
        Linux
            str: /home/$USER/.local/share/JTSDK/data
    """
    datadir = ""
    if sys.platform.startswith('win32'):
        datadir = os.path.join(get_share_dir(),'data')
    else:
        datadir = os.path.join(get_user_home(),'.local','share','JTSDK','data')

    return datadir


# JTSDK-Tools meta-data
__configfile__ = 'jtsdk.conf'
__system__ = get_system()
__username__ = get_username()
__hostname__ = get_host_name()
__os__ = get_os()
__osversion__ = get_osversion()
__arch__ = get_arch()
__processor__ = get_processor()
__homedir__ = get_user_home()
__sharedir__ = get_share_dir()
__configdir__ = get_config_dir()
__datadir__ = get_data_dir()


# All meta-data
__all__ = ['__version__',
            '__name__',
            '__author__',
            '__license__',
            '__email__',
            '__configfile__',
            '__system__',
            '__username__',
            '__hostname__',
            '__os__',
            '__osversion__',
            '__arch__',
            '__processor__',
            '__homedir__',
            '__sharedir__',
            '__configdir__',
            '__datadir__'
            ]

# end __init__.py
