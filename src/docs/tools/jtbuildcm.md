# Build WSJT-X

The following is a short walkthrough in building the new
[WSJT-X Git Repository][] using `jtbuild`.

The build script does not depend on Git, nor has any interaction with Git. If the
user wishes to build from different URL / Repository, all that is
required is to update the `build.txt` file with the new checkout
path.

>IMPORTANT:
>- This script is temporary, and may be removed at any time. The
>script will persist until an appropriate `.Net Core` application can replace
>the functionality.
>
>- Target specific custom builds have been ommitted from this release. If
>deemed required, it will be added to the `.Net Core` replacement application.

## Build Targets

```bash
# In JTSDK-Tools Environment
jtbuild rinstall
jtbuild dinstall
jtbuild rconfig
jtbuild dconfig
jtbuild package
jtbuild docs
```

## Build Options

Only four options are available in this script. Use `jtconfig -h` for assistance
with setting these options.

| Item        | Action             | Description   |
| :-----------|--------------------|---------------|
| qt59        | enable or disable  | Use QT 5.9.5|
| clean       | enable or disable  | Clean Build tree before compile|
| reconfigure | enable or disable  | Reconfigure source tree before compile|
| autorun     | enable or disable  | Run WSJT-X after compiling|

The actions are the same as within the standard SVN build script.

----

## Default Profile

Source and Destination directories are provided by the `built.txt`, located
at `(C|D):\JTSDK-Tools\tmp\build.txt` The `build.txt` file contains just two lines
of interest, SRCD and DEST. Only the paths should change, do not change the prefix.

For this example, the file contains the following:

```bash
# For use with jtbuild only
# - Only the paths need to be changed
# - Do not use spaces in the paths as the build will fail
# - Ensure there is only one space between the prefix and path

# Edit the next line to set Source Location
SRCD D:\JTSDK-Tools\tmp\wsjtx

# Edit the next line to set Destination Directory
DEST D:\JTSDK-Tools\tmp\wsjtx-output
```

- SRCD represents the location and name of the of the repository checkout
- DEST is the root location where the artifacts will be located.

If you wish to use a different checkout location, update the SRD path. If
you would like a different Destination directory, update the DEST path.

## Using Sourceforge

It should not matter which repository service is used. For this example, we'll
being using `Sourceforge` and the [WSJT-X Master Branch][].

As noted earlier, `jtbuild` does not know of, nor is it concerned with
Git. All repository management should be performed outside of the
`jtbuild` script by using an appropriate Git Client.

### Clone Repository

You can use any Git Client you like. The only things that are of concern to the
`jtbuild` script is the full path including the checkout-name, and the
destination directory. For this build example, we'll be using the following:

```bash
Checkout Type ..........: Anonymous
Git Repo URL ...........: https://git.code.sf.net/p/wsjt/wsjtx 
Git Client .............: Git-Bash or Git-CMD
Source Directory .......: (C|D):\JTSDK-Tools\tmp\wsjtx
Destination Directory ..: (C|D):\JTSDK-Tools\wsjtx-output
```

#### **Step-1: Clone Repository**

Open a Windows Command Prompt or Git-Bash terminal, and checkout WSJT-X with the
following command:

>Note - You can change the final folder name if you wish. However, make sure to
update the `build.txt` file if you do.

```bash
# Clone WSJT-X

* Using Windows Console:
git clone https://git.code.sf.net/p/wsjt/wsjtx (C|D):\JTSDK-Tools\tmp\wsjtx

* Using Git-Bash
git clone https://git.code.sf.net/p/wsjt/wsjtx /(c|d)/JTSDK-Tools/tmp/wsjtx

Both commands should yield the same results, a new checkout in: (C|D):\JTSDK-Tools\tmp\wsjtx
```

#### **Step-2: Update build.txt File**

At this point, ensure you have updated both the SRCD and DEST path locations
in `(C|D):\JTSDK-Tools\tmp\build.txt` with your choices in checkout and
destination locations.

#### **Step-3: Build Master Branch**

You can use any of the items in `Available Build Commands`. For this example
we'll build the Master Release Install target.

```bash
# In a Windows Command Prompt or Git-Bash Terminal, change directory to the
# source location

#Windows CMD
cd /d (C|D):\JTSDK-Tools\tmp\wsjtx

#Git-Bash:
cd /(c|d)/JTSDK/tmp/wsjtx

#Check which branch you're on with:
git branch

Git should return:
* master

#Open JTSDK-Tools Config
# - Ensure your're on QT55
# - Ensure you've built Hamlib3, then type:

jtbuild rinstall

Note: you can use any of the following commands:
   rinstall   Builds the Release Install target
   dinstall   Builds the Debug Install target
   rconfig    Configure Only Release Install target
   dconfig    Configure Only Debug Install target
   package    Release Install Win32 Installer Package
   docs       Compiles the documentation

# The Output should be located at or near:

Source : (C|D):\JTSDK-Tools\tmp\wsjtx
Output : (C|D):\JTSDK-Tools\tmp\wsjtx-output\qt\5.5\1.9.2\Release\{build, install, package}
```

## Summary

In theory, you should be able to build any `Recent (1.8 - 1.9)` branch or tag
as long as the `build.txt` file is updated with the correct Source and
Destination locations.

[WSJT-X Git Repository]: https://sourceforge.net/p/wsjt/wsjtx/ci/stable/tree/
[WSJT-X Master Branch]: https://sourceforge.net/p/wsjt/wsjtx/ci/master/tree/