# Optional - Install PostgreSQL

| Application Data ||
| ---| --- |
| Name        | PostgreSQL |
| Version     | 10.4+ |
| Arch        | 64 bit |
| Description | Advanced High Performance Relational Database |

> PostgreSQL is a powerful, open source object-relational database system with
> over 30 years of active development that has earned it a strong reputation for
> reliability, feature robustness, and performance.
>
> -- <cite>The PostgreSQL Global Development Group, Postgres.org</cite>

## Background

- PostgreSQL is highly configuregable; from it's procedural language support,
through to it's extensinve Roles and Permission structure, installation can go
from simple to extremely complex.
- For the purposes of `JTSDK` usage, and the vast majority of Radio Data Store
activity, the defualt installaiton procedure will suffice for most needs.
- If users find themselves in need of advanced features, the installed instance
can easily be extended to accomodate many advanced features without a great deal of difficulity.

## Helpfull Links

- [Website](https://www.postgresql.org/)
- [Documentation](https://www.postgresql.org/docs/10/static/index.html)
- [Tutorials-1](http://www.postgresqltutorial.com/)
- [Tutorials-2](https://www.tutorialspoint.com/postgresql/)
- [PostgreSQL Cheat Sheet](http://www.postgresqltutorial.com/postgresql-cheat-sheet/)

## Download

- [PostgreSQL EDB Installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
- [JTSDK Third Party Installer Package](https://sourceforge.net/projects/jtsdk/files/win32/3.0.0/release/)

Both downloads provide the same installer, and reflect the installation
steps below. Which to use is entirely up to the end-user.

## Installation Walk-Through

Browse to, then `double-click` the downloaded `PostgreSQL EDB Installer`, and follow the steps below.

### Welcome Screen

Select next to continue.

| ![Welcome Screen](images/postgres/postgres.1.PNG?raw=true) |
|:--:|
| *Welcome Screen* |

### Installation Directory

>IMPORTANT: The Installation Directory is critical. Use the table below to set
the location.

``` shell
# For C-Drive Installation, set path to:

C:\JTSDK-Tools\tools\PostgreSQL\10

For D-Drive installation, set path to:

D:\JTSDK-Tools\tools\PostgreSQL\10

# If another drive is used, substitute the drive letter for one
# of the examples above.

```

| ![Installation Directory](images/postgres/postgres.2.PNG?raw=true) |
|:--:|
| *Installation Directory* |

### Select Components

Stack Builder provides a number of advanced application tools and **is not recommended** for the first time user, nor first run installation. Advanced tooling can always be added later.

- [X] PostgreSQL Server (required)
- [X] pgAdmin4 (required)
- [ ] Stack Builder (*not recommended*)
- [X] Command Line Tools (required)

| ![Select Components](images/postgres/postgres.3.PNG?raw=true) |
|:--:|
| *Select Components* |


### Data Directory

>IMPORTANT: The Data Directory is critical. Use the table below to set the location.

- The database can be moved procedurally post-install if the size grows to an unmanageable level for the current drive space. For most users, the locations listed below should be adequate.
- When *uninstalling* PostgreSQL, this folder *does not* get removed, thus your data will remain safe.

``` shell
# For C-Drive Installation, set path to:

C:\JTSDK-Tools\tools\PostgreSQL\10\data

For D-Drive installation, set path to:

D:\JTSDK-Tools\tools\PostgreSQL\10\data

# If another drive is used, substitute the drive letter for one
# of the examples above.

```

| ![Data Directory](images/postgres/postgres.4.PNG?raw=true) |
|:--:|
| *Data Directory* |

### Postgres Password

The default user in a new PostgreSQL installation is named `postgres`. The default database is also named `postgres`. For local development purposes,
there is little need for high-security. To make things easy for development and testing, most use a default password of `postgres` also. This setup results in the following:

```
Host.......: localhost
Port.......: 5432
Username...: postgres
Password...: postgres
Database...: postgres

```

| ![Postgres Password](images/postgres/postgres.5.PNG?raw=true) | 
|:--:| 
| *Postgres Password* |

### Server Port

Unless you intend to run multiple servers on multiple ports, it's `highly recommended` to use the default `PostgreSQL Port of: 5432`.

| ![Server Port](images/postgres/postgres.6.PNG?raw=true) |
|:--:|
| *Server Port* |

### Advanced Options

Unless you are familiar with `PostgreSQL Advanced Options`, it's recommended to leave this setting as `[Default locale]`

| ![Advanced Options](images/postgres/postgres.7.PNG?raw=true) |
|:--:|
| *Advanced Options* |

### Pre Installation Summary

Verify the installation parameters are what you intend, then next to continue.

| ![Pre Installation Summary](images/postgres/postgres.8.PNG?raw=true) |
|:--:|
| *Pre Installation Summary* |

### Finish Installation

If the installation finished without error, you now have a PostgreSQL database running on your system with the same parameters as mentioned in the [Postgres Password Section](#postgres-password).

``` shell
Host.......: localhost
Port.......: 5432
Username...: postgres
Password...: postgres
Database...: postgres

```

| ![Finish Installation](images/postgres/postgres.9.PNG?raw=true) |
|:--:|
| *Finish Installation* |

This concludes the [PostgreSQL Installation](Install-PostgreSQL). Additional
database information, tests, and additional code snippet information will be
posted at [JTSDK@Groups.io](https://groups.io/g/JTSDK).

### Proceed to Next Step => [Database Tools Installation](Install-DB-Tools)