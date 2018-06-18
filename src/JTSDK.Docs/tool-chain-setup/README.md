# JTSDK Tool Chain Overview

JTSDK Tools Version 3 is broken down into two primary install groups:
* [Prerequisite Tools](jtsdk-prereq-install.md#prerequisite-installation)
* [Core Tools](jtsdk-core-tools-install.md#core-tools-installation)

In addition to the required tools and frameworks, there are a number of additional
components the `JTSDK Tools Environment` will be supporting:

* [Python Tools](jtsdk-python-tools-install.md)
* [Java Tools](jtsdk-java-tools-install-java.md)
* [Database Tools](jtsdk-db-tools-install.md)
* [Miscellaneous Tools](jtsdk-misc-tools-install.md)

While not absolute, the order of installaiton an configuraiton should be
followed to prevent missing critical steps, or, missing out on a particular
feature from another installaiton process.

## .Net Core Usage
At present, [.Net Core](https://docs.microsoft.com/en-us/dotnet/core/index) is
only used at the environment configuration stage. Its the long term intention to
convert all Bash and Windows Batch/CMD scripts over to [.Net Core](https://docs.microsoft.com/en-us/dotnet/core/index).


## Language and Syntax

Throughout this guide you will often see the use of `(C|D):\JTSDK-Tools` or
reference to `JTSDK_HOME`

* The syntax `(C|D)` referes to the drive letter, either C-Drive `C:` or
D-Drive `D:`. In either case, `\JTSDK-Tools` will follow the drive letter.
* `JTSDK_HOME` referes to the locaiton where JTSDK-Tools has been installed,
for example:
```
# C-Drive Installation
JTSDK_HOME = C:\JTSDK-Tools

# D-Drive Installaiton
JTSDK_HOME = D:\JTSDK-Tools
```
On several occasions, you will be required to set `JTSDK_HOME` temporarily. The
following shows how to do this for either `(C|D)` installation locations. 
```
# To temporarily set the JTSDK_HOME variable inside a Windows Console

# C-Drive Installaiton
set JTSDK_HOME=C:\JTSDK-Tools

# D-Drive Installation
set JTSDK_HOME=D:\JTSDK-Tools
```

The same would be true, and follows the same syntax if:
1. The system has several (more than two) physical hard drives.
2. The system has multiple Windows partitions on a single dirve.

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
* For 32-bit `C:\Program Files (x86)`
* For 64-bit `C:\Program Files`

If the application in question is not installed to the Windows default system
installation locaiton, they must be added to the System or User path variables.
In either case, the applications must be available when opening a non-privilaged
Windows Console. Many applicaiton installers use the system folders by default.
However, there are no gaurentees, and users should verify the location for 
any System Level application requirment.

## Third Party Installers

>One or more of the tool chain components may be provided by Third Party
Installers. Users should always check for the latest version of the respective
installer before installaiton unless advised otherwise.

## Tool Chain Matrix

The [Tool Chain Matrix(s)](#tool-chain-matrix) provides a brief description and
links to each application or framework used within `JTSDK-Tools`. `Installation`,
`Configuration` and `Removal` will be outlined in each of the respective
application or framework documents as appropriate. Collections such as
[MSYS2](http://www.msys2.org/) include many [GNU Core Utils](https://www.gnu.org/software/coreutils/coreutils.html)
that are not outlined specifically in this document. For more information a given
item, following the links provided.

### Prerequisite Tools
In order to checkout and compile the `JTSDK .Net Core Package`, users must have
three applications installed at the `system level`.

| Application | Purpose |
| :--- | :--- |
| [Git DCVS](https://git-scm.com/) | Distributed Version Control System Client |
| [Dotnet Core](https://docs.microsoft.com/en-us/dotnet/core/index) | Cross Platform Framework based on [C-Charp] |
| [Visual Studio Code](https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community) | Powerful Cross-Platform Editor |

### Core Tools
The following tools are required and comprise the `JTSDK Core Tool Chain`.
All of the tool in this group are required, and should be considered the bare
minimum installation.

| Application | Purpose |
| :--- | :--- |
| [Asciidoctor](https://asciidoctor.org/docs/) | General purpose documeatation system based on [Ruby](https://www.ruby-lang.org/en/) | 
| [CMake](https://cmake.org/) | Cross-Platform tools to build, test and deploy software |
| [DocFX](https://dotnet.github.io/docfx/) | Generates documentation directly from source code |
| [FFTW](http://fftw.org/) | Subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions |
| [InnoSetup](http://www.jrsoftware.org/isinfo.php) | Install and build system for Windows applications |
| [Libusb](https://libusb.info/) | C-Library providing access to USB devices on Windows |
| [MSYS2](http://www.msys2.org/) | A collection of GNU Tools for Windows with [Pacman package manager](https://wiki.archlinux.org/index.php/Pacman) |
| [NSIS](http://nsis.sourceforge.net/Main_Page) | Professional open source system to create Windows installers |
| [Pandoc](https://pandoc.org/index.html) | Cross-Platform document conversion utility |
| [PKG-Config](https://sourceforge.net/projects/pkgconfiglite/) | Package Config built for Windows |
| [Qt](https://www.qt.io/) | Cross-Platform Development Framework |
| [Ruby](https://www.ruby-lang.org/en/) | Open source programming language |
| [Subversion](http://svnbook.red-bean.com/en/1.6/svn.intro.whatis.html) | Cross-Platform Version Control System |

### Java Tools

The folowing tools are generally related to Java and associated build activities.
While applications such as [Gradle](https://gradle.org/) and [Eclipse](https://www.eclipse.org/downloads/)
may very well apply to other programming languages, they are most commonly used
in [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 
related application development.

| Application | Purpose |
| :--- | :--- |
| [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) | Cross-Platform Programming Language |
| [Eclipse](https://www.eclipse.org/downloads/) | Cross-Platform IDE primarily for Java Application Development |
| [Gradle](https://gradle.org/) | Cross-Platform tools for building and deploying applications |
| [Maven](https://maven.apache.org/index.html) | Build System from the [Apache Foundation](https://www.apache.org/) |
| [Tomcat](https://tomcat.apache.org/) | Open Source Cross-Platform server for: Java Servlet and JavaServer Pages from the [Apache Foundation](https://www.apache.org/) |

### Database Tools

The following tools are general purpose database applications and / or servers.

| Application | Purpose |
| :--- | :--- |
| [PostgreSQL](https://www.postgresql.org/download/windows/) | Advanced High Performance Relational Database  |
| [Sqlite](https://sqlite.org/about.html) | A powerful In-Process SQL Database Engine  |

### Miscellaneous Tools

The following tools can be installed in addition to the `JTSDK Tool Chain`.

| Application | Purpose |
| :--- | :--- |
| [RapidEE](https://www.rapidee.com/en/about) | Rapid Environment Editor (RapidEE) is an environment variables editor. |
| [Visual Studio](https://www.visualstudio.com/vs/) | Fully-featured integrated development environment (IDE) for Android, iOS, Windows, web, and cloud |