# JTSDK Development Tools

This repository is designed to work specifically with the
[JTSDK Tools Version 3][] tool-chain. It would be of little use elsewhere.

## Software Delivery

Delivery is directly from the `master` branch. `Branches` are used for development
and testing, while reserving the `master` branch in a stable condition for end
users. `Tags` are used to archive milestones, and will appear in the
[release section][]. See the [Matrix](#global-tool-matrix) below for a list of
artifacts that can be tested as [NetCore Global Tools][].

## Community Support

To assist users with installation, usage, compiling applications, and
general discussion, use <JTSDK@Group.io>.

- Post: <JTSDK@groups.io>
- Subscribe: <JTSDK+subscribe@groups.io>

## Installation

Installation of this package should follow the tool-chain installation and
setup. If you've not already done so, review the following guides **before**
checking out and compiling the source code.

See [JTSDK Tools Wiki][] for detailed installation instructions.

## Bug Reports

For submitting bug reports and feature requests, use the [Issue Tracker][].

The aim of `JTSDK-Tools` is to use an Agile delivery approach to create a
high-quality, yet flexible build system. Utilizing Github's [Issue Tracker][].
users can quickly see the status of any particular request, discuss the merits,
and implement the final disposition.

## Supported OS

At present, this repository only supports Windows. Later releases with include
generic Linux support, and additional Ubuntu / Debian specific artifacts.

- Windows
  - Win-10 x86-64 / x86-32
  - Win-7|8 x86-64 / x86-32, in theory, but not tested.
  - Win-XP and Vista are not supported.

- Linux
  - Linux - Unsupported at this time.
  - Arm Devices - Unsupported at this time.

## System Requirements

This project creates a development-environment that supports many languages.
Performance has a direct Correlation to system resources. While it is possible
to build applications on marginal systems, using minimal hardware will lead to
lengthy compiling times and sub-par system performance. With that in
mind, the following should be considered the bare-minimum requirements:

- CPU: 2x Cores @ 2.5+ Ghz. (More Cores + Higher Clock Rates) = Better Performance
- RAM: 4GB Minimum
- Disk Space: At least 25GB to 30GB of Free Space
- SSD - If you have them, use them!

<!--Page Links ---------------------------------------------------------------->
[release section]: https://github.com/KI7MT/jtsdk-tools/releases
[Net Core Global Tools]: https://github.com/dotnet/core/tree/master/samples/dotnetsay
[JTSDK Tools Version 3]: https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/
[NetCore Global Tools]: https://github.com/dotnet/core/tree/master/samples/dotnetsay
[JTSDK Tools Wiki]: https://github.com/KI7MT/jtsdk-tools/wiki
[Issue Tracker]: https://github.com/KI7MT/jtsdk-tools/issues