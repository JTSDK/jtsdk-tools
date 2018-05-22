::-----------------------------------------------------------------------------::
:: Name .........: env-pandoc.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Pandoc
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-pandoc.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET pandocv=2.2.1

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET pandoc_debug=0
) ELSE (
    SET pandoc_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_PANDOC_PATH

:SET_PANDOC_PATH
SET pandoc_dir=%JTSDK_HOME%\tools\pandoc\%pandocv%
GOTO EOF

:EOF
IF %pandoc_debug%==1 (
    CLS
    ECHO.
    ECHO Panndoc Version Informaiton
    ECHO Path ..........: %pandoc_dir%
    ECHO.
    %pandoc_dir%\pandoc --version
)

exit /b 0