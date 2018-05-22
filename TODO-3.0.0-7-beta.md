
# TODO LIST For 3.0.0-7 Beta Release
The following items are on the critical TODO list for releasing 3.0.0-7 Beta. It
looks like a lot work, but, most is shell scripting, test and validaiton.This
approach is similar, but far more simplified, to how Microsoft performs their
load installaiton for Visual Studio.

## New Workload Installers
Previously, some users experienced problems with large downloads. Separating
the Inno Installers into logical groups will ease some of this burden. It
also makes for easier maintenance going forward.

### Installer Groups
- [X]  jtsdk-core-utils
- [ ]  jtsdk-dotnet-utils
- [ ]  jtsdk-doc-utils
- [ ]  jtsdk-db-utils
- [ ]  jtsdk-java-utils

> NOTE - This method only delivers the binaries. In cases such as Qt, VS Code,
Postgres, etc, additional installation action will be required.

The core installer is finished. However, all of these installations could be
performed with a self-extracting 7z archive. I've not ruled out that possiblity
if the need for a formal installaiton is no longer necessary. This concern
with this approach is the extraction does not land in the correct location.

## Post Inno Setup Steps and Scripts

Most all of these items will require a deticated script to complete. Along
with the scripts, each will need a How-Too document in the install section.
Having jtsdk-doc-utils instlled upfront makes this fairly stright forward, as
Markdown and Pandoc can be put to work during the publish stage of source
code builds.

| Item              |  Description 
|:------------------|:-------------
| install-vscode    | VS Code installaiton at the System Level
| install-pgit      | Run Post-Install setup for Portable Git
| install-python    | Install Anaconda python
| update-python     | Update conda. Needs to run Twice
| generate-envs     | Generate Virtual Environments
| install-postgres  | Base PostgreSQL Installation
| update-postgres   | Generate Roles and Databases
| validate-postgres | Test DB access from command line
| install-qt        | Base Qt Installation
| validate-qt       | Ensure both GCC compilers work
| install-jave      | Install or Verify Java Installation
| check-java        | Ensure JAVA_HOME is set properly

## Building jtsdk-dotnet-core
- git clone git://github.com/KI7MT/jtsdk-dotnet-core.git
- make-publish (working as expected)
- make-install (need to add Win32 scripts / folder structure)

> NOTE - The Git chekout and make-install method will be the primary delivery 
> means for all Scripts. This makes publishing updates far easier than delivering
> Inno Setup files.

## JTSDK Maint Env Script

- [ ]  checkout-jtsdk
- [ ]  update-jtsdk
- [X]  make-clean
- [ ]  make-build
- [ ]  make-restore
- [X]  make-publish
- [ ]  make-install
- [ ]  All Post Install Steps from Above

Ideally, the user just enters a simple command such as:
```shell
# Compile and publish .Net Core code, and all scripts
make-install

# Build and Publish .Net Core code only
make-publish
```
## General Script Work
- [ ]  Add env script for Pandoc (required for building HTML from Markdown)
- [ ]  Add some basic Help Screens when changing Qt, Cmake, GCC tools etc.
- [ ]  Validator Script. Simple script to check the basic health of the install
- [ ]  Makefile for Hamlib in MSYS2 (should be a separate package ??)

Last Update: 5/21/2018 @ 2300 MST