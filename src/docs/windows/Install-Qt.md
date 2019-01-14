# Install Qt

| Application Data ||
| ---| --- |
| Name        | Qt  |
| Version     | Rolling |
| Arch        | 32 bit |
| Description | Cross-Platform Development Framework |

> Qt is much more than just a cross-platform SDK - it's a technology strategy
> that lets you quickly and cost-effectively design, develop, deploy, and 
> maintain software while delivering a seamless user experience across all
> devices.
>
> -- *The Qt Company, www.qt.io*

## Background

Users have a number of choices as to how `Qt` is installed. However, for the
purpose of `JTSDK`, the primary method used is through the use of the Qt
installer. There are two installer types:

1. **Offline Installer**: which includes all binaries, docs, source code, and GNU
tool-chain's used to compile each version of Qt. The installer download size
typically ranges from `1.0 GB` to `2.0 GB`.
2. **Online Installer**: downloads only the targets the user selects. The
installer size ranges from `20 MB` to `30 MB`. However, the components are
downloaded during the installation process, but only for selected components.

In an effort to minimize the `initial` download size for users, option-2 
(the Online Installer) is the preferred method used for setting up `JTSDK`, and
the installer used for the [Installation Walk-Through](#installation).

## Download

Users can download the `Qt Installer` directly from
[Qt.io](https://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe.mirrorlist),
or as part of the [JTSDK Third Party Installer Package](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)
provided by this project. Either installer is acceptable.

- [Download from Qt.io](https://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe.mirrorlist)
- [JTSDK Third Party Installer Package](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)

## Installation

Browse to, then `double-click` the downloaded `Qt Online Installer`, and follow
the steps below.

### Welcome Screen

Select next to continue.

| ![Set Environment](images/qt/qt.1.PNG?raw=true) |
|:--:|
| * Welcome Screen Select Next* |

### Qt Account

Select skip to continue.

| ![Qt Account](images/qt/qt.2.PNG?raw=true) |
|:--:|
| * Qt Account Select Skip* |

### Qt Setup

Select next to continue.

| ![Set Environment](images/qt/qt.3.PNG?raw=true) |
|:--:|
| *Qt Setup Select Next* |

### Qt Update Meta Data

No action required.

| ![Qt Update Meta Data](images/qt/qt.4.PNG?raw=true) |
|:--:|
| *Qt Update Meta Data* |

### Qt Installation Folder

>IMPORTANT: The Installation Folder is critical. Use the table below to set the location.

File Association: This option is up to the end-user. If this instance of `Qt`
is the only `Qt` installation on the system, there should be no harm in
associating file types. If not, it's up to the user as to whether or not to
associate file types.

``` shell
# For C-Drive Installation, set path to:

C:\JTSDK-Tools\tools\Qt

# For D-Drive installation, set path to:

D:\JTSDK-Tools\tools\Qt

# If another drive is used, substitute the drive letter for one
# of the examples above.
```

| ![Qt Update Meta Data](images/qt/qt.6.PNG?raw=true) |
|:--:|
| *Set Path and File Association* |

### Qt Component Selection

In general, the `Qt Installer` can install any number of combinations for both
components and tool chains. `JTSDK` is setup to utilize two combinations. The
following components should be considers the bare-minimum. Anything above these
items would be at the users discretion.

As a side note, if more components are deemed necessary at a later date, the
`Qt Maintenance Tool` cna be used to manage the installation.

- Qt Components
  - Qt 5.9.5, MinGW 5.3.0 32 Bit
  - Qt 5.5, MinGW 4.9.2 32 Bit
- Tool Chains
  - MinGW 4.9.2
  - MinGW 5.3.0

The following Image shows a summary of required selections.

### Qt 5.9.5 Components

| ![Qt 5.9.5 Components](images/qt/qt.7.1.PNG?raw=true) |
|:--:|
| *Qt 5.9.5 Components* |

### Qt 5.5 Components

| ![Qt 5.5 Components](images/qt/qt.7.2.PNG?raw=true) |
|:--:|
| *Qt 5.5 Components* |

### Qt Tool Chains: 4.9.2 and 5.3.0

| ![Qt Tool Chains: 4.9.2 and 5.3.0](images/qt/qt.7.3.PNG?raw=true) |
|:--:|
| *Qt Tool Chains: 4.9.2 and 5.3.0* |

### Qt License Agreement

| ![Component Selection-1](images/qt/qt.8.PNG?raw=true) |
|:--:|
| *Qt License Agreement* |

### Qt Startup Menu Shortcuts

This is a user option, but it is recommended to keep `Qt`.

| ![Qt Startup Menu Shortcut](images/qt/qt.9.PNG?raw=true) |
|:--:|
| *Qt Startup Menu Shortcuts* |

### Qt Ready to Install

Select next to continue.

| ![Qt Ready to Install](images/qt/qt.10.PNG?raw=true) |
|:--:|
| *Qt Ready to Install* |

### Maintenance Tool Configuration

Select next to continue.

| ![Qt Install and Configure](images/qt/qt.13.PNG?raw=true) |
|:--:|
| *Maintenance Tool Configuration* |

### Qt Launch

To Ensure `Qt` is functioning properly, launch then close `Qt`.

| ![Qt Launch](images/qt/qt.14.PNG?raw=true) | 
|:--:| 
| *Qt Launch* |

### Qt Creator Verified

| ![Qt Launch](images/qt/qt.15.PNG?raw=true) |
|:--:|
| *Qt Launch* |

This concludes the `Qt Tools Installation`.

## Next Step

Proceed to ==> [Core Apps Installation](Install-Core-Apps.md)
