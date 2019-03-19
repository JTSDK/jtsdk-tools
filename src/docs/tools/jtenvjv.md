# Environment Using Java

| Application Data ||
| ---| --- |
| Name             | jtenvjv |
| Version          | 3.0.1 |
| Arch             | 64 bit preferred |
| Java Version     | 8, 9, 10 |
| Status | Release |
| Description      | Java application to list environment variables |

## Compiling

No external libraries are required to build the app. Runs on `Java 8, 9 and 10`

```bash
# In Window command prompt, or JTSDK-Tools Environment
(C|D):\JTSDK-Tools\scripts\java

# Compile
javac JTEnv-jv.java

# Run
java JTEnv-jv -h
```

## Usage

`JTEnv-jv` is a quick-check utility to used to verify environment variables.

>NOTE: the options listed by the app are but a small subset of what is available
at any given time. However, the items listed are of particular interest to
`JTSDK-Tools`.

There are no command line options for `JTEnv-jv`. Run the application as
indicated below.

>NOTE: If you have [Java][] and [Java Tools][] installed, the `make install`
will compile the app for you and place it where it needs to be.

```bash
# Run from JTSDK-Tools Environment via DOSKEY
jtenv-j

# Run From Windows Command Prompt:
java -cp (C|D):\JTSDK-Tools\scripts\java JTEnv-jv
```

<!-- Page Links --------------------------------------------------------------->
[Java]: https://github.com/KI7MT/github.io/jtsdk-tools/windows/wiki/Install-Java/
[Java Tools]: https://github.com/KI7MT/github.io/jtsdk-tools/windows/wiki/Install-Java-Tools/