# -*- coding: utf-8 -*-
# Copyright (C) 2019 Greg Beam, KI7MT
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

import os
import sys

from os.path import expanduser


wsprcsv = "WSPR-ANA"
"""Used for WSPR-ANA Backward compatibility"""


def get_user_home():
    """Return User Home Directory"""
    return expanduser("~")


def clear_screen():
    """Clear screen based on platform."""
    if sys.platform == 'win32':
        os.system('cls')
    else:
        os.system('clear')


def get_ext():
    """Return Extension based on platform """
    if sys.platform == 'win32':
        ext = "zip"
    else:
        ext = "gz"
    
    return ext


def get_compression():
    """Return File Compression Extension based on platform"""
    if sys.platform == 'win32':
        comp = "zip"
    else:
        comp = "gzip"

    return comp


def get_srcd():
    """Return SRC Direcotry Example"""
    if sys.platform == 'win32':
        srcd = os.path.abspath(os.path.join(get_user_home(),'AppData','local', wsprcsv, 'srcd'))
    else:
        srcd = os.path.abspath(os.path.join(os.path.sep, 
            get_user_home(), '.local','share', wsprcsv, 'srcd'))

    return srcd


def file_size(fname):
        """Return File Size in MB """
        import os
        statinfo = os.stat(fname)

        return (statinfo.st_size)/1000/1000


def screen_header(num, text):
    """Print screen header"""
    print("-" * num)
    print(text)
    print("-" * num)


def line_sep(num,test):
    """Repeat single line of text """
    print("-" * num)


if __name__ == "__main__":
    """Main Method for testing Common Module"""
    clear_screen()
    screen_header(30,"Common Module Functions")
    print("\nUser Home Directory ...: {}".format(get_user_home()))
    print("Archive Extension ......: {}".format(get_ext()))
    print("File Compression .......: {}".format(get_compression()))
    print("Print SRCD Directory ...: {}".format(get_srcd()))
