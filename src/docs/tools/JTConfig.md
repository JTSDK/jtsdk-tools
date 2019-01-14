# Option Configuration

| Application Data ||
| :---|:---        |
| Name             | JTConfig |
| Version          | 3.0.1 |
| Arch             | 64 bit preferred |
| Status           | Release
| Description      | Used for configuring options in JTSDK-Tools

## Available Options

| Option      | Description
| :---        | :--- |
| Autorun     | Runs an application after compiling
| Clean       | Cleans the build tree
| Cmake310    | Enable CMake version 3.10 v.s. 3.5.2
| Java        | Indicates Java is enabled in the environment
| PostgreSQL  | Indicates PostgreSQL is enabled in the environment
| QT59        | Enable Qt 5.9 and associated GCC tool-chain
| Quiet       | Suppress screen display messages
| Reconfigure | Re-Run Configure before compiling
| Separate    | Separate builds by versions and build type
| SQLite3     | Indicates Sqlite3 is enabled in the environment
| Unix        | Enable MSYS2 Unix Command Line Tools

## Usage

### Display Help Message: `JTConfig -h`

| ![Option Help Menu](images/JTConfig/options.1.PNG?raw=true) |
|:--:|
| *Display Help Menu* |

### List Option Status: `JTConfig -l`

| ![Option Status](images/JTConfig/options.2.PNG?raw=true) |
|:--:|
| *Option Status* |

### Enable Default Options: `JTConfig -e default`

| ![Set Default Options](images/JTConfig/options.2.PNG?raw=true) |
|:--:|
| *Enable Default Options* |
