# JTSDK-Tools Installation

>NOTE: This document is still `Under Development`, and may be subject to frequent
updates. Hard linking to specific URL's is *not advised* at this time. To prevent
unexpected issues, the installation order below should be firmly adhered to.

## Prerequisite Installation

While not critical, the following packages should be installed in the order
listed to prevent unexpected results. See [Prerequisite Overview](Install-Prerequisites)
for further details.

1. [Net Core SDK](Install-Net-Core-Sdk)
1. [VS Code](Install-VS-Code)
1. [Git Client](Install-Git-Client)

## Required Installation and Configuration

`MSYS2` is the last of the required installation and configuration sections.
It follows the [Core Apps Install](Install-Core-Apps) guide as several
scripts--most notably, the `Hamlib Build` script--are part of this package. The
[Core Apps Install](Install-Core-Apps) package also provides the `MSYS2` dependency
list which users will need to install `MSYS2` required dependencies.

1. [Python](Install-Python)
1. [Core Tools](Install-Core-Tools)
1. [AsciiDoctor Configuration](Install-Asciidoctor)
1. [Qt Tools](Install-Qt)
1. [Core Apps](Install-Core-Apps)
1. [MSYS2 Configuration](Install-Msys2)

## Optional Installs

- [Database Tools (non-PostgreSQL)](Install-DB-Tools)
- [Doc Tools](Install-Doc-Tools)
- [Java Tools](Install-Java-Tools)
- [Java](Install-Java)
- [PostgreSQL](Install-PostgreSQL)
- [Redis](Install-Redis)
- [WSL](Install-WSL)
- [Misc Tools](Install-Misc-Tools) - under development

## Sections

>NOTE: This section is under constant revision. As framework needs arise, they will be placed both in the side-bar and list here.

