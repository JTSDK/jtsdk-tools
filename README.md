# JTSDK-Tools and .Net Core Applications
This repository is designed to work specifically with the JTSDK Version 3 series
tool-chain. It would be of little use elsewhere.

Delivery will be a frequent release of the of the `master` branch. `Branches`
will be used mainly for development, keeping the `master` branch in a stable
condition for end users. `Tags` will be use dto archive milestones and will
appear in the [release section](https://github.com/KI7MT/jtsdk-dotnet-core/releases).

## Bug Reports and Feature Requests
For submitting bugs reports and feature requests, use the [Issue Tracker](https://github.com/KI7MT/jtsdk-dotnet-core/issues).

One of the main faulre points of `JTSDK v2` was the lack of flexablity and absence
of user request tracking. The aim of `JTSDK-Tools` is to use an Agile delivery
system to create a high-quality build system for the applicaitons it can
support. Utilizing Githubs [Issue Tracker](https://github.com/KI7MT/jtsdk-dotnet-core/issues)
users can quickly see the status of any particular request, discuss the merits,
and see the final disposition.

## Supported Operating Systems
At present, this repository only supports Windows. Later releases with include
generic Linux support, and additional Ubuntu / Debian specific artifacts.

### Windows
* Win-10 x86-64 / x86-32
* Win-7|8 x86-64 / x86-32, in theory, but not tested.
* Win-XP and Vista are not supported.

### Linux
* Linux - Unsupported at this time.
* Arm Devices - Unsupported at this time.

>Note - The Core tool-chain does not require x86-64 bit applications. However,
it is highly recommended to use x86-64 if your hardware supports it.

## Supported Tool Chain
* [JTSDK-Tools v3.0.0-7 Beta](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/beta-testing/)

As the tool-chain is updated, this package will track with those changes.

## Prerequisites
In order to checkout and compile this package, the user must have two
utilities installed at the `system level`:
* [Git for Windows](https://git-scm.com/) (or comprable Git Client)
* Microsoft [.Net Core SDK v2.1.300](https://www.microsoft.com/net/download/windows)
or later

Both packages must be available from a standard Windows Console. If not, users
should add--either locally or system wide--the path locations which allows access
to both `git` and `dotnet` command line tools. Using the commands `git --version`
and `dotnet --info` should render without error.

## Installation
Installation of this package should follow the tool-chain installation and
setup.

```
# Open a Windows Console, then change directories to the JTSDK-Tools installation
cd /d (C|D):\JTSDK-Tools

# Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Make a Source Directory
mkdir src

# Change Directories and Clone
cd src
git clone https://github.com/KI7MT/jtsdk-dotnet-core.git

# Change Directories and Make Install
cd jtsdk-dotnet-core
make install
```

## Upgrade
If the source clone is still present on the system, upgrading is the same as
installation, with an additional pull command. If not, use the installation steps
from above.
```
# Change Directories To The Cloned Repository
cd /d (C|D):\JTSDK-Tools\src\jtsdk-dotnet-core

# Update Source
git pull origin master

# Install New Update
make install
```