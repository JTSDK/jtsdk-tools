# Install Core Applications

| Application Data ||
| ---| --- |
| Name        | Dotnet Core Apps |
| Version     | 3.0.0 |
| Arch        | 64 or 32 bit |
| Description | Net Core Apps used in JTSDK v3 |

## Supported Operating Systems

At present, this repository only supports Windows. Later releases will include
generic Linux support, and additional Ubuntu / Debian specific artifacts.

### Windows

- Win-10 x86-64 / x86-32
- Win-7|8 x86-64 / x86-32, in theory, but not tested.
- Win-XP and Vista are not supported.

### Linux

- Linux - Unsupported at this time.
- Arm Devices - Unsupported at this time.

## Installation

Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

- [Prerequisite Tools Installation](Install-Prerequisites.md)
- [Core Tool Installation](Install-Core-Tools.md)

```bash
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

```bash
# Change directories to the JTSDK-Tools installation
cd /d (C|D):\JTSDK-Tools

# Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Change Directories To The Cloned Repository
cd /d %JTSDK_HOME%\src\jtsdk-dotnet-core

# Clean the build tree
make clean

# Update Source
git pull origin master

# Install New Update
make install
```

This concludes the installation and / or upgrade for `JTSDK Core Applications`.

## Next Step

Proceed to => [MSYS2 Configuration](Install-Msys2.md)
