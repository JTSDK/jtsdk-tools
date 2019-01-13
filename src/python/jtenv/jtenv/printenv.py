# -*- coding: utf-8 -*-
import os
import sys

from .common import clear_screen, get_python_version


def merge_dict(dict1, dict2):
    """ Combine two dictionary's

    Returns
        dict: combined dictionary's

    """
    dict = {**dict1, **dict2}
    return dict


def print_header(name, version, msg):
    """Print application header"""
    clear_screen()
    print("\nApplication    : %s" % name)
    print('Version        : %s' % version)
    print('Python Version : %s' % get_python_version())
    print("\n{msg}".format(msg=msg))
    print("")
    print('{0:<20} {1}'.format("Variable", "Path"))
    print("-" * 55)


def print_list(list):
    """Prints a list of environmental variables"""
    for i in list:
        try:
            print('{0:<20} {1}'.format(i, os.environ[i]))
        except KeyError:
            print('{0:<20} {1}'.format(i, '-- undefined --'))

def print_dict(dict):
    """Prints a dictionary"""
    for key, value in dict.items():
        try:
            print('{0:<20} {1}'.format(key, value))
        except KeyError:
            print('{0:<20} {1}'.format(key, '-- undefined --'))

def print_dirs(dict):
    """Prints Path dictionary"""
    for key, value in dict.items():
        try:
            if os.path.exists(value):
                print('{0:<20} {1}'.format(key, value))
            else:
                print('{0:<20} {1}'.format(key, "--does not exist--"))
        except KeyError:
            print('{0:<20} {1}'.format(key, '-- undefined --'))

def print_all(list, dict):
    """Call print list and dictionary functions"""
    print_dict(dict)
    print_list(list)

# END - printenv.py
