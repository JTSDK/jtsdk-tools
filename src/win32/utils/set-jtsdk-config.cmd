::-----------------------------------------------------------------------------::
:: Name .........: set-jtsdk-config.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JTSDK_CONFIG
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call set-jtsdk-config.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

CLS
:: This variable should not be changed. It should be standard for Win-10, 
:: Win-8, and Win-7
ECHO Setting JTSDK_CONFIG For Testing Purposes.
SET JTSDK_CONFIG=%LOCALAPPDATA%\JTSDK\config
ECHO JTSDK_CONFIG Set To ^( %JTSDK_CONFIG% ^)

exit /b 0