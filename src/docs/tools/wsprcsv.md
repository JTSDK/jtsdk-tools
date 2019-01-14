# WSPR CSV Conversion Utility

| Application Data ||
| ---| --- |
| Package             | [wsprcsv][]
| Version             | 3.0.14
| Topic               | Science/Research, Utilities
| Development Status  | 4 - Beta
| Compatibility       | Windows, Linux, MacOS
| Arch                | Any (x86-64 recommended)
| Python              | Version >= 3.5
| Dependencies        | [Pandas][]
| Virtual Environment | Anaconda Python 2018.12
----

## About Anaconda Python

>Anaconda Python is a free, easy-to-install, package manager, environment
>manager and Python distribution with a collection of 1,000+ open source packages
>with free community support. Anaconda is platform-agnostic, so you can use it
>whether you are on Windows, MacOS or Linux.
>
>-- *Anaconda, Inc., www.anaconda.com*

## About Pandas

>pandas is an open source, BSD-licensed library providing high-performance,
>easy-to-use data structures and data analysis tools for the Python programming
>language. pandas is a NumFOCUS sponsored project. This will help ensure the
>success of development of pandas as a world-class open-source project, and makes
>it possible to donate to the project.
>
>--[The Pandas Project][]

## Development Status

This package is in `Beta`. The package was tested using
[Anaconda Python 2018.12][] with a default virtual environment creation e.g.
(`conda create -n jtsdk-py`).

## Description

`wsprcsv` is a collection of Python scripts used to manage `WSPR` data-files using
[Pandas][]. It takes an original [WSPR Spots CSV][] and converts Epoch times to
`Date` and `Time` columns, then removes `Spot_Id` and epoch `timestamp` columns.

