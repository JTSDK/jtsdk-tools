## Release Notes 3.0.2

.Net Core is now the primary framework used to control the environment and
build for `WSJT-X`. As a result, several applications-name shortcuts have changed:

### Primary Commands

- `jtenv` is used to set various environment / build conditions
- `jtconfig` is used to config control build parameters
- `jtbuild` is used to compile `WSJT-X`
- `msys2` launches the `MSYS2` console for building Hamlib

### Optioinal Environment Commands
- `jtenv-py -h` if [Anaconda Python](../Install-Python.md) is installed. 
- `jtenv-jv -h` if [jtsdk-java-env](https://github.com/KI7MT/jtsdk-java-env) is installed.

## JTEnv Java Install

>NOTE - JTEnv Java requires both [Java Tools](../Install-Java-Tools.md) and 
[Java](../Install-Java.md) to be installed before building JTEnv Java.

The `jtenv-jv` application has been converted to use to a stand-alone project
[jtsdk-java-apps](https://github.com/KI7MT/jtsdk-java-apps) and is not longer
part of the .Net Core Installation (as a Java script).

### JTEnv Installation

To install, test, and use `jtenv-jv`, perform the following steps:

``` shell
# Open JTSDK-Env, and change directories to (C|D):\JTSDK-Tools
cd /d (C|D):\JTSDK-Tools

# Make a Source Directory (if not already present)
mkdir src

# Change Directories and Clone
cd src
git clone https://github.com/KI7MT/jtsdk-java-env.git

# Change Directories and Make Install
cd jtsdk-java-env\jtenv
make clean
make build
make install

# Test Installation
jtenv-jv -h
```