# -*- coding: utf-8 -*-
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
"""WSPRCSV Iterator Functions

This module provides callable functions that iterate over the published
archives on `WSPRnet` [1].

Example
-------
    import iterator

    $python iterator.py

Notes
-----
    The WSPRnet [1] download archives contain both Windows `zip` and
    and Unix `gz` file formats.

    In future releases, these functions may be comboned into a separate
    package and imported as appropriate.

    For consistency, module attributes are annotated in their respective
    function.

References and Footnotes
------------------------

    [1] http://wsprnet.org/drupal/downloads

"""
import os
from datetime import datetime

from os.path import expanduser

from . import common
from .common import clear_screen

wsprcsv = "WSPR-ANA"
"""Backward compatability for WSPR-ANA package"""

year_list: range = range(2008, datetime.now().year + 1)
"""Year list from 2008 to present"""

month_list = ['01', '02', '03', '04', '04', '06', '07', '08',
              '09', '10', '11', '12']
"""Month list with leading '0' used in combination with year range"""

url_prefix: str = "http://wsprnet.org/archive"
"""Prefix  of the WSPRnet Download site"""

home = expanduser("~")
"""User Home directory.

Example
-------
    
    Windows %userprofile% = C:\\Users\\ki7mt

    Linux cls$HOME = //home//ki7mt

"""


def csv_iterator(srcd):
    r"""Loop through all years and months for a given source location.

    Example
    -------

        from os.path import expanduser
        home = expanduser("~")
        srcd = os.path.abspath(os.path.join(os.path.sep, 
            home,'AppData','local','wsprcsv', 'srcd'))

        Windows
            C:\\Users\user1\AppData\local\wsprcsv\srcd
        
        Linux
            //home/user1/.local/share/wsprcsv/srcd

    """
    clear_screen()

    # outer loop for year in yr_list range
    for year in year_list:
        os.chdir(srcd)
        # lower year limit based on start of WSPRNET in 2008
        if year < 2009: 
            main_list = month_list[2:]
        else:
            # loop through months up to current month only
            if year == datetime.now().year:
                main_list = month_list[:0 + datetime.now().month]
            else:
                main_list = month_list

        # inner loop: month(s) for each year
        for month in main_list:
            print("{0}/wsprspots-{1}-{2}.csv.{3}".format(
                url_prefix, year, month, common.get_ext())
            )


if __name__ == '__main__':
    clear_screen()
    srcd = os.path.abspath(os.path.join(os.path.sep, home,
                                        'AppData', 'local', wsprcsv, 'srcd'))
    csv_iterator(srcd)
