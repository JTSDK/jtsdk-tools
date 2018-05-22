::-----------------------------------------------------------------------------::
:: Name .........: unset-jtsdk-config.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JTSDK_CONFIG
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call unset-jtsdk-config.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::

:: Usets the JTSDK_HOME Variable for testing purposes
@ECHO OFF

CLS
:: Usets the JTSDK_CONFIG Variable for testing purposes
ECHO Unsetting JTSDK_CONFIG for testing purposes.
SET JTSDK_CONFIG=
ECHO JTSDK_CONFIG Set To ^( %JTSDK_CONFIG% ^)

exit /b 0