# Windows Installation

This document is still `Under Development`, and may be subject to frequent
updates. Hard linking to specific URL's is *not advised* at this time. To prevent
unexpected issues, the installation order below should be firmly adhered to.

## Prerequisites

In order to checkout and compile the `JTSDK Net Core Utilities`, users must have 
three applications  / frameworks installed at the `system level`.

The [guides listed below](#prerequisites-installation-order) are provided to
assist users with installing the `JTSDK Tool Chain` prerequisite applications.
All three components are installed to the `Default System Install Location(s)`
if the guides are followed.

All three packages must be available from a standard Windows or Linux Console.
If not, users should add--either locally or system wide--the path location(s)
which allows access from the command-line. Using the commands `git --version`,
`dotnet --info`, and `code --version` should all render without error from their
respective console.

>IMPORTANT - It is up to the user where these packages are installed. However,
>unless there are specific reasons to *NOT* use a default install location,
>its `highly advisable` to use the recommended installer location(s).

While not critical, the order below should be followed:

1. [Install .Net Core SDK](Install-Net-Core-SDK.md)
1. [Install VS Code Editor](Install-VS-Code.md)
1. [Install Git](Install-Git-Client.md)

## Required Install

`MSYS2` is the last of the required installation and configuration sections.
It follows the [Core Apps Install](Install-Core-Apps.md) guide as several
scripts--most notably, the `Hamlib Build` script--are part of this package. The
[Core Apps Install](Install-Core-Apps.md) package also provides the `MSYS2` dependency
list which users will need to install `MSYS2` required dependencies.

1. [Python](Install-Python.md)
1. [Core Tools](Install-Core-Tools.md)
1. [AsciiDoctor Configuration](Install-Asciidoctor.md)
1. [Qt Tools](Install-Qt.md)
1. [Core Apps](Install-Core-Apps.md)
1. [MSYS2 Configuration](Install-Msys2.md)

## Optional Install

- [Database Tools (non-PostgreSQL)](Install-DB-Tools.md)
- [Doc Tools](Install-Doc-Tools.md)
- [Java Tools](Install-Java-Tools.md)
- [Java](Install-Java.md)
- [PostgreSQL](Install-PostgreSQL.md)
- [Redis](Install-Redis.md)
- [WSL](Install-WSL.md)
- [Misc Tools](Install-Misc-Tools.md) - under development

### Setting JTSDK_HOME

On several occasions, you will be required to set `JTSDK_HOME` temporarily. The
following shows how to do this for either `(C|D)` installation locations.

``` shell
# To temporarily set the JTSDK_HOME variable inside a Windows Console

# C-Drive Installation
set JTSDK_HOME=C:\JTSDK-Tools

# D-Drive Installation
set JTSDK_HOME=D:\JTSDK-Tools
```

The same would be true, and follows the same syntax if:

1. The system has several (more than two) physical hard drives.
2. The system has multiple Windows partitions on a single drive.

Setting `JTSDK_HOME` in a Windows Console Manually will NOT retain the setting
if the current console is closed. Likewise, if you have two consoles open,
setting the variable in Console-1 will *NOT* make the variable known too nor
available in Console-2.

## Tool Chain Matrix

The [Tool Chain Matrix(s)](Version-Matrix.md) provides a brief description and
links to each application or framework used within `JTSDK-Tools`. `Installation`,
`Configuration` and `Removal` will be outlined in each of the respective
application or framework documents as appropriate.
