# JTSDK Tools User Guide

| Application Data ||
| ---| --- |
| Release Notes | [Version 3.0.2](../windows/release-notes/Release-Notes-3.0.2.md) |

## Overview

The following is a brief overview of the applications, and functionality
available in `JTSDK-Tool v3.0.2`.

| Application | Description |
| :---| :--- |
|[jtenv](../tools/jtenv.md)| Checks Environment Information
|[jtconfig](../tools/jtconfig.md)| Manages all JTSDK Options and used in compiling.
|[jtbuild](../tools/jtbuildcm.md)| Manages all JTSDK Options and used in compiling.

The following tools / application are optional and require additional tooling
to be installed before use.

| Optional Tools | Description |
| :---| :--- |
|[jtenv-jv](../tools/jtenv.md)| Java Version for Checking Environment Information
|[jtenv-py](../tools/jtenvpy.md)| Python Version for Checking Environment Information

>NOTE: `jtenv`, `jtenv-jv`, and `jtenv-py` all perform the same task, but use
different frameworks. There is "NO" requirement for either the Java or Python
version, as the `jtenv` (CSharp version) is installed by default.

## JTConfig
`jtconfig` is primary application for configuring build options for compiling
`WSJT-X` through the use of `jtbuild`. Use the help-options to list available commands

```bash
# To list available commands
jtconfig -h
```

| ![JTConfig Help](../windows/images/3.0.2/jtconfig.PNG?raw=true) |
|:--:|
| *Help Screen* |

## Recommended Options

For ease of use, a default option command is available that will set standard
options for you.

## Configuration Options

| ![JTConfig Options](../windows/images/3.0.2/jtconfig-options.PNG?raw=true) |
|:--:|
| *Configuration Options* |

## JTEnv

`jtenv` is used to check a number of environmental variables that can be helpful
in troubleshooting the installation, or to simply provide additional
information to the user.

```bash
# To list available commands
jtenv -h
```

| ![JTEnv Help Screen](../windows/images/3.0.2/jtenv-help.PNG?raw=true) |
|:--:|
| *Help Screen* |

## JTBuildcm

For building `WSJT-X`, See: [jtbuildcm](../tools/jtbuildcm.md) page for usage.

## JTEnv Python

For using the `jtenvpy` environment script, See: [jtenvpy](../tools/jtenvpy.md)
for details.

## WSPR Utility

For using the `wsprcsv` conversion utility, See: [wsprcsv](../tools/wsprcsv.md)
for details.





