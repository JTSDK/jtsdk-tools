::-----------------------------------------------------------------------------::
:: Name .........: set-java-home.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Debug Variavles for JAVA_HOME
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call set-java-home.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

CLS
:: NOTE: This is the default installation path for x86_64 bit Java from Oracle
:: It gets dynamically updated by the Java Update facilities, so this path
:: may chabge based on the _revion variable in the path.
ECHO Setting JAVA_HOME for testing purposes.
SET JAVA_HOME="C:\PROGRA~2\Java\jdk1.8.0_172"
ECHO JAVA_HOME Set To ^( %JAVA_HOME% ^)

exit /b 0