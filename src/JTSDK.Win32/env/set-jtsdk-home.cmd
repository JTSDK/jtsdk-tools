::-----------------------------------------------------------------------------::
:: Name .........: set-jtsdk-home.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JTSDK_HOME
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call set-jtsdk-home.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::

:: Edit this path variable for local testing
@ECHO OFF

CLS
ECHO Setting JTSDK_HOME for testing purposes.
SET JTSDK_HOME=D:\JTSDK-Tools
ECHO JTSDK_HOME Set To ^( %JTSDK_HOME% ^)

exit /b 0