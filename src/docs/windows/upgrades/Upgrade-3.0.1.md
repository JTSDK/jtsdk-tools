
| Application Data ||
| ---| --- |
| Name        | JTSDK Upgrade 3.0.1 |
| Description | Net Core Apps used in JTSDK v3 |
| Release Notes | [Version 3.0.1](../release-notes/Release-Notes-3.0.1.md) |

Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

- [Prerequisite Tools Installation](../Home.md/#install-prerequisites.md)
- [Core Tool Installation](../Install-Core-Tools.md)

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
installation, with an additional pull command. If not, use the installation steps
from above.

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

This concludes the installation and / or upgrade for `JTSDK Core Applications`.