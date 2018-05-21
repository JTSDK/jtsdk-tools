::-----------------------------------------------------------------------------::
:: Name .........: check-home.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Check if %JTSDK_HOME% exists
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call check-home.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::

:: Returns ERRORLEVEL=1 is %JTSDK_HOME% does not exist
@ECHO OFF

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET home_debug=0
) ELSE (
    SET home_debug=1
)

IF [%JTSDK_HOME%]==[] (
    ECHO.
    ECHO JTSDK_HOME Variable was not found.
    ECHO Ensure you are running from the JTSDK Tools Environment
    exit /b 1
)
GOTO EOF

:EOF
IF %home_debug%==1 (
    echo.
    ECHO Debug For JTSDK_HOME Path
    ECHO Path ..........: %JTSDK_HOME%
)
exit /b 0