# Git Installation

Last Update : June 17th, 2018

| Application Data ||
| ---| --- |
| Name        | Git SCM |
| Version     | 2.17.1.2 |
| Arch        | 64 or 32 Bit |
| Description | Distributed Version Contol System |

## Helpful Links
* Download : [git-for-windows](https://git-scm.com/download/win)
* Website : [git-scm.com](https://git-scm.com/)
* [Reference, Documentation, and Videos](https://git-scm.com/doc)
* [First Time Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

## Pre-Installation
[Git-SCM](https://git-scm.com/) has an option to use [Visual Studio Code](https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community)
as the default editor. If you'd like to select this feature during installation,
ensure you've installed [Visual Studio Code](https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community) *before* installing [Git](https://git-scm.com/).

## Notes and Considerations

* The installation location of Git can be set to the default installer location,
or anywhere on the system a user prefers. The only stipulation for JTSDK is, 
[Git](https://git-scm.com/) must be available from the systems normal command-line
console. That is to say, the command `git --version` must
render without error from a Windows or Linux terminal / console.
* Choosing 32 or 64 bit is up to the user. Accessing the [download page](https://git-scm.com/download)
will trigger an automated download of the latest version based on your operating
system. If the system is 64bit, that is what will be downloaded.
* If you already have [Git](https://git-scm.com/) workign on your system, and
available form the command line, there is *no need* to re-install it for `JTSDK`
usage.

## Installaiton Walkthrough
The following walks through the steps known to work with `JTSDK`.

> IMPORTANT - The steps below are mere recommendations, and not set in stone. If
you have a particular preference or need for an option, you should use your own
judegment during the installation. If a specific option is needed by `JTSDK`, it
will be made known during the relevant section.

[Download](https://git-scm.com/download/win) the appropriate installer
from [git-scm.com](https://git-scm.com/). Run the installer and follow the steps
below.

### Accept License

![License Agreement](images/git/git-bash.1.PNG?raw=true)

### Install Location (default recommended)

![Install Location](images/git/git-bash.2.PNG?raw=true)

### Select Options

![Option Selection](images/git/git-bash.3.PNG?raw=true)

### Start Menu

![Start Menu](images/git/git-bash.4.PNG?raw=true)

### VS Code Editor
Using VS Code as your default editor is *optional* but *highly recommended* for
use with `JTSDK`; unless of course, you have a favorite cross-platform editor.

![VS Code Editor](images/git/git-bash.5.PNG?raw=true)

### Adjusting Environment
This section is at the users descresion. `JTSDK` will be using MSYS2 GNU Tools.
However, if you want a select number of items available outside of 
`JTSDK Environments`, choose what best suits your preference.

![Adjust Environment](images/git/git-bash.6.PNG?raw=true)

### OpenSSL Selection
This is not a critical component of `JTSDK`, but for consistency, choosing
OpenSSL has worked well in the past. It's up to the user. If you choose Windows
Secure Channel Library, you will need to configure the certificates and Git to
use them seperately. 

![OpenSSL](images/git/git-bash.7.PNG?raw=true)

### Configure Line Ending Preference
This option is again up to the user. However, for use with `JTSDK` projects,
selcting the first option `Checkout Windows-Style, commit Unix-Style endings`
should work for the project. If you're a developer and need other endings,
choose what best suits your needs.

![Line Endings](images/git/git-bash.8.PNG?raw=true)

### Console Selection
`JTSDK` has no specific need for `MinTTY`, but the option provides many desirable
display features.

![Termainl Selection](images/git/git-bash.9.PNG?raw=true)

### Extra Options
`JTSDK` uses all three extra options provided by the [Git-SCM](https://git-scm.com/)
installer.

![Extra Options](images/git/git-bash.10.PNG?raw=true)


### Launch Git Bash
To ensure `Git Bash` is working properly, select the `Launch Git Bash` option at
the conclusion of the installaiton. Once proper functionality has been verified,
close the `Git Bash` console.

![Launch Git Bash](images/git/git-bash.11.PNG?raw=true)

## Git Configuration
If you plan to check-in code, or perform other repository activity, review
the [First Time Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
documentaiton paying particular attention to `username` and `email` settings.
