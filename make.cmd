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
PUSHD %CD%\src\JTSDK.NetCore\Jtsdk.Core.Options\bin
ECHO * Cleaning All Release Files
rm -rf %CD%\Release >nul 2>&1
ECHO * Cleaning All Debug Files
rm -rf %CD%\Debug >nul 2>&1
POPD
GOTO EOF

:_BUILD
CLS
ECHO ------------------------------
ECHO  Building JTSDK.NetCore
ECHO ------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet build -c release
POPD
GOTO EOF

:_PUBLISH
CLS
ECHO ------------------------------
ECHO  Publishing JTSDK.NetCore
ECHO ------------------------------
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet publish -c release
POPD
GOTO EOF

:_INSTALL
CLS
ECHO ------------------------------
ECHO  Installing JTSDK.NetCore
ECHO ------------------------------
ECHO.
ECHO * Building Source Files
ECHO.
PUSHD %CD%\src\JTSDK.NetCore
dotnet publish -c release
ECHO.
POPD
:: Copy files to destination
ECHO   Installing JTSDK .Net Core
ECHO.
PUSHD %CD%\src\JTSDK.NetCore\Jtsdk.Core.Options\bin\Release\netcoreapp2.1
ECHO   Installing Environment Files
robocopy %CD%\env %JTSDK_HOME%\env /E /NFL /NDL /NJH /NJS /nc /ns /np
ECHO   Installing Scripts
robocopy %CD%\scripts %JTSDK_HOME%\scripts /E /NFL /NDL /NJH /NJS /nc /ns /np
ECHO   Installing Psql Scipts
robocopy %CD%\R-DaaS %JTSDK_HOME%\scripts\sql\R-DaaS /E /NFL /NDL /NJH /NJS /nc /ns /np
ECHO   Installing MSYS2 Scripts
robocopy %CD%\scripts\msys2\ %JTSDK_HOME%\tools\msys2\usr\bin /NFL /NDL /NJH /NJS /nc /ns /np *.sh
ECHO   Installing Root Files
robocopy %CD%\root %JTSDK_HOME% /NFL /NDL /NJH /NJS /nc /ns /np
ECHO   Installing .Net Core Libraries and Applications
robocopy %CD%\ %JTSDK_HOME%\tools\apps /NFL /NDL /NJH /NJS /nc /ns /np Jtsdk.*
ECHO   Finished
POPD
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