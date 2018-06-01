::-----------------------------------------------------------------------------::
:: Name .........: make.cmd
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
IF /I [%1]==[clean] ( GOTO _CLEAN )

:: Get Command line Options %1
IF /I [%1]==[build] ( GOTO _BUILD )

:: Get Command line Options %1
IF /I [%1]==[publish] ( GOTO _PUBLISH )

:: Get Command line Options %1
IF /I [%1]==[help] ( GOTO _HELP )
)
GOTO HELP

:_CLEAN
CLS
ECHO ------------------------------
ECHO  Clean JTSDK.NetCore
ECHO ------------------------------
ECHO.
pushd %CD%\src\JTSDK.NetCore
dotnet clean
popd
goto EOF

:_BUILD
CLS
ECHO ------------------------------
ECHO  Building JTSDK.NetCore
ECHO ------------------------------
ECHO.
pushd %CD%\src\JTSDK.NetCore
dotnet build
popd
goto EOF

:_PUBLISH
CLS
ECHO ------------------------------
ECHO  Publishing JTSDK.NetCore
ECHO ------------------------------
ECHO.
pushd %CD%\src\JTSDK.NetCore
:: For Production Uncomment the following line
:: dotnet publish -c release -o %JTSDK_HOME%\tools\apps

:: For Debug uncomment
dotnet publish -c release
popd
IF [%1]==[install] (

GOTO _INSTALL

)

:_INSTALL
goto EOF

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
ECHO    Example: build clean
ECHO    Example: build publish
ECHO.
GOTO EOF

:EOF
endlocal

exit /b 0

:: ----------------------------------------------------------------------------
::  ERROR MESSAGES
:: ----------------------------------------------------------------------------
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
