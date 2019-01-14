| Application | Purpose |
| :--- | :--- |
| Net Core SDK | Cross Platform Framework based on [C-Charp](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/) |
| Visual Studio Code |Powerful Cross-Platform Editor |
| Git Client | Distributed Version Control System Client |

## Install Considerations

- In order to checkout and compile the `JTSDK Net Core Utilities`, users must have
three applications  / frameworks installed at the `system level`.

- The [guides listed below](#installation-order) are provided to assist users
with installing the `JTSDK Tool Chain` prerequisite applications. All three
components are installed to the `Default System Install Location(s)` if the
guides are followed.

>IMPORTANT - It is up to the user where these packages are installed. However, 
unless there are specific reasons to *NOT* use a default install location,
its `highly advisable` to use the recommended installer location(s).

- All three packages must be available from a standard Windows / Linux Console. If
not, users should add--either locally or system wide--the path location(s) which
allows access from the command-line. Using the commands `git --version`,
`dotnet --info`, and `code --version` should all render without error from their 
respective console.

## Installation Order

While not critical, the order below should be followed:

1. [Install .Net Core SDK](Install-Net-Core-SDK)
2. [Install VS Code Editor](Install-VS-Code)
3. [Install Git](Install-Git-Client)