# .Net Core Global Tools

Starting with Dotnet Core SDK 2.1.300, users can publish dotnet core apps to
their home user sapce, which enables access globally from within.

## Publish Locations

- Windows Path: `%USERPROFILE%\.dotnet\tools`
- Linux / MacOS path: `$HOME/.dotnet/tools`

## About .Net Core

> A .NET Core Global Tool is a special NuGet package that contains a console
> application. A Global Tool can be installed on your machine on a default
> location that is included in the PATH environment variable or on a custom
> location.
>
> - Find information about the tool (usually a website or GitHub page).
> - Check the author and statistics in the home for the feed (usually NuGet.org).
> - Install the tool.
> - Call the tool.
> - Update the tool.
> - Uninstall the tool.
>
> -- *[Microsoft Documentation Project][]*

## Description

Where possible, all JTSDK Net Core Applications will support Global Tool
Installation. The following example shows how to publish `jtconfig`
artifacts globally.

## Clone Repository

```bash
mkdir (C|D):\JTSDK-Tools\tmp
cd (C|D):\JTSDK-Tools\tmp
git clone https://github.com/KI7MT/jtsdk-tools.git
```

## Build and Install

```bash
dotnet pack -c release -o nupkg
dotnet tool install --add-source .\nupkg -g JTConfig
```

## Run Application

Open a Windows Command Prompt, and type the following:

>NOTE: You do not need to be in the `JTSDK Environment`:

```bash
JTConfig -h
```

## Uninstall

```bash
dotnet tool uninstall -g JTConfig
```

<!-- Page Links --------------------------------------------------------------->
[Microsoft Documentation Project]: https://docs.microsoft.com/en-us/dotnet/core/tools/global-tools
[JTSDK Tools]: https://github.com/KI7MT/jtsdk-tools
[Main Page Matrix]: https://github.com/KI7MT/jtsdk-tools#global-tool-matrix
