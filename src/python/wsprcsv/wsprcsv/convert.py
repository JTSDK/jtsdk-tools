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
r"""CSV Conversion Module using ``Pandas``

Description
-----------
``wsprcsv convert`` Reads a previously downloaded CSV file from
`WSPRnet Download Directory`_.; converts the epoch time to Date and Time fields
(columns); removes both the ``spot_id`` and original ``timestamp`` columns;
then creates a converted csv file from the results.

Notes
-----
    The previous package `WSPR-ANA` used the users home directory for default
    file storage of compressed, then extracted files. The same folder can be
    passed to ``wsprcsv`` and used in the same manner.

    ``csvd`` = is the download directory from `WSPRnet Download Directory`_.
    ``srcd`` = is the extraction directory after processing.

    Windows
        srcd = C:\Users\%userprofile%\AppData\Local\WSPR-ANA\srcd
        csvd = C:\Users\%userprofile%\AppData\Local\WSPR-ANA\csvd

    Linux
        srcd = $HOME/.local/share/WSPR-ANA/srcd
        csvd = $HOME/.local/share/WSPR-ANA/csvd

Example
-------

    Windows
        set name=wsprspots-2009-01.csv.zip
        set srcd=D:\tmp\srcd
        set csvd=D:\tmp\csvd

        As a package
            $ wsprcsv -n %name% -s %srcd% -c %csvd%  

        As a file:
            $ python convert.py -n %name% -s %srcd% -c %csvd%  

    Linux
        name="wsprspots-2009-01.csv.zip"
        srcd="$HOME//srcd"
        csvd="$HOME//srcd"

        As a package
            $ wsprcsv -n %name% -s %srcd% -c %csvd%  

        As a file:
            $ python convert.py -n %name% -s %srcd% -c %csvd%  

References
----------

.. _WSPRnet Download Directory:
   http://wsprnet.org/drupal/downloads

"""
import os
import sys
import datetime
import time
import pandas as pd

from .common import clear_screen
from .common import expanduser
from .common import get_user_home
from .common import get_compression
from .common import file_size

debug = '0'
"""Variable for debug print """

def convert_csv(name, srcd, csvd):
    """Convert Epoch Time and Date using Pandas
    
    Converts Epoch times from downloaded CSV file, adding Date and
    Time while removing ``spot_id`` and ``timestamp`` columns.

    Parameters
    ----------
        name : str
            name of the file to process
        srcd : str
            location, as a string, to the folder containing name.
        csvd : str
            location for the output from the conversion.
    
    """
    infile = os.path.join(srcd,name)
    """Combine name and srvd for final path to file"""

    outfile = os.path.join(csvd, "df-" + name[:-4])
    """Add df and remove extension to create outfile name """

    if debug == '1':
        print("Infile  :", infile)
        print("Outfile :", outfile)
        print("SRCD    :", srcd)
        print("CSVD    :", csvd)
        sys.exit(0)

    # Import the dataframe from CSV
    print("\nDATA")
    print(" In-File ...: {infile}".format(infile=infile))
    print(" Out-File ..: {outfile}".format(outfile=outfile))
    print("\n")
    print("ACTIONS")
    print(" * Import CSV")

    # Read in the CSV source file
    start = time.time()
    df = pd.read_csv(infile, compression=get_compression(), 
        header=None, sep=',', quotechar='"', error_bad_lines=False)
    et1 = time.time() - start

    # Extract DATE from epoch
    print(" * Convert Date")
    et2_start = time.time()
    df['date'] = pd.to_datetime(df[1], unit='s').dt.strftime('%Y-%m-%d')
    et2 = time.time() - et2_start

    # Extract TIME from epoch
    print(" * Convert Time")
    et3_start = time.time()
    df['time'] = pd.to_datetime(df[1], unit='s').dt.strftime('%H%M')
    et3 = time.time() - et3_start

    # Add column names
    df.columns = ['spot_id','timestamp','rptr','rgrid','snr','freq','call',
        'grid','pwr','drift','dist','az','band','ver','code','date','time']

    # Drop unwanted columns
    print(" * Re-Index Dataframe")
    et4_start = time.time()
    cols = [0,1]
    df.drop(df.columns[cols],axis=1,inplace=True)
    et4 = time.time() - et4_start

    # Rearrange columns after eliminating df.columns([[0,1]]) => Id and timestamp
    df = df[['date','time','rptr','rgrid','snr','freq','call','grid','pwr',
        'drift','dist','az','band','ver','code']]

    # Get row total
    count_row = df.shape[0]

    # Generate CSV File
    print(" * Generate DF-CSV")
    et5_start = time.time()
    df.to_csv(outfile, sep=',', index=False)
    et5 = time.time() - et5_start
    end = time.time()

    # Print the time summary
    print("\nSTATS")
    print(" * CSV File Size ....: {:,.2f} MB".format(file_size(infile)))
    print(" * DF-CSV File Size .: {:,.2f} MB".format(file_size(outfile)))
    print(" * Import ...........: {:.2f} sec".format(et1))
    print(" * Convert Date .....: {:.2f} sec".format(et2))
    print(" * Convert Time .....: {:.2f} sec".format(et3))
    print(" * Re-Index .........: {:.2f} sec".format(et4))
    print(" * Generate DF-CSV ..: {:.2f} sec".format(et5))
    print(" * Row Count ........: {:,}".format(count_row))
    print("-" * 40)
    print("          Total Time : {:.3f} sec".format(end - start))

    # First 5 rows in final dataframe
    print("\nDataframe (first 5 rows)\n")
    print(df.head(5))


if __name__ =='__main__':
    clear_screen()
    print("Run this Module from wsprcsv.")
