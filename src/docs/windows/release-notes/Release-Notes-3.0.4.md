# Release Notes 3.0.4

## Change Log

- Updated `jtconfig` to allow PostgreSQL 10 or 11
- Enable / Disable of PostgreSQL is manual only, no defaults
- Many documentation updates

>NOTE: During installation testing of PostgreSQL 11, there was an error related
>the EDB installer and Windows VC run-times. If you do not have a specific reason
>to use PostgreSQL 11.1, it's better to stay with PostgreSQL 10.x for the
>time being.

## Primary Commands

The following commands are still relevant:

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

Two applications were added for in `v3.0.3`. If you have time to check them out,
please do so.

- [JTenv Python Version][]
- [WSPR CSV Conversion Utility][]

[WSPR CSV Conversion Utility]: https://ki7mt.github.io/jtsdk-tools/tools/wsprcsv/
[JTenv Python Version]: https://ki7mt.github.io/jtsdk-tools/tools/jtenvpy/
[jtbuildcm]: https://ki7mt.github.io/jtsdk-tools/tools/jtbuild/
[jtconfig]: https://ki7mt.github.io/jtsdk-tools/tools/jtconfig/
[jtenv]: https://ki7mt.github.io/jtsdk-tools/tools/jtenv/
[documentation site]: https://ki7mt.github.io/jtsdk-tools/
