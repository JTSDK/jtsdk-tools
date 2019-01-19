# JTSDK-Tools Upgrade 3.0.3

| Application Data ||
| ---| --- |
| Name        | JTSDK Upgrade 3.0.3 |
| Description | Net Core Apps used in JTSDK v3 |
| Release Notes | [Version 3.0.3](../release-notes/Release-Notes-3.0.3.md) |

Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

- [Prerequisite Tools Installation](../Home.md/#install-prerequisites.md)
- [Core Tool Installation](../Install-Core-Tools.md)

## Installation

Due to a repository name change, any previous checkout of `jtsdk-tools`
should be removed before checking out the new repository `jtsdk-tools`.

``` shell
# Step-1: Open a Windows Console, then change directories
# to the your JTSDK-Tools installation
cd /d (C|D):\JTSDK-Tools

# Step-2: Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Step-3: Make a Source Directory (if present, you can skip this step)
mkdir src

# Step-4: Change Directories and Clone
cd src
git clone https://github.com/KI7MT/jtsdk-tools.git

# Step-5: Change Directories, make clean, and make Install
cd jtsdk-tools\src
make clean
make install

# Close the Windows Console, then browse to and open jtsdk-env.

```

## Upgrade

Due to the repository name and url change, it is `not` recommended to reuse the
old repository. Rather, clone the new repository and following the
[installation instructions](#installation)

This concludes the installation and / or upgrade for `JTSDK Core Applications`.