# Install MSYS2

| Application Data ||
| ---| --- |
| Name        | MSYS2 |
| Version     | Rolling |
| Arch        | 32 bit |
| Description | Collection of GNU Applications including Bash |

> At its core is an independent rewrite of MSYS, based on modern Cygwin (POSIX
> compatibility layer) and MinGW-w64 with the aim of better interoperability with
> native Windows software. It provides a bash shell, Autotools, revision control
> systems and the like for building native Windows applications using MinGW-w64
> tool-chains.
>
> -- *Alexey Pavlov (@alexpux)*

In terms of `JTSDK` usage, MSYS2 provides the means in which to build Hamlib,
in addition to commonly used file-system utilities.

## Helpful Links

- [MSYS2 - Wiki](https://github.com/msys2/msys2/wiki)
- [MSYS2 - Overview](https://github.com/msys2/msys2/wiki/MSYS2-introduction)
- [MSYS2 - Upgrading](https://github.com/msys2/msys2/wiki/MSYS2-installation)
- [MSYS2 - Package Management](https://github.com/msys2/msys2/wiki/Using-packages)
- [Pacman - MSYS2 Package Manager](https://wiki.archlinux.org/index.php/Pacman)

## Installation

- `MSYS2` is installed as part of the JTSDK Core Tools Installer. However, each
instance needs to be updated on a per system basis. The following steps walk
though the process of configuring and updating the provided instance.
- Use the programs menu or any means of opening a standard (non-administrator)
Command Prompt.

### Update MSYS2

At the Windows Command Prompt opened from above, type the following

```bash
# Change directories, and open the MSYS2 Shell:
cd /d (C|D):\JTSDK-Tools\tools\msys2
msys2_shell.cmd
```

| ![Initial Update](images/msys2/msys2.1.PNG?raw=true) |
|:--:|
| *Initial Opening Results* |

### Initial Update

>NOTE: During the initial update, you many see various warning, and in
some cases, errors displayed on the screen during the internal update
process. According to the MSYS2 Dev group, this is expected, and not
to be concerned about.

- In the MSYS2 Command Window, type the following command, and when
prompted with `Proceed with installation? [Y/n]`, type `Y`.
- At the conclusion of the `Initial Update`, close the window using the
`X` at the top right on the MSYS2 console window.

```bash
# In the MSYS2 Console, type:
pacman -Syuu
```

| ![Initial Update](images/msys2/msys2.2.PNG?raw=true) |
|:--:|
| *Initial Update* |

### Second Update

- Back in the Windows Command Prompt, re-run the command to open the `MSYS2`
console, and perform a second update with the following command:
- When prompted with `Proceed with installation? [Y/n]`, type `Y`.

```bash
# In the Windows Console, type the following:
msys2_shell.cmd
```

```bash
# In the MSYS2 Console, type the following:
pacman -Syuu
```

| ![Second Update](images/msys2/msys2.3.PNG?raw=true) |
|:--:|
| *Second Update* |

### Continue Updates

- Continue updating `MSYS2` until no additional updates are presented.

```bash
# In the MSYS2 Console, type the following:
pacman -Syuu
```

| ![Continue Updates](images/msys2/msys2.4.PNG?raw=true) |
|:--:|
| *Continue Updates* |

## Install MSYS2 Packages

In addition to the default installation, Hamlib has a number of build
dependencies that user must install be for compiling.

After the final update of MSYS, issue the following command in the terminal.

> NOTE: You must have installed JTSDK-Core-Apps before running the install command below.

```bash
# In the MSYS2 Terminal, type the following:
install-pkg-list.sh
```

If the installation completes without error, you can test build Hamlib3

### Test Build Hamlib

>IMPORTANT: Before building `Hamlib`, exit all MSYS2 and JTSDK-Tool consoles
that are open.

Open a Windows Console, type the following:

```bash
# Change directories, type:
cd /d (C|D):\JTSDK-Tools

# Run jtsdk-env.cmd, type:
jtsdk-env.cmd

# At the prompt, type:
msys2
```

```bash
# In the MSYS2 Console, type:
build-hamlib.sh

# Watch for errors. If none, the results should be as follows.
```

| ![Hamlib Build Results](images/msys2/msys2.5.PNG?raw=true) |
|:--:|
| *Hamlib Build Results* |

### Exit MSYS2

- After test building hamlib3, exit the `MSYS2` console using:

```bash
exit
```

### Exit Windows Console

- Exit the Windows Command Prompt Console using:

```bash
exit
```

This concludes configuration of `MSYS2`

## Next Step

Proceed to ==> [Python Installation](Install-Python.md)