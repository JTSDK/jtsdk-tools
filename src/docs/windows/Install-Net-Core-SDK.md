# Install NetCore SDK

| Application Data ||
| ---| --- |
| Name        | Microsoft Net Core SDK |
| Version     | 2.2.101 |
| Arch        | 64 bit |
| Description | Net Core for building websites, services, and console apps. |

## Helpful Links

- Website : [Welcome to ASP.NET Core](https://www.asp.net/core/overview/aspnet-vnext)
- [Reference, Documentation, and Videos](https://docs.microsoft.com/en-us/dotnet/core/index)
- [Getting Started Tutorials](https://docs.microsoft.com/en-us/dotnet/core/get-started?tabs=windows)

## Installation

- [Download Net Core SDK](https://www.microsoft.com/net/download/windows)
- [Installation Steps](#installation-steps)
- [Verify Installation](#verify-installation)
- [Browse Official Documentation (optional)](https://docs.microsoft.com/en-us/dotnet/core/index)

## Download

At the time of writing, the [Net Core SDK](https://www.microsoft.com/net/download/windows)
version is `2.2.101`. Follow the [download link](#installation) listed above.
Select the latest version available. Also, `ensure` you are using the SDK
installer and *NOT* the Runtime installer, and it is 64-bit.

## Installation Steps

1. Browse to the installer download location, `double-click` the installer, then click the `install button`.

| ![Start Installer](images/dotnet-sdk/2.2.101/dotnet-sdk.1.PNG?raw=true) |
|:--:|
| *Start Installer* |

2. Allow the installation to proceed

| ![Installer Progress](images/dotnet-sdk/2.2.101/dotnet-sdk.2.PNG?raw=true) |
|:--:|
| *Installer Progress* |

3. At installation conclusion, close the installer.

| ![Close Installer](images/dotnet-sdk/2.2.101/dotnet-sdk.3.PNG?raw=true) |
|:--:|
| *Close Installer* |

## Verify Installation

After closing the installer, open a `Windows Command Prompt`. Test the
installation using the following command:

```bash
dotnet --info
```

| ![Image3](images/dotnet-sdk/2.2.101/dotnet-sdk.4.PNG?raw=true) |
|:--:|
| *Validate Results* |

>NOTE - As illustrated in the the above image, multiple SDK installations have
occurred. This is `OK`, and only adds additional frameworks to your system. This
is the normal release method for `Net Core SDK` and Run-Times.

This concludes the [Net Core SDK Installation](Install-Net-Core-SDK.md).

## Next Step

Proceed to ==> [Install VS Code](Install-VS-Code.md)