# JTSDK Net Core Applications
This repository is designed to work specifically with the 
[JTSDK Version 3](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)
tool-chain. It would be of little use elsewhere.

Delivery is directly from the `master` branch. 
- `Branches` are used for development and testing, while reserving the `master` branch in a stable
condition for end users. 
- `Tags` are used to archive milestones, and will appear
in the [release section](https://github.com/KI7MT/jtsdk-dotnet-core/releases).

See the [Matrix](#global-tool-matrix) below for a list of artifacts that can
be tested as [Net Core Global Tools](https://github.com/dotnet/core/tree/master/samples/dotnetsay)

## Community Support Group
To assist users with installation, usage, compiling applicaitons, and
general discussion, use [JTSDK@Group.io](https://groups.io/g/JTSDK).

- Post: [JTSDK@groups.io](JTSDK@groups.io)
- Subscribe: [JTSDK+subscribe@groups.io](JTSDK+subscribe@groups.io)

## Installation
Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

See [JTSDK Net Core Wiki](https://github.com/KI7MT/jtsdk-dotnet-core/wiki) for
detailed instalaltion instructions.

## Bug Reports and Feature Requests
For submitting bug reports and feature requests, use the [Issue Tracker](https://github.com/KI7MT/jtsdk-dotnet-core/issues).

The aim of `JTSDK-Tools` is to use an Agile delivery approach to create a high-quality, yet flexable build system. Utilizing Githubs 
[Issue Tracker](https://github.com/KI7MT/jtsdk-dotnet-core/issues)
users can quickly see the status of any particular request, discuss the merits,
and implement the final disposition.

## Supported Operating Systems
At present, this repository only supports Windows. Later releases with include
generic Linux support, and additional Ubuntu / Debian specific artifacts.

- Windows
    - Win-10 x86-64 / x86-32
    - Win-7|8 x86-64 / x86-32, in theory, but not tested.
    - Win-XP and Vista are not supported.

- Linux
    - Linux - Unsupported at this time.
    - Arm Devices - Unsupported at this time.

## Minimum System Requirments
This project creates a development-environment that supports many languages.
Performance has a direct coorelation to system resources. While it is possible
to build applications on marginal systems, using minimal hardware will lead to
lengthy compiling times and subpar system performance. With that in
mind, the following should be considered the bare-minimum requirments:

- CPU: 2x Cores @ 2.5+ Ghz. (More Cores + Higher Clock Rates) = Better Performance
- RAM: 4GB Minimum
- Disk Space: At least 25GB to 30GB of Free Space
- SSD - If you have them, use them!

## Global Tool Matrix

The following tools can be installed as Global .Net Core Tools.

| Global Command Line Tools ||
| ---| :--- |
|[Jtsdk.Core.Options](docs/tools/jtsdk.core.options.md)| Manages all JTSDK Options and used in compiling apps.
|More Pending| Many more CLI Apps are pending inclusion