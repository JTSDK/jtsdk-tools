## Prerequisite Installation

In order to checkout and compile the `JTSDK .Net Core Package`, users must have
three applications installed at the `system level`.

| Application | Purpose |
| :--- | :--- |
| [Dotnet Core](https://docs.microsoft.com/en-us/dotnet/core/index) | Cross Platform Framework based on [C-Charp] |
| [Visual Studio Code](https://code.visualstudio.com/docs/supporting/faq#_what-is-the-difference-between-vs-code-and-vs-community) |Powerful Cross-Platform Editor |
| [Git Client](https://git-scm.com/) | Distributed Version Control System Client |

## Prerequisite Install Walkthrough:
The following guides are provided to assist users with installing 
`JTSDK Tool Chain` prerequisite applications. All three applications are installed
to the `Default System Install Location(s)` if the guides are followed.

>IMPORTANT - It is up to the user where these packages are installed. However, 
unless there are specific reasons to *NOT* use a default install location,
its `highly advisable` to use the recommended installer location(s).

All three packages must be available from a standard Windows / Linux Console. If
not, users should add--either locally or system wide--the path location(s) which
allows access from the command. Using the commands `git --version`,
`dotnet --info`, and `code --version` should all render without error from their 
respective console.

### Installation Order
While not critical, the order below should be followed to allow the 
[Git installation](guides/install-git.md) to identify the existaince of the 
[VS Code Editor](guides/install-vs-code.md), and 
[VS Code Editor](guides/install-vs-code.md) to easily find the 
[.Net Core SDK](guides/install-dotnet-core.md).

* [Install .Net Core SDK](guides/install-dotnet-core.md)
* [Install VS Code Editor](guides/install-vs-code.md)
* [Install Git](guides/install-git.md)