On smaller files (100K to 500K rows), it could be argued that looping through
the files with native Python functions could be faster. However, when processing 
`40+ Million Rows`, [Pandas][] is your friend. [Example Two](#conversion-results-two)
below is the most resent full-month archive from [WSPRnet][]. Processing was
intense to say the least:

## Requirements

The following are the minimal requirements to run `wsprcsv`.

- System running [Python(3)][], preferably in a Virtual Environment
- Python [Pandas][]
- Multi-Core CPU
- At least 2GB free memory, more is preferable
- 5 GB Free disk space minimum

If you use [Anaconda Python 2018.12][], creating a basic environment satisfies
all the package needs. By default, [Pandas][] is part of a default env install.

## Installation

Installing `wsprcsv` from a package is, by far, the easiest and fastest way to
get up running.

>NOTE: This process is only valid for pre-releases versions of `wsprcsv`. Once
> formally released, you will not need to specify the URL at.

```bash
# If using JTSDK-Tools, activate jtsdk-py

conda activate jtsdk-py

# Otherwise, create a Python Virtual Environment for testing:
conda create -n wsprcsv
conda activate wsprcsv

# Install wsprcsv package
pip install -i https://test.pypi.org/simple/ wsprcsv
```

## Validate Installation

In the same terminal, verify [wsprcsv][] is functional.

```bash
# In the terminal type
wsprcsv -h

# You should see the following. (wsprcsv) is the Python Virtual Environment
# I created used for this with installation test run.

(wsprcsv) (QT-5.5) d:\JTSDK-Tools\tmp >wsprcsv -h
usage: wsprcsv [-h] -n NAME -s SRCD -c CSVD

Pandas script to convert WSPRnet CSV files

optional arguments:
  -h, --help            show this help message and exit
  -n NAME, --name NAME  name of file to convert
  -s SRCD, --srcd SRCD  source directory of the file
  -c CSVD, --csvd CSVD  output directory for file

(wsprcsv) (QT-5.5) d:\JTSDK-Tools\tmp >
```

## Example Usage

The location for the `source` and `output` directories is up to the user. I used
[JTSDK-Tools Env][] for the example(s) after having created a Virtual Environment
named `wpsrcsv`.

### Download Source CSV

I used [wsprspots-2009-01.csv.zip][] for the first example, however, you can use
any file you like from the [Download Page][].

>IMPORTANT: If you are using Windows, download a `*.zip` file. Linux
>or Unix based platforms, pick a `*.gz` file.

>CAUTION: The newer the file, the longer the conversion process will take.
>`2009-01` comes in at **1.5 minutes** >where `2018-12` takes **20 minutes**
>and has `~40+ Million rows`.

>NOTE: I find it easier to set variables for each of the three elements, but,
>you can type them is is desired. Also, using variables allows you too loop
>through several archive files at once using a separate script that calls as
>`wsprcsv` as a conversion utility.

In the same Virtual Environment as the installation, run the following commands:

```bash
# Set the input variables (change the names and paths to meet your needs).
# You can enter the commands directly with --csvd and --srcd options.
# I elected to use variables.

# Win32|64
set name=wsprspots-2009-01.csv.zip
set srcd=D:\JTSDK-Tool\tmp
set csvd=D:\JTSDK-Tools\tmp

# Linux
name="wsprspots-2009-01.csv.zip"
srcd="$HOME/tmp"
csvd="$HOME/tmp"

# Run the wsprcsv command

# Windows
wsprcsv -n %name% -s %srcd% -c %csvd%

# Linux
wsprcsv -n $name -s $srcd -c $csvd
```

### Set Process Variables

```bash
# Commands, as typed in Windows JTSDK-Tools Env.

set name=wsprspots-2009-01.csv.zip
set srcd=D:\JTSDK-Tools\tmp
set csvd=D:\JTSDK-Tools\tmp
wsprcsv -n %name% -s %srcd% -c %csvd%
```

### Conversion Results

If all went as expected, you should see the following results.

```bash
----------------------------------------
CSV Conversion using Pandas
----------------------------------------

DATA
 In-File ...: D:\JTSDK-Tools\tmp\wsprspots-2009-01.csv.zip
 Out-File ..: D:\JTSDK-Tools\tmp\df-wsprspots-2009-01.csv

ACTIONS
 * Import CSV
 * Convert Date
 * Convert Time
 * Re-Index Dataframe
 * Generate DF-CSV

STATS
 * CSV File Size ....: 7.14 MB
 * DF-CSV File Size .: 50.14 MB
 * Import ...........: 2.63 sec
 * Convert Date .....: 3.27 sec
 * Convert Time .....: 2.95 sec
 * Re-Index .........: 0.14 sec
 * Generate DF-CSV ..: 5.51 sec
 * Row Count ........: 577,169
----------------------------------------
          Total Time : 14.569 sec

Dataframe (first 5 rows)

         date  time    rptr   rgrid  snr       freq    call    grid  pwr  drift  dist   az  band         ver  code
0  2009-01-01  0000   RA6AS  KN93vn    6  10.140166   DL6NL  JO50cb   20      0  2347   97    10   1.1_r1042     0
1  2009-01-01  0000    W3HH  EL89vb  -27  10.140166   DL6NL  JO50cb   20      0  7738  291    10  1.01_r1023     0
2  2009-01-01  0000  PA3GYK  JO21qq  -21  10.140130  EA1FAQ  IN71op   27      0  1357   31    10  1.01_r1023     0
3  2009-01-01  0000    PD4U  JO22xe  -11   7.040029  EA1FAQ  IN71op   27      0  1425   31     7  1.01_r1023     0
4  2009-01-01  0000   VK6DI  OF88cd  -26  10.140177  JE5FLM  PM74ah   37      1  7590  196    10  1.01_r1023     0

(wsprcsv) (QT-5.5) d:\JTSDK-Tools\tmp >
```

### Conversion Results Two

This set of results is from the latest full-month archive (`2018-12`). It
boasts a staggering `43+ Million Rows`.

```bash
----------------------------------------
CSV Conversion using Pandas
----------------------------------------

DATA
 In-File ...: D:\JTSDK-Tools\tmp\wsprspots-2018-12.csv.zip
 Out-File ..: D:\JTSDK-Tools\tmp\df-wsprspots-2018-12.csv

ACTIONS
 * Import CSV
 * Convert Date
 * Convert Time
 * Re-Index Dataframe
 * Generate DF-CSV

STATS
 * CSV File Size ....: 820.52 MB
 * DF-CSV File Size .: 3,642.12 MB
 * Import ...........: 214.58 sec
 * Convert Date .....: 279.73 sec
 * Convert Time .....: 243.00 sec
 * Re-Index .........: 55.26 sec
 * Generate DF-CSV ..: 449.30 sec
 * Row Count ........: 43,804,393
----------------------------------------
          Total Time : 1285.742 sec

Dataframe (first 5 rows)

         date  time       rptr   rgrid  snr     freq   call    grid  pwr  drift  dist   az  band        ver  code
0  2018-12-01  0000  2E0ILY/15  IO82qv   -9  0.13762  DK7FC  JN49ik   30      0   878  300    -1  0.8_r3058     0
1  2018-12-01  0000      DF2IC  JN49jo    2  0.13762  DK7FC  JN49ik   30      0    19   18    -1  0.8_r3058     0
2  2018-12-01  0000      DF6NM  JN59nj    3  0.13762  DK7FC  JN49ik   30      0   175   91    -1  0.8_r3058     0
3  2018-12-01  0000   DK7FC/15  JN49ik   11  0.13762  DK7FC  JN49ik   30      0     0    0    -1  0.8_r3058     0
4  2018-12-01  0000   DL0AO/15  JN59vk    3  0.13762  DK7FC  JN49ik   30      0   223   89    -1  0.8_r3058     0

(wsprcsv) (QT-5.5) d:\JTSDK-Tools\tmp >
```

## Uninstall

To uninstall the script, remembering to use the same Virtual Environment, type
the following:

```bash
# Windows and Linux
make uninstall
```

That should do it. Thanks for testing the script. Be sure to check back often
as additional features will be added to enhance the current capability.

[wsprcsv]: https://github.com/KI7MT/python-pypi-packages/tree/master/wsprcsv/
[requirements.txt]: https://github.com/KI7MT/python-pypi-packages/blob/master/wsprcsv/requirements.txt
[Pandas]: https://pandas.pydata.org/
[WSPRnet]: http://wsprnet.org
[Python(3)]: https://www.python.org/
[The Pandas Project]: https://pandas.pydata.org/
[source-code]: https://github.com/KI7MT/python-pypi-packages.git
[JTSDK-Tools Env]: https://github.com/KI7MT/github.io/jtsdk-tools/
[wsprspots-2009-01.csv.zip]: http://wsprnet.org/archive/wsprspots-2009-09.csv.zip
[Download Page]: http://wsprnet.org/drupal/downloads
[WSPR Spots CSV]: http://wsprnet.org/drupal/downloads
[Anaconda Python 2018.12]: https://www.anaconda.com/