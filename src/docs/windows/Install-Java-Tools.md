# Optional - Install Java Tools

| Application Data ||
| ---| --- |
| Name        | Java Tools |
| Version     | Various |
| Arch        | 32 or 64 bit |
| Description | Cross-Platform High Performance Development Framework |

> IMPORTANT: It matters not which ARCH you install. However, If you install
> 64 bit `Java`, then you should install all 64 bit tools that use it. Enterprise
> application most certainly should use 64 bit. For home or small projects, 32 bit
> should be more than adequate. `JTSDK` will be using all `64 Bit` wherever
> possible.
> 
> For example: `Eclipse`, `NetBeans`, and `InteliJ` IDE's should all be 64 bit
> if your using 64 bit `Java`.
>
> NOTE: Exceptions to this would be `Apache Ant`, `Apache Maven`, and `Gradle`,
> as they are only provided in 32 bit.

## Download

- [Sourceforge Release Files](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)
- `Required`: From the [release folder](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/),
download the latest version of `Jtsdk-Java-Tools`.

## Version Matrix

The following versions were current as of `JTSDK-Tools v3.0.0`. The versions are
subject to change with each update of `Install-Java-Tools`.

|Application | Version |
| :---   | :--- |
| Java   | 1.8.0_172 |
| Maven  | 3.5.4 |
| Gradle | 4.8.1 |
| Ant    | 1.10.4 |

## Overview

The packages within this installer will not require individual guides. However,
most framework applications within the Java sphere require setting of environment
variables that point to the install location. The matrix below describes those
variables. It is up to the end-user how to accomplish this, but the matrix points
to several [How-To](#environment-variables) articles to perform the task.

[Java](http://www.oracle.com/technetwork/java/javase/overview/index.html), 
[Maven](https://maven.apache.org/) and [Ant](https://ant.apache.org/)
are are particularly sensitive to these variables. If not set properly, there
will be no end to problems down the road.

### Environment Variables

| Variable | Purpose | How-To |
| :--- | :--- | :--- |
| JAVA_HOME| Location for Java| How-To [JAVA_HOME](https://www.tutorialspoint.com/maven/maven_environment_setup.htm) |
| M2_HOME | Location for Maven |How-To [M2_HOME](https://www.tutorialspoint.com/maven/maven_environment_setup.htm) |
| ANT_HOME | Location for Maven |How-To [ANT_HOME](https://provartesting.com/help/devops/apache-ant-java-jdk-and-environment-variables/#setting-the-ant-home-environment-variable) |
| GRADLE_OPTS | Sourced to, and used when Gradle is executed | How-To [GRADLE_OPTS](https://docs.gradle.org/current/userguide/build_environment.html)

## Location Data

With [Install-Java-Tools](Install-Java-Tools.md), the following paths are used at
for installation.:

>NOTE Java is a separate installation ([Install-Java](Install-Java.md)) from the
>`Install-Java-Tools`. However, `JAVA_HOME` is still required.

```bash
Java (assuming 64 bit System Install):
  C:\Program Files\Java\jdk1.8.0_172  <-- JDK with compiler
  C:\Program Files\Java\jre1.8.0_172  <-- Java Runtime

Note: The Java Installer by Oracle updates these paths. If you set
JAVA_HOME properly, it will automatically be updated when a new version
is run through the update UI.

Maven:
  (C|D):\JTSDK-Tools\tools\maven\<VERSION>\bin

Gradle:
  (C|D):\JTSDK-Tools\tools\gradle\<VERSION>\bin

Ant
 (C|D:\JTSDK-Tools\tools\ant\<VERSION>\bin
```

## Installation

Browse to, and `double-click` the downloaded [JTSDK-Java-Tools](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)
Installer, then follow the steps below.

### Accept License

| ![Accept License](images/jtsdk-java-install/jtsdk-java-install.1.PNG?raw=true) |
|:--:|
| *Accept License* |

### Select Install Location

Select which drive you you installed `JTSDK-Tools` to.

| ![Select Install Location](images/jtsdk-java-install/jtsdk-java-install.2.PNG?raw=true) |
|:--:|
| *Select Install Location* |

### Proceed to Install

| ![Proceed to Install](images/jtsdk-java-install/jtsdk-java-install.3.PNG?raw=true) |
|:--:|
| *Proceed to Install* |

### Install Progress

| ![Install Progress](images/jtsdk-java-install/jtsdk-java-install.4.PNG?raw=true) |
|:--:|
| *Install Progress* |

### Finish Installation

| ![Finish Installation](images/jtsdk-java-install/jtsdk-java-install.5.PNG?raw=true) |
|:--:|
| *Finish Installation* |

This concludes the [JTSDK-Java-Tools](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)
installation.

## Next Step

Proceed to ==> [Java Installation](Install-Java.md)