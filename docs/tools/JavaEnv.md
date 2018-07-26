# JavaEnv CLI Application

| Application Data ||
| ---| --- |
| Name        | JavaEnv |
| Version     | 3.0.1 |
| Arch        | 64 bit preferred |
| Description | Java app to list Java related environment variables|

## Usage

`JavaEnv` is a quick-check utility to used to verify environment variables. There
is only one group available through this small app: `Java`.

>NOTE: the options listed by the app are but a small subset of what is available at any given time. However, the items listed are of particular interest to `JTSDK-Tools`.

There are no command line options for `JavaEnv`. Run the application as
indicated below.

>NOTE: If you have [Java](https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Java) and [Java Tools](https://github.com/KI7MT/jtsdk-dotnet-core/wiki/Install-Java-Tools) installed, the `make install` will compile the app for you and place it where it
needs to be.

``` shell
# Run from JTSDK-Tools Environment

javaenv -h

# Run From Windows Command Prompt:

java -cp (C|D):\JTSDK-Tools\scripts\java JavaEnv
```

## Compiling

No external libraries are required fot build the app. Runs on `Java 8, 9 and 10`

``` shell
# In Window command prompt, or JTSDK-Tools Environment

(C|D):\JTSDK-Tools\scripts\java JavaEnv

# Compile
javac JavaEnv.java

# TO Run
java JavaEnv
```