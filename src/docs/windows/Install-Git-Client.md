# Install Git Client

| Application Data ||
| ---| --- |
| Name        | Git-SCM |
| Version     | 2.18.0 |
| Arch        | 64 or 32 Bit |
| Description | Distributed Version Control System Client|

## Helpful Links

- Download : [git-for-windows](https://git-scm.com/download/win)
- Website : [git-scm.com](https://git-scm.com/)
- [Reference, Documentation, and Videos](https://git-scm.com/doc)
- [First Time Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

## Pre-Installation

[Git-SCM](https://git-scm.com/) has an option to use [Visual Studio Code][]
as the default editor. If you'd like to select this feature during installation,
ensure you've installed [Visual Studio Code][] *before* installing [Git](https://git-scm.com/).

## Notes

- The installation location of Git can be set to the default installer location,
- or anywhere on the system a user prefers. The only stipulation for JTSDK is, 
[Git](https://git-scm.com/) must be available from the systems normal command-line
console. That is to say, the command `git --version` must
render without error from a Windows or Linux terminal / console.
- Choosing 32 or 64 bit is up to the user. Accessing the [download page](https://git-scm.com/download)
will trigger an automated download of the latest version based on your operating
system. If the system is 64bit, that is what will be downloaded.
- If you already have [Git](https://git-scm.com/) working on your system, and
available form the command line, there is *no need* to re-install it for `JTSDK`
usage.

## Installation

The following walks through the steps known to work with `JTSDK`.

- IMPORTANT - The steps below are mere recommendations, and not set in stone. If
you have a particular preference or need for an option, you should use your own
judgement during the installation. If a specific option is needed by `JTSDK`, it
will be made known during the relevant section.
- [Download](https://git-scm.com/download/win) the appropriate installer
from [git-scm.com](https://git-scm.com/). Run the installer and follow the steps
below.

### Accept License

| ![License Agreement](images/git/git-bash.1.PNG?raw=true) |
|:--:|
| *GNU Public License* |

### Install Location

Unless you have a specific need to install elsewhere, the default location
provided by the installer is recommended.

| ![Install Location](images/git/git-bash.2.PNG?raw=true) |
|:--:|
| *Use Default Installation Location* |

### Select Options

| ![Option Selection](images/git/git-bash.3.PNG?raw=true) |
|:--:|
| *Select Desired Options* |

### Start Menu

| ![Start Menu](images/git/git-bash.4.PNG?raw=true) | 
|:--:|
| *Start Menu Selection* |

### VS Code Editor

Using VS Code as your default editor is *optional* but *highly recommended* for
use with `JTSDK`; unless of course, you have a favorite cross-platform editor.

| ![VS Code Editor](images/git/git-bash.5.PNG?raw=true) |
|:--:|
| *VS Code Editor Selection* |

### Adjusting Environment

This section is at the users discretion. `JTSDK` will be using MSYS2 GNU Tools.
However, if you want a select number of items available outside of
`JTSDK Environments`, choose what best suits your preference.

| ![Adjust Environment](images/git/git-bash.6.PNG?raw=true) |
|:--:|
| *Adjust Environment* |

### OpenSSL Selection

This is not a critical component of `JTSDK`, but for consistency, choosing
OpenSSL has worked well in the past. It's up to the user. If you choose Windows
Secure Channel Library, you will need to configure the certificates and Git to
use them separately.

| ![OpenSSL](images/git/git-bash.7.PNG?raw=true) |
|:--:|
| *SSL Option Selection* |

### Line Ending Preference

This option is again up to the user. However, for use with `JTSDK` projects,
selecting the first option `Checkout Windows-Style, commit Unix-Style endings`
should work for the project. If you're a developer and need other endings,
choose what best suits your needs.

| ![Line Ending Preference](images/git/git-bash.8.PNG?raw=true) |
|:--:|
| *Line Endings Preference* |

### Console Selection

`JTSDK` has no specific need for `MinTTY`, but the option provides many desirable
display features for end users.

| ![Terminal Selection](images/git/git-bash.9.PNG?raw=true) |
|:--:|
| *Terminal Selection* |

### Extra Options

`JTSDK` has no specific use for these options, but others may. It's up to the
user as to what should be selected.

| ![Extra Options](images/git/git-bash.10.PNG?raw=true) |
|:--:|
| *Extra Options* |

### Install Progress

| ![Launch Git Bash](images/git/git-bash.11.PNG?raw=true) |
|:--:|
| *Install Progress* |

### Launch Git Bash

To ensure `Git Bash` is working properly, select the `Launch Git Bash` option at
the conclusion of the installation. Once proper functionality has been verified,
close the `Git Bash` console.

| ![Launch Git Bash](images/git/git-bash.12.PNG?raw=true) |
|:--:|
| *Install Progress* |

## Git Configuration

If you plan to check-in code, or perform other repository activity, review
the [First Time Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
documentation paying particular attention to `username` and `email` settings.

This concludes the [Git Client Install](Install-Git-Client.md).

## Next Step

Proceed to ==> [Install Core Tools](Install-Core-Tools.md)

[Visual Studio Code]: https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community