- [Overview](#overview)
- [Net Core Usage](#net-core-usage)
- [Language and Syntax](#language-and-syntax)
- [Setting JTSDK_HOME Variable](#setting-jtsdk_home-variable)
- [Individual Guides](#individual-guides)
- [Choosing 64-bit or 32-bit](#choosing-64-bit-32-or-32-bit)
- [System Level Installation](#system-level-installation)
- [Third Party Installers](#third-part-installers)
- [Tool Chain Matrix](#tool-chain-matrix)
- [Prerequisite Tools](#prerequisite-tools)
- [Core Tools](#core-tools)
- [Documentation Tools](#documentation-tools)
- [Database Tools](#database-tools)
- [Python Tools](#python-tools)
- [Java Tools](#java-tools)
- [Miscellaneous Tools](#miscellaneous-tools)

## General Overview

JTSDK Tools Version 3 is broken down into three primary install groups:

- [Prerequisite Tools](#prerequisite-tools)
- [Core Tools](#core-tools)
- [JTSDK Net Core Package](https://github.com/KI7MT/jtsdk-dotnet-core)

In addition to the required tools and frameworks, there are a number of additional
components the `JTSDK Tools Environment` will be supporting:

- [Python Tools](#python-tools)
- [Java Tools](#java-tools)
- [Database Tools](#database-tools)
- [Miscellaneous Tools](#miscellaneous-tools)

While not absolute, the order of installation an configuration should be
followed to prevent missing critical steps, or, missing out on a particular
feature from another installation process.

## Net Core Usage

At present, [Net Core Applicaitons](https://docs.microsoft.com/en-us/dotnet/core/index)
are only used in setting environment , paths and configuration variable. Its the
long term goal to convert all `Bash` and Windows `Batch/CMD` scripts over to 
[Net Core](https://docs.microsoft.com/en-us/dotnet/core/index).

## Language and Syntax

Throughout this guide you will often see the use of `(C|D):\JTSDK-Tools` or
reference to `JTSDK_HOME`

- The syntax `(C|D)` referes to the drive letter, either C-Drive `C:` or
D-Drive `D:`. In either case, `\JTSDK-Tools` will follow the drive letter.
- `JTSDK_HOME` referes to the locaiton where JTSDK-Tools has been installed,
for example:

``` shell
# C-Drive Installation
JTSDK_HOME = C:\JTSDK-Tools

# D-Drive Installation
JTSDK_HOME = D:\JTSDK-Tools
```

## Setting JTSDK_HOME Variable

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

## Individual Guides

Each activity in regards to installation or configuration has its own guide.
Every effort has been made to make each guide informative, yet direct and to the
point. The guides are *NOT* intended to be a tutorial covering the the subject
area. Most tools have extensive documentation by the original authors, often
located within the applicaiton folder structure.

## Choosing 64-bit or 32-bit

For the most part, any tool that is used to compile--either in-part or whole--
WSJT applications should be 32-bit on Windows. Tools such as Git, Dotnet, 7-Zip,
RapidEE, and others, can be 64-bit as they are tools to help users with
non-compiling tasks. Each guide will have the `Required` arch-type and indicate
whether it is acceptable to use 64-bit or not.

## System Level Installation

The JTSDK Tool Chain requires thhree packages to be installed at the System Level:

- For 32-bit `C:\Program Files (x86)`
- For 64-bit `C:\Program Files`

If the application in question is not installed to the Windows default system
installation location, they must be added to the System or User path variables.
In either case, the applications must be available when opening a non-privileged
Windows Console. Many application installers use the system folders by default.
However, there are no guarantees, and users should verify the location for
any System Level application requirement.

## Third Party Installers

>One or more of the tool chain components may be provided by Third Party
Installers. Users should always check for the latest version of the respective
installer before installation unless advised otherwise.

## Tool Chain Matrix

The [Tool Chain Matrix(s)](#tool-chain-matrix) provides a brief description and
links to each application or framework used within `JTSDK-Tools`. `Installation`,
`Configuration` and `Removal` will be outlined in each of the respective
application or framework documents as appropriate. Collections such as
[MSYS2](http://www.msys2.org/) include many [GNU Core Utils](https://www.gnu.org/software/coreutils/coreutils.html)
that are not outlined specifically in this document. For more information a given
item, following the links provided.

## Prerequisite Tools

In order to checkout and compile the `JTSDK Net Core Package`, users must have
three applications installed at the `system level`.

> See [Prereq Install Instructions](Install-Prerequisites) for details.

| Application | Purpose |
| :--- | :--- |
| [Microsoft Net Core SDK](https://docs.microsoft.com/en-us/dotnet/core/index) | Cross Platform Framework based on [C-Charp](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/) |
| [Visual Studio Code](https://code.visualstudio.com/docs) | Powerful Cross-Platform Editor |
| [Git Client](https://git-scm.com/) | Distributed Version Control System Client |

## Core Tools

The following tools are required and comprise the `Core Tool Chain`.
All of the tools in this group are required to buolw `WSJT-X`, and should be
considered the bare minimum installation.

| Application | Purpose |
| :--- | :--- |
| [Asciidoctor](https://asciidoctor.org/docs/) | General purpose documeatation system based on [Ruby](https://www.ruby-lang.org/en/) | 
| [CMake](https://cmake.org/) | Cross-Platform tools to build, test and deploy software |
| [FFTW](http://fftw.org/) | Subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions |
| [InnoSetup](http://www.jrsoftware.org/isinfo.php) | Install and build system for Windows applications |
| [Libusb](https://libusb.info/) | C-Library providing access to USB devices on Windows |
| [MSYS2](http://www.msys2.org/) | A collection of GNU Tools for Windows with [Pacman package manager](https://wiki.archlinux.org/index.php/Pacman) |
| [NSIS](http://nsis.sourceforge.net/Main_Page) | Professional open source system to create Windows installers |
| [Nuget](https://www.nuget.org/) | NuGet is the package manager for .NET|
| [PKG-Config](https://sourceforge.net/projects/pkgconfiglite/) | Package Config built for Windows |
| [Qt](https://www.qt.io/) | Cross-Platform Development Framework |
| [Ruby](https://www.ruby-lang.org/en/) | Open source programming language |
| [Subversion](http://svnbook.red-bean.com/en/1.6/svn.intro.whatis.html) | Cross-Platform Version Control System |

## Documentation Tools

The following Document utilities can be installed in addition to the `JTSDK Core Tool Chain`

> See [Install Doc Tools](Install-Doc-Tools) for details.

| Application | Purpose |
| :--- | :--- |
| [AsciiDOc]() | The predecessor to Asciidoctor (Python based) |
| [DocFX](https://dotnet.github.io/docfx/) | Generates documentation directly from source code |
| [Pandoc](https://pandoc.org/index.html) | Cross-Platform document conversion utility |


## Database Tools

The following tools are general purpose database applications and / or servers.

> See [Install-PostgreSQL](Install-PostgreSQL), and [Install-DB-Tools](Install-DB-Tools)
> for details.

`PostgreSQL` is a stand-alone guide, where as `SQLite3` is a simply installed
from the [Install-DB-Tools Guide](Install-DB-Tools). As more database
tools are added, and provided they *do not* need a stand alone guide, they will
be added to the [Install-DB-Tools](Install-DB-Tools) installer.

| Application | Purpose |
| :--- | :--- |
| [PostgreSQL](https://www.postgresql.org/download/windows/) | Advanced High Performance Relational Database  |
| [Sqlite](https://sqlite.org/about.html) | A powerful In-Process SQL Database Engine  |


## Python Tools

The following Python Tools can be installed in addition to the `JTSDK Core Tool Chain`.

> See [Install Python](Install-Python) for details.

| Application | Purpose |
| :--- | :--- |
| [Anaconda Python](https://www.anaconda.com/) | Python data science platform |

## Java Tools

The following tools are generally related to `Java` and associated build activities.
While applications such as [Gradle](https://gradle.org/) and [Eclipse](https://www.eclipse.org/downloads/)
may very well apply to other programming languages, they are most commonly used
in [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 
related application development.

> See [Install Java](Install-Java), and [Install Java Tools](Install-Java-Tools)
for more details.

| Application | Purpose |
| :--- | :--- |
| [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) | Cross-Platform Programming Language |
| [Ant](https://ant.apache.org/)|  Java Library, and CLI tools, for building Java Apps from the [Apache Foundation](https://www.apache.org) |
| [Eclipse](https://www.eclipse.org/downloads/) | Cross-Platform IDE primarily for Java Application Development |
| [Gradle](https://gradle.org/) | Cross-Platform tools for building and deploying applications |
| [Maven](https://maven.apache.org/index.html) | Build System from the [Apache Foundation](https://www.apache.org) |

## Miscellaneous

The following tools can be installed in addition to the `JTSDK Core Tool Chain`.

> See [Miscellaneous Tools Install Instructions](Install-Misc-Tools) for details.

| Application | Purpose |
| :--- | :--- |
| [RapidEE](https://www.rapidee.com/en/about) | Rapid Environment Editor (RapidEE) is an environment variables editor. |
| [Visual Studio](https://www.visualstudio.com/vs/) | Fully-featured integrated development environment (IDE) for Android, iOS, Windows, web, and cloud |
| Others | More to follow |