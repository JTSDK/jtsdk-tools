# Overview

| Application Data ||
| ---| --- |
| Installer Download | [EDB v10.6 Win-x86-64](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) |
| Documentation | [PostgreSQL 10.6](https://www.postgresql.org/docs/10/index.html) |
| Release Notes | [PostgreSQL 10.6](https://www.postgresql.org/docs/10/release-10-6.html) |

The following guide is for upgrading to `PostgreSQL-10.6`. It
is assumed you have performed the initial installation as outlined in
[PostgreSQL Installation Documentation](../Install-PostgreSQL.md).

## Step-1 - Downlod Installer

Download the [EDB v10.6 Win-x86-64](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) installer, ensuring you select the `Version 10.6` under `Win-x86-64 bit`.

## Step-2 - Stop PostgreSQL Server

There are a number of ways to stop the PostgreSQL server instance. For this
example, I'll be using the `Windows Task Manager`.

``` shell
* Right-Click the Windows Task Bar, then select Task Manager.
* Select the Services Tab
* Scroll down to: postgresql-x64-10
* Right-Click postgresql-x64-10 and select Stop.
* Close Windows Task manager
```

| ![Task Manager](../images/3.0.2/pg-task-manager.PNG?raw=true) |
|:--:|
| *Windows Task Manager* |

## Step-3 - Run PostgreSQL Installer

Browse to the location where the `EDB v10.6 Win-x86-64` was saved, and run it.
You should not need to change any options, with the exception of
`Deselecting Stack Builder`.

>NOTE: During the installation process, the new server version will be started.
> There is no need to use Windows Task Manager to control the re-start.

## Step-4 - Post Install Bug Fix

There is a bug in the installer environment script (`pg_env.bat`) that adds double-quotes around a critical path variable. This is easily fixed editing the file manually after installation.

``` shell
* Using Windows File Explorer, browse to:

(C|D):\JTSDK-Tools\tools\PostgreSQL\10

* Right-Click on pg_env.bat and select Open with Code (VS Code).
* Remove the Double-Quotes in Line (4). It should look similar
to the following when finished:

@SET PATH=D:\JTSDK-Tools\tools\PostgreSQL\10\bin;%PATH%

* Save pg_env.bat and exit VS Code.
```

## Step-5 - Verify Server Version

After editing the `pg_env.bat` file, check the server is working properly by validating the new version.

``` shell
* Browse to and open JTSDK-Env
* At the prompt, type: psql --version
```

You should see `Version 10.6` render.

| ![PostgreSQL version](../images/3.0.2/pg-version-10.6.PNG?raw=true) |
|:--:|
| *PostgreSQL v10.6 Check* |

## Bug Reports

If you run into problems with the upgrade, submit a ticket on the
[Issue Tracker](https://github.com/KI7MT/jtsdk-tools/issues).