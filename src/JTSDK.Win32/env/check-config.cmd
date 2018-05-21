::-----------------------------------------------------------------------------::
:: Name .........: check-config.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Check if %JTSDK_CONFIG% exists
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call config-check.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Example script variables
SET config_script=set-jtsdk-config.cmd
SET example_path=%CD%\JTSDK-Tools\env\%config_script%

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET config_debug=0
) ELSE (
    SET config_debug=1
)

:: Returns ERRORLEVEL=1 is %JTSDK_CONFIG% does not exist
IF [%JTSDK_CONFIG%]==[] (
    ECHO.
    ECHO JTSDK_CONFIG variable was not found.
    ECHO Ensure you are running from the JTSDK Tools Environment
    ECHO.
    ECHO For testing purposes, you can use ^: ^( %config_script ^)
    ECHO Script Location ^: %example_path%
    ECHO.
    exit /b 1
)
GOTO EOF

:EOF
IF %config_debug%==1 (
    ECHO Debug For JTSDK_CONFIG Path
    ECHO Path ..........: %JTSDK_CONFIG%
)
exit /b 0