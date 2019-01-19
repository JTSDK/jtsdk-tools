
| Application Data ||
| ---| --- |
| Name        | JTSDK Upgrade 3.0.2 |
| Description | Net Core Apps used in JTSDK v3 |
| Release Notes | [Version 3.0.2](../release-notes/Release-Notes-3.0.2.md) |

Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

- [Prerequisite Tools Installation](../Home.md/#install-prerequisites.md)
- [Core Tool Installation](../Install-Core-Tools.md)

## Remove Old Files and Folders

``` shell
# Using Windows Explorer, remove the following files and folders (if installed)
Browse to (C|D):\JTSDK-Tools

# Remove folders
(C|D):\JTSDK-Tools\env
(C|D):\JTSDK-Tools\scripts

# Remove files
(C|D):\JTSDK-Tools\jtsdk-env.cmd
(C|D):\JTSDK-Tools\ver.git
(C|D):\JTSDK-Tools\ver.jtsdk
```

## Installation

``` shell
# Open a Windows Console, then change directories to the JTSDK-Tools installation
cd /d (C|D):\JTSDK-Tools

# Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Make a Source Directory
mkdir src

# Change Directories and Clone
cd src
git clone https://github.com/KI7MT/jtsdk-tools.git

# Change Directories and Make Install
cd jtsdk-tools
make install
```

## Upgrade

If the source clone is still present on the system, upgrading is the same as
installation, with an additional pull and clean commands. If not, use the
installation steps from above.

``` shell
# Change directories to the JTSDK-Tools installation
cd /d (C|D):\JTSDK-Tools

# Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Change Directories To The Cloned Repository
cd /d %JTSDK_HOME%\src\jtsdk-tools

# Clean the build tree
make clean

# Update Source
git pull origin master

# Install New Update
make install
```

>NOTE - If you have problems doing the pull, or upgrade, remove the source
folder `jtsdk-tools` and perform a new installation using the instructions
from above.

This concludes the installation and / or upgrade for `JTSDK Core Applications`.