This guide will walk users through the basic installaiton and subsequent
configuration of the core tool chain. As the tool-chain is updated, this package
will track with those changes.

In order to checkout and compile this package, users must have three
utilities installed at the `system level`.
* [Git DCVS](https://git-scm.com/) (or comprable Git Client)
* [Microsoft .Net Core SDK v2.1.300](https://www.microsoft.com/net/download/windows)
or later.
* [Microsoft Visual Studio Code](https://code.visualstudio.com/)

>IMPORTANT - It is up to the user where these packages are installed. However, 
unless there are specific reasons to *NOT* use the default install locations,
it's `highly advisable` to use the recommended installer locations.

All three packages must be available from a standard Windows / Linux Console. If
not, users should add--either locally or system wide--the path locations which
allows access from the command. Using the commands `git --version`,
`dotnet --info`, and `code --version` should all render without error from their 
respective console.

## Prerequisite Install Walkthroughs:
The following guides are provided to assist users with installing 
`JTSDK Tool Chain` prerequisite  applications. All three applications are installed
to the `Default System Install Location(s)` if the guides are followed.

* [Install Git](guides/install-git.md)
* [Install .Net Core SDK](guides/install-dotnet-core.md)
* [Install VS Code Editor](guides/install-vs-code.md)

## Core Tools Installation
Under developent