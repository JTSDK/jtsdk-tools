# Release Notes 3.0.3

## Change Log

- Renamed the project from `jtsdk-dotnet-core` ==> `jtsdk-tools`
- Restructured folders after repository renaming
- Removed old directories from installation
- Added new [documentation site][] which you are reading from now
- Removed `jtenv-py`, `jtenv-jv` scripts as they are no longer needed
- Removed the old `R-DaaS` folder as the project has moved
- Updated Makefiles files and `version-check` utility

## Primary Commands

- `jtenv -h` is used to set various environment / build conditions
- `jtconfig -h` is used to config control build parameters
- `jtbuild help` is used to compile `WSJT-X`
- `msys2` launches the `MSYS2` console for building Hamlib
- `version-check` runs a Windows Batch script and prints tool versions

## App Documentation

Each application has it's own document now and can be found in the tools
section at the following locations:

- [jtenv][]
- [jtconfig][]
- [jtbuildcm][]
- `version-check` doesn't need a manual, just type: `version-check`

## Beta Testing

Two applications were added for testing. If you have time to check them out,
please do so.

- [JTenv Python Version][]
- [WSPR CSV Conversion Utility][]

[WSPR CSV Conversion Utility]: https://ki7mt.github.io/jtsdk-tools/tools/wsprcsv/
[JTenv Python Version]: https://ki7mt.github.io/jtsdk-tools/tools/jtenvpy/
[jtbuildcm]: https://ki7mt.github.io/jtsdk-tools/tools/jtbuild/
[jtconfig]: https://ki7mt.github.io/jtsdk-tools/tools/jtconfig/
[jtenv]: https://ki7mt.github.io/jtsdk-tools/tools/jtenv/
[documentation site]: https://ki7mt.github.io/jtsdk-tools/
