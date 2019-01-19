# JTSDK Tools

The main purpose of JTSDK-Tools is to take a group of otherwise independent
library's, frameworks and applications and put them together into one
environment.

While the primary focus of JTSDK-Tools is to compile the many aspects of
the [WSJT-X][] project, there is no reason it cannot be used for the  intended
purpose of any given framework or application. For instance, you can develop
your own Java, Qt, Python, C/C++ (just to name a few) projects all from the same
environment.

An added benefit to using JTSDK-Tools is the ability to select one or more Qt,
Java or Python environments. Again, all from the same environment. Gone is the
requirement to have multiple consoles open to perform specific tasks
for a given framework.

## Software Delivery

Delivery is directly from the `master` branch. `Branches` are used for development
and testing, while reserving the `master` branch in a stable condition for end
users. `Tags` are used to archive milestones, and will appear in the
[release section][].

## Community Support

To assist users with installation, usage, compiling applications, and
general discussion, use:

- Post: JTSDK@groups.io
- Subscribe: JTSDK+subscribe@groups.io
- Unsubscribe: JTSDK+unsubscribe@groups.io
- Group Owner: JTSDK+owner@groups.io
- Help: JTSDK+help@groups.io

## Supported OS

At present, this repository only supports Windows. Later releases with include
generic Linux support, and additional Ubuntu / Debian specific artifacts.

- Windows
  - Win-10 x86-64 / x86-32
  - Win-7|8 x86-64 / x86-32, in theory, but not tested.
  - Win-XP and Vista are not supported.

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

## Windows Installation

The are three primary sections to the installation. Each have multiple
subsections that must be installed for complete the core tool set. There are
several `Optional` tools that can be installed on-top of the core requirements.

For a full installation guide, see the [Overview Section][]

## Linux Installation

JTSDK-Tools under Linux is much different process than for Windows. Documentation
and packaging is still under development.

The one similarity between Linux and Windows is, most all of the packages listed
in the [Version Matrix](#version-matrix) will also be installed.

## Windows Release Notes

See ==> [Windows Release Notes](./windows/release-notes/Home.md)

## Windows Upgrades

See ==> [Windows Upgrades](./windows/upgrades/Home.md)

## Version Matrix

For a list of library's, frameworks, and applications, see the [Version Matrix][]

[Version Matrix]: https://ki7mt.github.io/jtsdk-tools/windows/Version-Matrix/ 
[Overview Section]: https://ki7mt.github.io/jtsdk-tools/windows/Home/
[WSJT-X]: https://physics.princeton.edu/pulsar/k1jt/wsjtx.html