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

import sys
import argparse

from .convert import convert_csv
from .common import clear_screen
from .common import screen_header
from . import __version__
from . import __summary__

def main():
    parser = argparse.ArgumentParser(
        add_help=True,
        description=__summary__)
    
    parser.add_argument('-n', '--name',
                        action="store",
                        required=True,
                        type=str,
                        help='name of file to convert')
    
    parser.add_argument('-s', '--srcd',
                        action="store",
                        required=True,
                        type=str,
                        help='source directory of the file')
    
    parser.add_argument('-c', '--csvd',
                        action="store",
                        required=True,
                        type=str,
                        help='output directory for file')
    
    parser.add_argument('-v', '--version', 
                        action='version',
                        version='%(prog)s ' + __version__,
                        help='display module version')

    # process the arguments
    args = parser.parse_args()
    if len(sys.argv) < 3:
        parser.print_help()
        sys.exit(1)
    else:
        name = str(args.name)
        srcd = str(args.srcd)
        csvd = str(args.csvd)

    clear_screen()
    screen_header(40, "CSV Conversion using Pandas")
    convert_csv(name, srcd, csvd)

if __name__ == '__main__':
    main()