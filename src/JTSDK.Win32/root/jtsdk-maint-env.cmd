::-----------------------------------------------------------------------------::
:: Name .........: jtsdk-maint-env.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Maintenance Environment for JTSDK
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call jtsdk-maint-env.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: jtsdk-maint-env.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: jtsdk-maint-env.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET URL=https://github.com/KI7MT/jtsdk-dotnet-core.git

IF EXIST %CD%\ver.jtsdk (
    SET JTSDK_HOME=%CD%
)

:: NOTE: This script is designed to wotk with JTSDK ONLY
IF DEFINED JTSDK_HOME ( GOTO _SET_VERSION ) ELSE ( GOTO _NOT_DEFINED )
GOTO GOTO _SET_VERSION

:: .Net Version at time fo initial release
:_SET_VERSION
IF EXIST %CD%\ver.jtsdk (
SET /P ver_jtsdk=<ver.jtsdk
)

:: Set some basic ennvironment variables
COLOR 0E
SET LANG=en_US

:: Add SRCD Path
SET srcd=%JTSDK_HOME%\src
mkdir %srcd% >nul 2>&1

:: Set Final path
SET PATH=%JTSDK_HOME%;%PATH%

:: Make sure srcd exists

:: Full paths are needed for some versions of Windows
:: Why some are and others are not, is still unknown.
TITLE JTSDK Maintenance Console

:: Doskey's for use with the Maintenance Environment
DOSKEY clear=cls
DOSKEY ls=dir

:: Start Main Script
CD /D %JTSDK_HOME%
IF NOT EXIST %srcd% (mkdir %srcd%)
dotnet --version >d.v. & set /p ver_dotnet=<d.v & del /s d.v >nul 2>&1
CLS
ECHO -----------------------------------------------------------
ECHO  JTSDK Maintenance Environment - %ver_jtsdk%
ECHO -----------------------------------------------------------
ECHO.
ECHO  JTSDK Version ........: %ver_jtsdk%
ECHO  Net Core Versoin .....: %ver_dotnet%
ECHO.
ECHO.
GOTO _EOF

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
GOTO _EOF

:_EOF
%COMSPEC% /A /Q /K
