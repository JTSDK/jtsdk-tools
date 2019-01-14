# Optional - Install Java

| Application Data ||
| ---| --- |
| Name        | Java |
| Version     | 1.8 u172+ |
| Arch        | 64 bit |
| Description | Cross-Platform High Performance Development Framework |

## Download

- [Oracle JavaSE Installer](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [JTSDK Third Party Installer Package](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)

- Both downloads provide the same installer, and reflect the installation 
steps below. If the official download is a later version qithin the `1.8` series,
use it instead.
- If you are downloading from the Oracle site, make sure you you select the
`JDK` version for example:

```bash
# Versions at the time of writing
jdk-8u172-windows-x64
jdk-8u181-windows-x64
```

You should use the latest patch release version. In the example above,
`jdk-8u181-windows-x64` would be the latest available. Once installed, the Java
installer has a real-time update service that will alert you when Oracle has
released an update. The same service will also download/update the the instance
for you if you allow it to.

## Installation

Browse to, then `double-click` the downloaded `Java Installer`, and
follow the steps below.

### Initial Screen

Select next to continue.

| ![Initial Screen](images/java/java.1.PNG?raw=true) |
|:--:|
| *Initial Screen* |

### Install Selections

Leave the defaults selected, and click next.

| ![Install Selections](images/java/java.2.PNG?raw=true) |
|:--:|
| *Install Selections* |

### Install Extraction

No action required.

| ![Install Extraction](images/java/java.3.PNG?raw=true) |
|:--:|
| *Install Extraction* |

### Install Location

Use default install location: (highly recommended)

| ![Install Location](images/java/java.4.PNG?raw=true) |
|:--:|
| *Install Location* |

### Install Progress

No action required.

| ![Install Progress](images/java/java.5.PNG?raw=true) |
|:--:|
| *Install Progress* |

### Finish Installation

No action required. Read docs if desired.

| ![Install Progress](images/java/java.6.PNG?raw=true) |
|:--:|
| *Finish Installation* |

### Set JAVA_HOME

| ![Select System Settings](images/java/java.7.png?raw=true) |
|:--:|
| *Select System Settings* |

`Select Environment Variables`

| ![Select Environment Variables](images/java/java.8.PNG?raw=true) |
|:--:|
| *Select Environment Variables* |

`Add New System Variable`

| ![New System Variable](images/java/java.9.PNG?raw=true) |
|:--:|
| *New System Variable* |

`Add The New Path`

| ![Add The New Path](images/java/java.10.PNG?raw=true) |
|:--:|
| *Add The New Path* |

### Check Java

Open Windows Command Prompt, and test that `Java` returns properly.

```bash
# In the Windows Command Prompt, test the following commands
java -d64 -version

# Check JAVA_HOME
echo. && echo JAVA_HOME: %JAVA_HOME%
```

| ![Check Java](images/java/java.11.PNG?raw=true) |
|:--:|
| *Check Java* |

## Set GRADLE_HOME and M2_HOME

Using the same process as you did with JAVA_HOME, set GRADLE_HOME and M2_HOME.

### Gradle Settings

`GRADLE_HOME`

- Change Gradle version to : `4.9`
- Change Maven (M2) version to : `3.5.4`

`Set GRADLE_HOME`

```bash
(C|D):\JTSDK-Tools\tools\gradle\4.9
```

| ![Set GRADLE_HOME](images/java/java.12.PNG?raw=true) |
|:--:|
| *Set GRADLE_HOME* |

`Set Gradle Path`

| ![Gradle Path](images/java/java.13.PNG?raw=true) |
|:--:|
| *Set Gradle Path* |

### Maven Settings

`Set MAVEN_HOME`

```bash
(C|D):\JTSDK-Tools\tools\maven\3.5.4
```

| ![Set MAVEN_HOME](images/java/java.14.PNG?raw=true) |
|:--:|
| *Set MAVEN_HOME* |

`Set Maven path`

| ![Set Maven path](images/java/java.15.PNG?raw=true) |
|:--:|
| *Set Maven Path* |

## Check Gradle Version

In the Windows Command Prompt window, check Gradle Version

```bash
# Check Gradle Version
gradle --version

# Check Maven Version
mvn --version
```

| ![Gradle Version](images/java/java.17.PNG?raw=true) |
|:--:|
| *Gradle Version* |

This concludes the [Java Installation](Install-Java).

## Next Step

Proceed to ==> [PostgreSQL Installation](Install-PostgreSQL.md)