::-----------------------------------------------------------------------------::
:: Name .........: jtsdk-maint-env
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Maintenance Environment for JTSDK
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call jtsdk-maint-env.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: .Net Version at time fo initial release
SET /P ver_dotnet=/P version=<ver.dotnet
SET /P ver_jtsdk=<ver.jtsdk

:: Set some basic ennvironment variables
COLOR 0E
SET LANG=en_US

:: Set Minimal Path
SET based=%CD%
SET dotnet_dir=%based%\tools\dotnet\%ver_dotnet%
SET unix_tools=%based%\tools\msys2\usr\bin
SET srcd=%based%\src

SET PATH=%based%;%dotnet_dir%;%unix_tools%;%WINDIR%\System32

:: Full paths are needed for some versions of Windows
:: Why some are and others are not, is still unknown.
SET version=%version% %rev%
TITLE JTSDK Maintenance Console

:: Doskey's for use with the Maintenance Environment
DOSKEY help-checkout=@echo This feature has not be implemented yet.
DOSKEY help-install=@echo This feature has not be implemented yet.
DOSKEY help-upgrade=@echo This feature has not be implemented yet.
DOSKEY clear=cls
DOSKEY ls=dir

:: Start Main Script
CD /D %based%
IF NOT EXIST %based%\src (mkdir %based%\src)
CLS
ECHO -----------------------------------------------------------
ECHO  JTSDK Maintenance Environment - %version%
ECHO -----------------------------------------------------------
ECHO.
ECHO  JTSDK Version .........: %ver_jtsdk%
ECHO  Dot Net Core Versoin ..: %ver_dotnet%
ECHO.
ECHO  Provides Access To: Subversion, Git, and many other Gnu
ECHO  tools from the MSYS2 bin diretory.
ECHO.
ECHO  NOTE: Unix applicaitons are enabled by default.
ECHO.
ECHO  - For Checkout Help ..: help-checkout
ECHO  - For Update Help ....: help-update
ECHO  - For Upgrade Help ...: help-upgrade
ECHO.

%COMSPEC% /A /Q /K