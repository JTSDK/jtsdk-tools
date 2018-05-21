::-----------------------------------------------------------------------------::
:: Name .........: unset-jtsdk-home.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JTSDK_HOME
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call unset-jtsdk-home.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::

:: Usets the JTSDK_HOME Variable for testing purposes
@ECHO OFF

CLS
ECHO Unsetting JTSDK_HOME for testing purposes.
SET JTSDK_HOME=
ECHO JTSDK_HOME Set To ^( %JTSDK_HOME% ^)

exit /b 0