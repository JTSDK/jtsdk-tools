
# TODO LIST For 3.0.0-7 Beta Release

Last Update: 5/31/2018 0100 MST

The following items are on the critical TODO list for releasing 3.0.0-7 Beta. It
looks like a lot work, but, most is shell scripting, test or validaiton. This
approach is similar, but far more simplified, to how Microsoft performs their
workload installaiton for Visual Studio.

## New Workload Installers
Previously, some users experienced problems with large downloads. Separating
the Inno Setup installers into logical groups will ease some of this burden. It
also makes for easier maintenance going forward.

### Required Installer Groups
- [X]  Required - jtsdk-core-utils
- [ ]  Required - jtsdk-dotnet-utils

### Optional Installer groups
- [ ]  Optional - jtsdk-python-utils
- [ ]  Optional - jtsdk-doc-utils
- [ ]  Optional - jtsdk-db-utils
- [ ]  Optional - jtsdk-java-utils

> NOTE - This installation method only delivers the binaries. In cases such as
Qt, VS Code, Postgres, etc, additional installation action will be required.

## Post Inno Setup Steps and Scripts
Most all of these items will require a deticated script to complete. Along
with the scripts, each will need a How-Too document in the install section.
Having jtsdk-doc-utils instlled upfront makes this fairly stright forward, as
Markdown and Pandoc can be put to work during the publish stage of source
code builds.

### **Required How-Too Docs**
| Item              |  Description
|:------------------|:-------------
| install-pgit      | Run Post-Install setup for Portable Git
| generate-envs     | Generate Virtual Environments
| install-qt        | Base Qt Installation

### **Optional**
| Item              |  Description 
|:------------------|:-------------
| install-python    | Install Anaconda python
| update-python     | Update conda. Needs to run Twice
| install-vscode    | VS Code installaiton at the System Level
| install-postgres  | Base PostgreSQL Installation
| update-postgres   | Generate Roles and Databases with pgAdmin4
| validate-postgres | Test DB access from command line
| install-java      | Install or Verify Java Installation
| check-java        | Ensure JAVA_HOME is set properly

## Building jtsdk-dotnet-core
- git clone git://github.com/KI7MT/jtsdk-dotnet-core.git
- make-publish (working as expected)
- make-install (need to add Win32 scripts / folder structure)

> NOTE - The Git chekout and make-install method will be the primary delivery 
> means for all Scripts. This makes publishing updates far easier than delivering
> Inno Setup files.

## JTSDK Maint Env Script

- [X]  make-clean
- [ ]  make-build
- [ ]  make-restore
- [X]  make-publish
- [ ]  make-install

Ideally, and after git clone of the repository, the user just enters a simple
command such as:
```shell
# Compile and publish .Net Core code
make-install

# Build and Publish .Net Core code only
make-publish
```

Last Update: 5/31/2018 0100 MST