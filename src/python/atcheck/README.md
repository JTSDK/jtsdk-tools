# JTSDK-Tools ( atcheck )

| Application Data ||
| ---| --- |
| Package             | `atcheck`
| Version             | 0.0.1
| Topic               | Communications, Ham Radio
| Development Status  | 2 - Pre-Alpha
| Distributions       | Windows, Linux, MacOS
| Arch                | Any (x86-64 recommended)
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library
| Virtual Environment | Anaconda Python 2018.12

## Description

Simple [Python][] script that checks `ALL.TXT` file produced by the [WSJT-X][]
application.

## Development Status

This package is in `Pre-Alpha`. The package was tested using
[Anaconda Python 2018.12][] with a default virtual environment creation e.g.
(`conda create -n jtsdk-py`).

## Requirements

- If running [JTSDK-Tools][], install [Install Anaconda Python][] if you've not done so.
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.
- For Linux, Mac, or Posix systems, any Python version 3.5+

## Installation

During `Pre-Alpha` testing, installation will pull the application from
[test.pypi.org][]. After `Pre-Alpha` testing, the package will be moved to the
main [PyPi][] repository where it will remain. When this change occurs, drop
the url (`https://test.pypi.org/simple/`) as it will no longer be needed.

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first.
# Note: for normal Python users, there is no hard requirement to use or create
# a special environment as the package uses the Standard Python Library only.
conda activate jtsdk-py

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ atcheck

```

## Usage

You can entry a `ALL.TXT` file location or not. If not, the app will look in
the [Platform Dependency Locations][] from the [WSJT-X v2.0.0 Manual][]

```bash
usage: atcheck [-h] [-f F] -mc MC -hc HC [-v]

Parse WSJT-X ALL.TXT File for callsigns.

optional arguments:
  -h, --help  show this help message and exit
  -f F        alternate location to ALL.TXT file
  -mc MC      My callsign
  -hc HC      His Callsign
  -v          display module version

atcheck [OPTION]
```

## Example Output

The following is a typical QSO where both parties send their calls during an
exchange.

### Using Default WSJT-X Location

```bash

# Using the Default WSJT-X ALL.TXT Location
# The callsigns are not case-sensitive. The app converts them
# before parsing the file.

# Command used: atcheck -mc w5vs -hc kd0vjo
# Results:

App Name ....:  atcheck
Version .....:  0.0.1
My Call .....:  W5VS
His Call ....:  KD0VJO

Processing Callsigns

Line  Date        Time    Band   Mode   Call        Call        Message
---------------------------------------------------------------------------
5504  2018-12-22  124045  7.074  FT8    KD0VJO      W5VS        FM18
5515  2018-12-22  124100  7.074  FT8    W5VS        KD0VJO      -13
5549  2018-12-22  124115  7.074  FT8    KD0VJO      W5VS        R+08
5563  2018-12-22  124130  7.074  FT8    W5VS        KD0VJO      RR73

Line Count .....: 893,045
Execution Time .: 9.22 sec
```

### Using Custom File Location

This is handy if you run multiple instances of [WSJT-X][] and the `ALL.TXT` file
resided in a different location to the [Platform Dependency Locations][].

```bash
# The same two calls are used, however, the file is in a different location
# Note the -f <path>

# Command used : >atcheck -f D:\JTSDK-Tools\tmp\ALL.TXT -mc W5VS -hc KD0VJO

# Results
App Name ....:  atcheck
Version .....:  0.0.1
My Call .....:  W5VS
His Call ....:  KD0VJO

Processing Callsigns

Line  Date        Time    Band   Mode   Call        Call        Message
---------------------------------------------------------------------------
5504  2018-12-22  124045  7.074  FT8    KD0VJO      W5VS        FM18
5515  2018-12-22  124100  7.074  FT8    W5VS        KD0VJO      -13
5549  2018-12-22  124115  7.074  FT8    KD0VJO      W5VS        R+08
5563  2018-12-22  124130  7.074  FT8    W5VS        KD0VJO      RR73

Line Count .....: 893,045
Execution Time .: 9.19 sec



```

## Upgrade

To upgrade to the latest release, use `pip`

```bash
# If using JTSDK-Tools, active jtsdk-py first. All others can enter directly.
conda activate jtsdk-py

# Upgrade Command
pip install --upgrade atcheck
```

## Uninstall

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtsdk-py

# Uninstall command
pip uninstall atcheck

```

[Install Anaconda Python]: https://ki7mt.github.io/jtsdk-tools/windows/Install-Python/
[JTSDK-Tools]: https://ki7mt.github.io/jtsdk-tools/
[test.pypi.org]: https://test.pypi.org/project/atcheck/
[PyPi]: https://pypi.org/
[Anaconda Python 2018.12]: https://ki7mt.github.io/jtsdk-tools/windows/Install-Python/
[Python]: https://www.python.org/
[WSJT-X]: https://physics.princeton.edu/pulsar/k1jt/wsjtx.html
[Platform Dependency Locations]: https://physics.princeton.edu/pulsar/k1jt/wsjtx-doc/wsjtx-main-2.0.0.html#PLATFORM
[WSJT-X v2.0.0 Manual]: https://physics.princeton.edu/pulsar/k1jt/wsjtx-doc/wsjtx-main-2.0.0.html