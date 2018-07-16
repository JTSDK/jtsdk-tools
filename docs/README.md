# Publishing Global Tools
Starting with Dotnet Core SDK 2.1.300, users can publish dotnet core apps to
their home user sapce, which enables access globally from within.

### Publish Location
- Windows Path: `%USERPROFILE%/.dotnet/tools`
- Linux / MacOS path: `$HOME/.dotnet/tools`

### From Microsoft
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
> <cite>--[Microsoft Documentation Project](https://docs.microsoft.com/en-us/dotnet/core/tools/global-tools)</cite>

## JTSDK Global Tools
Where possible, all JTSDK Net Core Applicaitons will support Global Tool
Installation. The following example shows how to publish `Jtsdk.Core.Options`
artifacts globally.

### Clone the repository

```
mkdir (C|D):\JTSDK-Tools\tmp
cd (C|D):\JTSDK-Tools\tmp
git clone https://github.com/KI7MT/jtsdk-dotnet-core.git
```

### Build and Install Artifacts
```
dotnet pack -c release -o nupkg
dotnet tool install --add-source .\nupkg -g Jtsdk.Core.Options
```

### Run the Application

Open a Windows Command Prompt, and type the following:

>NOTE: You do not need to be in the `JTSDK Environment`:

```
Jtsdk.Core.Options -h
```

### Uninstall The Application
```
dotnet tool uninstall -g Jtsdk.Core.Options
```

## Additional Artifacts
As additional applications are published in the [JTSDK Net Core Project](https://github.com/KI7MT/jtsdk-dotnet-core), they will be added to the [Main Page Matrix](https://github.com/KI7MT/jtsdk-dotnet-core#global-tool-matrix).
