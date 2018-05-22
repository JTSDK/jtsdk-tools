::-----------------------------------------------------------------------------::
:: Name .........: unset-jtsdk-data.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JTSDK_DATA
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call unset-jtsdk-data.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

CLS

:: Usets the JTSDK_DATA Variable for testing purposes
ECHO Unsetting JTSDK_DATA for testing purposes.
SET JTSDK_DATA=
ECHO JTSDK_DATA Set To ^( %JTSDK_DATA% ^)

exit /b 0