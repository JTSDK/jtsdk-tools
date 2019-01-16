# JTSDK-Tools ( atcheck )

| Application Data ||
| ---| --- |
| Package             | `atcheck`
| Version             | 0.0.1
| Topic               | Communications, Ham Radio
| Development Status  | 4 - Alpha
| Distributions       | Windows, Linux, MacOS
| Arch                | Any (x86-64 recommended)
| Python              | Version >= 3.5
| Dependencies        | Standard Python Library
| Virtual Environment | Anaconda Python 2018.12

## Development Status

This package is in `Pre-Alpha`. The package was tested using 
[Anaconda Python 2018.12][] with a default virtual environment creation e.g.
(`conda create -n jtsdk-py`).

## Description

Simple [Python][] script check `ALL.TXT` file produced by the `WSJT-X application.

## Requirements

- If running [JTSDK-Tools][], install [Install Anaconda Python][] if you've not done so.
- Any [Python][] version >= 3.5, virtual or native installation
- No special modules or distributions are required.

## Installation

During `Pre-Alpha` testing, installation will pull yhe application from
[test.pypi.org][]. After `Pre-Alpha` testing, the package will be moved to the
main [PyPi][] repository where it will remain.

Open a condole, and type the following:

```bash
# If using JTSDK-Tools, active jtsdk-py first
conda activate jtsdk-py

# Install command: note the space after trailing /
pip install -i https://test.pypi.org/simple/ atcheck

```

## Usage

Under Development

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