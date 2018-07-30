# Command Line Tools and Status

The following lists the command line tools available in `JTSDK-Tools v3`. Each
tool has it's own documentation. To view the documentation for a particular
tool, click on the links in the `Name` column.

Where possible, each tool will be written in at least two languages. C# (dotnet core)
applications will generally be first, followed by Python, then Java. This enables
users to choose which optional-language they would like to install.

>NOTE: the commands listed below represent the DOSKEY's `Command` associated with
each application. The long form of each command will be in the application
documentation.

## Status Explication

Each script / application is accompanied by a `Status` column. The following
explains the meanings used:

|Name | Description |
|:-----|:------|
| Release      | fully functional for it's intended purpose
| Development  | still a work in progress, not ready for production use
| Deferred     | while technically viable, work has not begun
| Incompatible | not applicable for the given Language

## Environment

Environment variables are set either by the operating system itself, by users
adding a variable, or the `JTSDK-Tools` Environment Script. If the variable is
not set, or cannot be found, a message of `-- not set --` or `-- unavailable --`
will be displayed in path section.

|Name | Command | Language | Status | Description |
|:-----|:-----|:-----|:------|:-----|
[JTEnv](tools/JTEnv.md)      | jtenv -h    | C-Sharp | Release | Show environment variables using C# / .Net Core
[JTEnvJV](tools/JTEnvJV.md)  | jtenv-jv -h | Java    | Release | same as above using Java
[JTEnvPY ](tools/JTEnvPY.md) | jtenv-py -h | Pyython | Release | same as above using Python

## Configuration

The configuration scripts set various options for controlling the environment,
changing tool-chains, and other runtime activities.

|Name | Command | Language | Status | Description |
|:-----|:-----|:-----|:-----|:-----|
[JTConfig.dll](tools/JTConfig.md)  | jtconfig -h    | C-Sharp | Release     | Configure runtime variables
[JTConfigJV](tools/JTConfigJV.md ) | jtconfig-jv -h | Java    | Development | same as above using Java
[JTConfigPY](tools/JTConfigPY.md)  | jtconfig-py -h | Python  | Development | same as above using Python

## WSJT-X Compiling

These applications are used to compile `WSJT-X` from source code.

|Name | Command | Language | Status | Description |
|:-----|:-----|:-----|:-----|:-----|
[JTBuild](tools/JTBuild.md)     | jtbuild-cs -h | C-Sharp | Development | same as above using C-Sharp
[JTBuildCM](tools/JTBuildCM.md) | jtbuild-cm -h | Batch   | Release     | Compile WSJT-X using Windows Batch
[JTBuildJV](tools/JTBuildJV.md) | jtbuild-jv -h | Java    | Development | same as above using Java
[JTBuildPY](tools/JTBuildPY.md) | jtbuild-py -h | Python  | Development | same as above using Python

## Hamlib Compiling

These scripts, where possible, are used to compile Hamlib from source code. Due
to the complexities between the standard Windows Environment, and that of MSYS2,
it may not be possible to build Hamlib on windows using Java, and / or Python.
If and when this is made possible, the appropriate scripts will be added to the
matrix.

|Name | Command | Language | Status| Description |
:-----|:-----|:-----|:-----|:-----|
[build-hamlib.sh]()  | build-hamlib -h | Bash | Release | Compile Hamlib Library for Windows
[build-hamlib-jv]()  | build-hamlib -h | Bash | Deferred | Investigation use with MSYS2
[build-hamlib-py]()  | build-hamlib -h | Bash | Deferred | Investigating use with MSYS2
