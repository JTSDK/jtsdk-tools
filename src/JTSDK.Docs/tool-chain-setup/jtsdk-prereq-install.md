## Prerequisite Installation

In order to checkout and compile the `JTSDK .Net Core Package`, users must have
three applications installed at the `system level`.

| Application | Purpose |
| :--- | :--- |
| [Git DCVS](https://git-scm.com/) | Distributed Version Control System Client |
| [Dotnet Core](https://docs.microsoft.com/en-us/dotnet/core/index) | Cross Platform Framework based on [C-Charp] |
| [Visual Studio Code](https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community) |Powerful Cross-Platform Editor |

>IMPORTANT - It is up to the user where these packages are installed. However, 
unless there are specific reasons to *NOT* use the default install locations,
it's `highly advisable` to use the recommended installer locations.

All three packages must be available from a standard Windows / Linux Console. If
not, users should add--either locally or system wide--the path locations which
allows access from the command. Using the commands `git --version`,
`dotnet --info`, and `code --version` should all render without error from their 
respective console.

## Prerequisite Install Walkthrough:
The following guides are provided to assist users with installing 
`JTSDK Tool Chain` prerequisite  applications. All three applications are installed
to the `Default System Install Location(s)` if the guides are followed.

* [Install Git](guides/install-git.md)
* [Install .Net Core SDK](guides/install-dotnet-core.md)
* [Install VS Code Editor](guides/install-vs-code.md)

## Core Tools Installation
Under developent