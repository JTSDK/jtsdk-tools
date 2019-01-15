::-----------------------------------------------------------------------------::
:: Name .........: make.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: JTSDK.NetCore Build script
:: Project URL ..: https://github.com/KI7MT
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: make.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: make.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Returns ERRORLEVEL=1 is %JTSDK_HOME% does not exist
IF [%JTSDK_HOME%]==[] (
ECHO.
ECHO  Make Error
ECHO.
ECHO  JTSDK_HOME Variable was not found.
ECHO  Ensure you running from the JTSDK Tools Environment
ECHO.
ECHO  If installing or upgrading from a Windows Console,
ECHO  please set the JTSDK_HOME variable before running make.
ECHO.
exit /b 1
)
GOTO _START

:_START
:: Set the Git tag into a file
>%JTSDK_HOME%\ver.git (
git rev-parse --short HEAD
)

:: Get Command line Options %1
IF /I [%1]==[clean] ( GOTO _CLEAN )
IF /I [%1]==[build] ( GOTO _BUILD )
IF /I [%1]==[publish] ( GOTO _PUBLISH )
IF /I [%1]==[install] ( GOTO _INSTALL )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO HELP

:: Note: The requires that MSYS2 be installed first as it uses the (rm) package
:_CLEAN
CLS
ECHO ------------------------------
ECHO  Clean JTSDK.NetCore
ECHO ------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
ECHO  Cleaning All Release Files
dotnet clean --configuration Release
ECHO Cleaning All Debug Files
dotnet clean --configuration Release
ECHO %JTSDK_HOME%\tools\apps ^=^> Published Files
DEL /s /q %JTSDK_HOME%\tools\apps\J*
POPD
GOTO EOF

:_BUILD
CLS
ECHO ------------------------------
ECHO  Building JTSDK.NetCore
ECHO ------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet build -c release -o out
POPD
GOTO EOF

:_PUBLISH
CLS
ECHO ------------------------------
ECHO  Publishing JTSDK.NetCore
ECHO ------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet publish -c release -o %JTSDK_HOME%\tools\apps
POPD
GOTO EOF

:_INSTALL
CLS
ECHO -------------------------------------------
ECHO  Installing JTSDK Net Core Applications
ECHO -------------------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet publish -c release -o %JTSDK_HOME%\tools\apps
ECHO.
POPD

:: Publish JTConfig
::PUSHD %CD%\src\JTSDK.NetCore\Jtsdk.Core.Library\out
::ECHO   Install JTConfig
::robocopy %CD%\ %JTSDK_HOME%\tools\apps /NFL /NDL /NJH /NJS /nc /ns /np Jtsdk*.*
::POPD

:: Publish JTConfig
::PUSHD %CD%\src\JTSDK.NetCore\JTConfig\out
::ECHO   Install JTConfig
::robocopy %CD%\ %JTSDK_HOME%\tools\apps /NFL /NDL /NJH /NJS /nc /ns /np JTConfig*.*
::POPD

:: Publish JTEnv
::PUSHD %CD%\src\JTSDK.NetCore\JTEnv\out
::ECHO   Installing JTEnv
::robocopy %CD%\ %JTSDK_HOME%\tools\apps /NFL /NDL /NJH /NJS /nc /ns /np JTEnv*.*
::POPD

:: Change Directories to JTSDK.Win32
PUSHD %CD%\src\JTSDK.Win32
ECHO   Install Win32 Environment Files
robocopy %CD%\env %JTSDK_HOME%\env /E /NFL /NDL /NJH /NJS /nc /ns /np

ECHO   Install Win32 Scripts
robocopy %CD%\scripts %JTSDK_HOME%\tools\scripts /E /NFL /NDL /NJH /NJS /nc /ns /np

ECHO   Install MSYS2 ^/usr^/bin scripts
robocopy %CD%\msys2\bin %JTSDK_HOME%\tools\msys2\usr\bin /NFL /NDL /NJH /NJS /nc /ns /np *.sh

ECHO   Install Win32 Root Files
robocopy %CD%\root %JTSDK_HOME% /NFL /NDL /NJH /NJS /nc /ns /np
POPD

:: Change Directories to JTSDK.Pgsql
PUSHD %CD%\src\JTSDK.Pgsql
ECHO   Install Pgsql Scipts
robocopy %CD%\R-DaaS %JTSDK_HOME%\tools\scripts\sql\R-DaaS /E /NFL /NDL /NJH /NJS /nc /ns /np
POPD

:: Change Directories to JTSDK.Python
PUSHD %CD%\src\JTSDK.Python\scripts
ECHO   Install Python Scipts
robocopy %CD%\ %JTSDK_HOME%\tools\scripts\python /E /NFL /NDL /NJH /NJS /nc /ns /np *.py
POPD

:: NO LONGER USED, See: jtsdk-java-utils project
:: Conditional Build of Java Apps / Scripts
::IF EXIST %JTSDK_HOME%\java.tools (
::PUSHD %CD%\src\JTSDK.Java\scripts
::ECHO   Compiling Java Apps
::for /r %%i in (*.java) do javac -d %JTSDK_HOME%\tools\scripts\java %%i
::)
::ECHO.
::POPD

:: Finished installation
ECHO   Finished
GOTO EOF

:: ----------------------------------------------------------------------------
::  HELP MESSAGE
:: ----------------------------------------------------------------------------
:_HELP
CLS
ECHO ------------------------------
ECHO  JTSDK Make Help
ECHO ------------------------------
ECHO.
ECHO  The build script takes one option^:
ECHO.
ECHO    clean       :  clean the build tree
ECHO    build       :  build source tree
ECHO    publish     :  publish the application
ECHO.
ECHO    Example: 
ECHO    make publish
ECHO    make install
ECHO.
GOTO EOF

:EOF
EXIT /b 0

:: ----------------------------------------------------------------------------
::  ERROR MESSAGES
:: ----------------------------------------------------------------------------
:_NOT_DEFINED
CLS
ECHO ------------------------------
ECHO  Environment Error
ECHO ------------------------------
ECHO.
ECHO   JTSDK_HOME ^= NOT SET
ECHO. 
ECHO   This script must be run from within
ECHO   the JTSDK Environment.
ECHO.
ECHO   Alternatively, you can manyally set the
ECHO   JTSDK_HOME variable with the following:
ECHO.
ECHO   C-Drive Location
ECHO   set JTSDK_HOME=C:\JTSDK-Tools
ECHO.
ECHO   D-Drive Location
ECHO   set JTSDK_HOME=D:\JTSDK-Tools
ECHO.
ECHO   Then re-run your commands.   
ECHO.
exit /b 1