::-----------------------------------------------------------------------------::
:: Name .........: unset-java-home.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JAVA_HOME
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call unset-java-home.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

CLS

:: Usets the JAVA_HOME Variable for testing purposes
ECHO Unsetting JAVA_HOME for testing purposes.
SET JAVA_HOME=
ECHO JAVA_HOME Set To ^( %JAVA_HOME% ^)

exit /b 0