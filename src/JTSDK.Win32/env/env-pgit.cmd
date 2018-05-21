::-----------------------------------------------------------------------------::
:: Name .........: env-pgit.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Portable Git
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-pgit.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET pgitv=2.17.0

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET pgit_debug=0
) ELSE (
    SET pgit_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_PGIT_PATH

:SET_PGIT_PATH
SET pgit_dir=%JTSDK_HOME%\tools\pgit\%pgitv%\cmd
SET "pgit_dir_f=%pgit_dir:\=/%"
GOTO EOF

:EOF
IF %pgit_debug%==1 (
    ECHO.
    ECHO Portable Git Version Informaiton
    ECHO Path ..........: %pgit_dir%
    ECHO Forward Path ..: %pgit_dir:\=/%
    ECHO.
    %pgit_dir%\git --version
)

exit /b 0