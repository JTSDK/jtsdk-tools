# Version Matrix

| Application Data ||
| ---| --- |
| JTSDK Tools Version | 3.0.0 |

## Overview

The following tables represent the framework, library or application version
numbers as releases by the installers or subsequent upgrades.

## Prerequisite Tools

These tools are installed by the user, but, are required for proper functionality
of the JTSDK Tool Chain. The versions listed are "current" and may not
represent what the users installed initially.

|Name         | Version | Arch  | Description
|:---         |:---     |:---   | :---
| NetCore SDK | 2.2.101 | 64bit | Set of libraries and tools to build .NET Core apps
| Git Bash    | 2.19.1  | 64bit | CSV management tool suite
| VS Code     | 1.30.2  | 64bit | Power cross-platform test editor

## Core Tools

These tools and libraries make up the core of `JTSDK Tools`. Because `WSJT-X`
compiles to 32bit on Windows, any application or library providing build resources
should also be 32bit.

|Name        | Version | Arch  | Description
|:---        |:---     |:---   | :---
| AsciiDoc   | 8.6.9   | 32bit | Python based document system
| CMake      | 3.5.2   | 32bit | CMake is a cross-platform build tool
| CMake      | 3.10.3  | 32bit | CMake is a cross-platform build tool
| FFTW       | 3.3.5   | 32bit | Fastest Fourier Transform Library
| InnoSetup  | 5.5.9   | 32bit | Free software script-driven installation system
| Libusb     | 1.0.22  | 32bit | C library that for generic access to USB devices
| MSYS2      | 4.4.19  | 32bit | Posix like environment for Windows
| NSIS       | 3.03    | 32bit | Nullsoft Scriptable Install System
| Nuget      | 4.7.0   | 32bit | Free and open-source package manager
| Pkgconfig  | 0.28.1  | 32bit | Interface for querying installed libraries
| Qt         | 3.0.5   | 32bit | Unified installer for Qt 5.5 and 5.9.5
| Ruby       | 2.5.12  | 32bit | Dynamic, Object-Oriented Programming Language
| Subversion | 1.9.7   | 32bit | CSV management tool suite

## Database Tools

These tools can either be in-process applications such as `SQLite3`, or full
server based applications. As such, they are classed as `Optional`. PostgreSQL,
Redis and MongoDB are not automatically installed on Windows. ALl three require
manual installation by the user.

|Name        | Version | Arch  | Description
|:---        |:---     |:---   | :---
| SQLite3    | 3.24.0  | 32bit | In-Process relational database management system
| PostgreSQL | 10.4    | 64bit | Advanced High Performance Relational Database
| MongoDB    | 4.05    | 64bit | Cross-platform document-oriented database
| Redis      | 5.0     | 64bit | In-Memory High Performance key-value database

## Java Tools

While `Java`, and `Java Tools` are related, they can both operate independent of
one another. `Java-Tools` are primarily build tools, where `Java` is the language
itself. For consistency, it's best to keep all Java related tools at the same
bit-ness, and in this case, all were 32bit.

Eclipse is an IDE for Java projects. They (developers) roll the versions often
as it's best to keep up to date with the latest releases.

>The JAVA version below represents the current 1.8 series release from Oracle.
> As of September 2018, `JTSDK-Tools` will be moving to OpenJDK due to support
> limitation changes by Oracle. Most in the OpenSource community are doing the
> same due to Long Term Support (LTS) limitations for non-commercial users.

|Name        | Version   | Arch  | Description
|:---        |:---       |:---   | :---
| Ant        | 1.10.4    | 32bit | Software tool for automating software build processes
| Maven      | 3.5.4     | 32bit | A build automation tool used primarily for Java projects
| Gradle     | 4.9       | 32bit | Open-source build automation system
| Java       | 1.8.0_192 | 32bit | General-purpose computer-programming language 
| Eclipse    | 2018-12 R | 32bit | An Java integrated development environment

## Doc Tools

These tools are in-addition-to those provided by AsciiDoc, and AsciiDoctor.
They provide a full range of document creation and conversion utilities.

|Name        | Version | Arch  | Description
|:---        |:---     |:---   | :---
| DocFX      | 2.37.0  | 32bit | An API documentation generator for .NET
| pandoc     | 2.2.1   | 32bit | A free and open-source software document converter