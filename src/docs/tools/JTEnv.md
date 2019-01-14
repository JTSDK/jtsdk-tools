# Environment

| Application Data ||
| ---| --- |
| Name        | JTEnv |
| Version     | 3.0.1 |
| Arch        | 64 bit preferred |
| Status      | Release |
| Description | C-Sharp application to list environment variables |

## Available Options

- `JTEnv` is a quick-check utility to used to verify environment variables.
- There are three groups currently supported:
  1. User - lists basic user path variables
  1. Java - lists commonly used / required Java related variables
  1. System - common system variables such as `OS, ARCH`, etc.
  1. JTSDK - variable applicable to the JTSDK-Tools environment

## Usage

There are three groups of options available through this small app: `User`,
`Java`, and `System`.

>NOTE: the options listed are but a small subset of what is available at any
given time. However, the items listed are of particular interest to `JTSDK-Tools`.

### List Help

```bash
# In the JTSDK-Tools Environment
jtenv -h

# From Windows Command Prompt: cd /d (C|D):\JTSDK-Tools\tools\apps
dotnet JTEnv -h
```

| ![Help Menu](images/JTEnv/jtenv.1.PNG?raw=true) |
|:--:|
| *Help Menu* |

### List All Option Groups

```bash
# In the JTSDK-Tools Environment
jtenv -a

# From Windows Command Prompt: cd /d (C|D):\JTSDK-Tools\tools\apps
dotnet JTEnv -a
```

| ![All Variable Groups](images/JTEnv/jtenv.2.PNG?raw=true) |
|:--:|
| *All Groups* |

### List User Group

```bash
# In the JTSDK-Tools Environment
jtenv -u

# From Windows Command Prompt: cd /d (C|D):\JTSDK-Tools\tools\apps
dotnet JTEnv -u
```

| ![User Group](images/JTEnv/jtenv.3.PNG?raw=true) |
|:--:|
| *User Group* |

### List Java Group

```bash
# In the JTSDK-Tools Environment
jtenv -j

# From Windows Command Prompt: cd /d (C|D):\JTSDK-Tools\tools\apps
dotnet JTEnv -j
```

| ![Java Group](images/JTEnv/jtenv.3.PNG?raw=true) |
|:--:|
| *Java Group* |

### List System Group

```bash
# In the JTSDK-Tools Environment
jtenv -s

# From Windows Command Prompt: cd /d (C|D):\JTSDK-Tools\tools\apps
dotnet JTEnv -s
```

| ![System Group](images/JTEnv/jtenv.3.PNG?raw=true) |
|:--:|
| *System Group* |
