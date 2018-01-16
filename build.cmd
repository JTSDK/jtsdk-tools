::-----------------------------------------------------------------------------::
:: Name .........: build.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: JTSDK.NetCore Build script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: build [%1] wehre [%1] is clean or publish
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2018 Greg Beam, KI7MT
:: License ......: Apache 2.0
::
::-----------------------------------------------------------------------------::

:: NOTE: This script is designed to wotk with JTSDK ONLY

@ECHO OFF

IF DEFINED JTSDK_HOME ( GOTO START ) ELSE ( GOTO NOT_DEFINED )

:START
setlocal 
set base=%CD%

:: Get Command line Options %1
IF /I [%1]==[clean] ( GOTO A_CLEAN )

:: Get Command line Options %1
IF /I [%1]==[build] ( GOTO A_BUILD )

:: Get Command line Options %1
IF /I [%1]==[publish] ( GOTO A_PUBLISH )
GOTO HELP

:A_CLEAN
CLS
ECHO ------------------------------
ECHO  Clean JTSDK.NetCore
ECHO ------------------------------
ECHO.
CD %CD%\src\JTSDK.NetCore
dotnet clean
goto EOF

:A_BUILD
CLS
ECHO ------------------------------
ECHO  Building JTSDK.NetCore
ECHO ------------------------------
ECHO.
CD %CD%\src\JTSDK.NetCore
dotnet build
goto EOF

:A_PUBLISH
CLS
ECHO ------------------------------
ECHO  Publishing JTSDK.NetCore
ECHO ------------------------------
ECHO.
CD %CD%\src\JTSDK.NetCore
dotnet publish -c release -o %JTSDK_HOME%\tools\JTSDK.NetCore
goto EOF

:HELP
CLS
ECHO ------------------------------
ECHO  JTSDK Build Help
ECHO ------------------------------
ECHO.
ECHO  The build script takes one option^:
ECHO.
ECHO    clean       :  clean the build tree
ECHO    publish     :  publish the application
ECHO.
ECHO    Example: build clean
ECHO    Example: build publish
ECHO.
GOTO EOF

:EOF
cd %base%
endlocal

exit /b 0

:NOT_DEFINED
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

exit /b 1
