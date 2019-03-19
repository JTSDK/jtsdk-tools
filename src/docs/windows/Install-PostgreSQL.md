# Optional - Install PostgreSQL

| Application Data ||
| ---| --- |
| Name        | PostgreSQL |
| Version     | 11.2+ |
| Arch        | 64 bit |
| Description | Advanced High Performance Relational Database |

> PostgreSQL is a powerful, open source object-relational database system with
> over 30 years of active development that has earned it a strong reputation for
> reliability, feature robustness, and performance.
>
> -- *The PostgreSQL Global Development Group, Postgres.org*

## Background

- PostgreSQL is highly configurable; from it's procedural language support,
through to it's extensive Roles and Permission structure, installation can go
from simple to extremely complex.
- For the purposes of **JTSDK** usage, and the vast majority of Radio Data Store
activity, the default installation procedure will suffice for most needs.
- If users find themselves in need of advanced features, the installed instance
can easily be extended to accomodate many advanced features without a great deal
of difficulty.

## Helpful Links

- [Website](https://www.postgresql.org/)
- [Documentation](https://www.postgresql.org/docs/10/static/index.html)
- [Tutorials-1](http://www.postgresqltutorial.com/)
- [Tutorials-2](https://www.tutorialspoint.com/postgresql/)
- [PostgreSQL Cheat Sheet](http://www.postgresqltutorial.com/postgresql-cheat-sheet/)

## Download

- [PostgreSQL EDB Installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

## Installation

Browse to, then **double-click** the downloaded **PostgreSQL EDB Installer**, and follow the steps below.

### Welcome Screen

Select next to continue.

| ![Welcome Screen](images/postgres/pgsql11/postgres.1.PNG?raw=true) |
|:--:|
| *Welcome Screen* |

### Installation Directory

>IMPORTANT: The Installation Directory is critical. Use the table below to set
the location.

```bash
# For C-Drive Installation, set path to:

C:\JTSDK-Tools\tools\PostgreSQL\11

# For D-Drive installation, set path to:

D:\JTSDK-Tools\tools\PostgreSQL\11

# If another drive is used, substitute the drive letter for one
# of the examples above.
```

| ![Installation Directory](images/postgres/pgsql11/postgres.2.PNG?raw=true) |
|:--:|
| *Installation Directory* |

### Select Components

Stack Builder provides a number of advanced application tools and **is not
recommended** for the first time user, nor first run installation. Advanced
tooling can always be added later.

- [X] PostgreSQL Server (required)
- [X] pgAdmin4 (required)
- [ ] Stack Builder (*not recommended*)
- [X] Command Line Tools (required)

| ![Select Components](images/postgres/pgsql11/postgres.3.PNG?raw=true) |
|:--:|
| *Select Components* |

### Data Directory

>IMPORTANT: The Data Directory is critical. Use the table below to set the location.

- The database can be moved procedurally post-install if the size grows to an
unmanageable level for the current drive space. For most users, the locations
listed below should be adequate.
- When *uninstalling* PostgreSQL, this folder *does not* get removed, thus your
data will remain safe.

```bash
# For C-Drive Installation, set path to:

C:\JTSDK-Tools\tools\PostgreSQL\11\data

# For D-Drive installation, set path to:

D:\JTSDK-Tools\tools\PostgreSQL\11\data

# If another drive is used, substitute the drive letter for one
# of the examples above.
```

| ![Data Directory](images/postgres/pgsql11/postgres.4.PNG?raw=true) |
|:--:|
| *Data Directory* |

### Postgres Password

The default user in a new PostgreSQL installation is named **postgres**. The
default database is also named **postgres**. For local development purposes,
there is little need for high-security. To make things easy for development and
testing, most use a default password of **postgres** also. This setup results in
the following:

```bash
Host.......: localhost
Port.......: 5432
Username...: postgres
Password...: postgres
Database...: postgres
```

| ![Postgres Password](images/postgres/pgsql11/postgres.5.PNG?raw=true) |
|:--:|
| *Postgres Password* |

### Server Port

Unless you intend to run multiple servers on multiple ports, it's
**highly recommended** to use the default **PostgreSQL Port of: 5432**.

| ![Server Port](images/postgres/pgsql11/postgres.6.PNG?raw=true) |
|:--:|
| *Server Port* |

### Advanced Options

Unless you are familiar with **PostgreSQL Advanced Options**, it's recommended
to leave this setting as **[Default locale]**

| ![Advanced Options](images/postgres/pgsql11/postgres.7.PNG?raw=true) |
|:--:|
| *Advanced Options* |

### Pre Installation Summary

Verify the installation parameters are what you intend, then next to continue.

| ![Pre Installation Summary](images/postgres/pgsql11/postgres.8.PNG?raw=true) |
|:--:|
| *Pre Installation Summary* |

### Finish Installation

If the installation finished without error, you now have a PostgreSQL database
running on your system with the same parameters as mentioned in the
[Postgres Password Section](#postgres-password).

```bash
Host.......: localhost
Port.......: 5432
Username...: postgres
Password...: postgres
Database...: postgres
```

| ![Finish Installation](images/postgres/pgsql11/postgres.9.PNG?raw=true) |
|:--:|
| *Finish Installation* |

## Post Installation Update

The EDB Installer adds two double-quotes to its environment script that causes
issues within the **JTSDK-Tools** environment. The fix is to remove these quotes
from the env file.

```bash

# Using VS Code or your favorite text editor, edit pg_env.bat
# and remove the double quotes.

# For C-Drive Installation, file location is:

C:\JTSDK-Tools\tools\PostgreSQL\11\pg_env.bat

# Before
@SET PATH="C:\JTSDK-Tools\tools\PostgreSQL\11\bin";%PATH%

# After
@SET PATH=C:\JTSDK-Tools\tools\PostgreSQL\11\bin;%PATH%

# Save and Exit

# For D-Drive installation, file location is:

D:\JTSDK-Tools\tools\PostgreSQL\11\pg_env.bat

# Before
@SET PATH="D:\JTSDK-Tools\tools\PostgreSQL\11\bin";%PATH%

# After
@SET PATH=D:\JTSDK-Tools\tools\PostgreSQL\11\bin;%PATH%

# Save and exit

```

This concludes the [PostgreSQL Installation](Install-PostgreSQL.md). Additional
database information, tests, and code snippet information will be
posted at <JTSDK@Groups.io>.

## Next Step

Proceed to ==> [Database Tools Installation](Install-DB-Tools.md)