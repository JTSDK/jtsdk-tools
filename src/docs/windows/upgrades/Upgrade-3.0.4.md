# JTSDK-Tools Upgrade 3.0.4

| Application Data ||
| ---| --- |
| Name          | JTSDK Upgrade 3.0.4 |
| Description   | Net Core Apps used in JTSDK v3 |
| Release Notes | [Version 3.0.4](../release-notes/Release-Notes-3.0.4.md) |

## Installation

``` shell
# Step-1: Open a Windows Console, then change directories
# to the your JTSDK-Tools installation

# C-Drive
cd /d C:\JTSDK-Tools

# D-Drive
cd /d D:\JTSDK-Tools

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

If the source clone from `jtsdk-tools` is still present on the system, upgrading
is the same as installation, with an additional pull and clean command. If not,
use the installation steps from above.

``` shell
# Change directories to the JTSDK-Tools installation

# C-Drive:
cd /d C:\JTSDK-Tools

# D-Drive
cd /d D:\JTSDK-Tools

# Set Temporary JTSDK_HOME variable
set JTSDK_HOME=%CD%

# Change Directories To The Cloned Repository
cd /d %JTSDK_HOME%\src\jtsdk-tools

# Clean the build tree
make clean

# Update Source
git pull origin master

# Install New Update
make clean
make install
```

>NOTE - If you have problems doing the pull, or upgrade, remove the source
folder `jtsdk-tools` and perform a new installation using the instructions
from above.

This concludes the installation and / or upgrade for `JTSDK Core Applications`.