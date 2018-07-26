| Application Data ||
| ---| --- |
| Name        | Jtsdk.Core.Options |
| Version     | 3.0.0 |
| Arch        | 32 or 64 bit |
| Description | Used for configuring options in JTSDK CLI tools |


## Available Options

- The following options are available through `Jtsdk.Core.Options`

| Option | Description
| :--- | :--- |
| Autorun | Runs an application after compiling
| Clean | Cleans the build tree
| Cmake310 | Enable CMake version 3.10 v.s. 3.5.2
| Java | Indicates Java is enabled in the environment
| PostposgreSQL | Indicates PostgreSQL is enabled in the environment
| QT59 | Enable Qt 5.9 and associated GCC tool-chain
| Quiet | Suppress screen display messages
| Reconfigure | Re-Run Configure before compiling
| Separate | Separate builds by versions and build type
| Squilte3 | Indicates Sqlite3 is enabled in the environment
| Unix | Enable MSYS2 Unix Command Line Tools

## Usage

- Display Help Message: `Jtsdk.Core.Options -h`

| ![Option Help Menu](images/jtsdk-core-options/options.1.PNG?raw=true) |
|:--:|
| *Display Help Menu* |

- List Option Status: `Jtsdk.Core.Options -l`

| ![Option Status](images/jtsdk-core-options/options.2.PNG?raw=true) |
|:--:|
| *Option Status* |

- Enable Default Options: `Jtsdk.Core.Options -e default`

| ![Set Default Options](images/jtsdk-core-options/options.2.PNG?raw=true) |
|:--:|
| *Enable Default Options* |
