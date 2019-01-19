# Environment Using Python

| Application Data ||
| ---| --- |
| Package             | `jtenv`
| Version             | 3.0.14
| Topic               | Communications, Ham Radio
| Development Status  | 2 - Beta
| Distributions       | Windows, Linux, MacOS
| Arch                | Any (x86-64 recommended)
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library
| Virtual Environment | Anaconda Python 2018.12
| Description         | Python application to list environment variables |

## Development Status

This package is in `Beta`. The package was tested using 
[Anaconda Python 2018.12][] with a default virtual environment creation e.g.
(`conda create -n jtsdk-py`).

## Description

Simple [Python][] script to print various environment variables associated
with [JTSDK-Tools][]

## Requirements

- If running [JTSDK-Tools][], install [Install Anaconda Python][] if you've not done so.
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

During `Beta` testing, installation will pull yhe application from
[test.pypi.org][]. After `Beta` testing, the package will be moved to the main
[PyPi][] repository where it will remain.

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtsdk-py

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ jtenv

```

## Usage

```bash
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
```

## Uninstall

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtsdk-py

# Uninstall command
pip uninstall jtenv

```

[Install Anaconda Python]: https://ki7mt.github.io/jtsdk-tools/windows/Install-Python.md
[JTSDK-Tools]: https://ki7mt.github.io/jtsdk-tools/
[test.pypi.org]: https://test.pypi.org/project/jtenv/
[PyPi]: https://pypi.org/
[Anaconda Python 2018.12]: https://ki7mt.github.io/jtsdk-tools/windows/Install-Python.md
[Python]: https://www.python.org/