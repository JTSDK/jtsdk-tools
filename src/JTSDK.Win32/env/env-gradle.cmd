::-----------------------------------------------------------------------------::
:: Name .........: env-gradle.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Gradle
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-gradle.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET gradlev=4.7

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET gradle_debug=0
) ELSE (
    SET gradle_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JAVA_HOME variable is not set, exit without setting path
call check-java.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_GRADLE_PATH

:SET_GRADLE_PATH
:: Note, to add Gradle to the Path, use : %GRADLE_HOME%\bin
SET GRADLE_HOME=%JTSDK_HOME%\tools\gradle\%gradlev%
GOTO EOF

:EOF
IF %gradle_debug%==1 (
    CLS
    ECHO.
    ECHO Grdle Version Informaiton
    ECHO GRADLE_HOME ....: %GRADLE_HOME%
    ECHO BIN Directory ..: %GRADLE_HOME%\bin
    %GRADLE_HOME%\bin\gradle -v
)

exit /b 0