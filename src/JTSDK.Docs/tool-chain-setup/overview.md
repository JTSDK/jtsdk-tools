# JTSDK-Tools Setup Overview
JTSDK-Tools Version 3 setup is broken down into three primary areas:
* Prerequisit Installation
* JTSDK-Tools Core Installer Installation
* Core Application Installation and Configuraiton

While not absolute, the order of installaiton an configuraiton should be
followed to prevent missing critical steps, or, missing out on a particular
feature from another installaiton process.

## Language and Syntax
Throught this guide you will often see the use of `(C|D):\JTSDK-Tools` or
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

The same would be true, and would follow the same syntax if:
1. The system has several (more than two) physical hard drives.
2. The system has multiple partitions on a single dirve.

Setting `JTSDK_HOME` in a Windows Console Manually will NOT retain the setting
if the current console is closed. Likewise, if you have two consoles open,
setting the variable in Console-1 will NOT make the variable known to Console-2.


## Individual Guides
Each activity in regards to installation or configuration has its own guide.
Every effort has been made to make each guide informative, yet direct and to the
point. The guides are not intended to be a tutorial covering the the subject area.
Most of the tools have extensive documentation by the original authors, often
located within the applicaiton folder structure.

## Choosing 64-bit or 32-bit
For the most part, any tool that is used to compile, either in-part or whole, any
WSJT application should be 32-Bit on Windows. Tools such as Git, Dotnet, 7-Zip,
RapidEE, and others, can be 64-bit as they are tools to help users with
non-compiling tasks. Each guide will have the `Required` arch-type and indicate
whether it is acceptable to use 64-Bit or not.

## System System Level Installation
JTSDK-Tools requires two packages to be installed at the System Level:
* For 32-bit `C:\Program Files (x86)`
* For 64-bit `C:\Program Files`

If the application in question is not installed to the Windows default system
installation locaiton, they must be added to the System or User path variables.
In either case, the application must be available when opening a non-privilaged
Windows Console. Most applicaiton installer use the system location by default.
