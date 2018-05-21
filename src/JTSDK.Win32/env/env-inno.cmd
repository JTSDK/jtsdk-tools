::-----------------------------------------------------------------------------::
:: Name .........: env-inno.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Inno Setup
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-inno.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET innov=5.5.9

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET inno_debug=0
) ELSE (
    SET inno_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_inno_PATH

:SET_INNO_PATH
SET inno_dir=%JTSDK_HOME%\tools\inno\%innov%
SET "inno_dir_f=%inno_dir:\=/%"
GOTO EOF

:EOF
IF %inno_debug%==1 (
    ECHO.
    ECHO Inno Setup Version Informaiton
    ECHO Path ..........: %inno_dir%
    ECHO Forward Path ..: %inno_dir:\=/%
    ECHO.
    %inno_dir%\ISCC.exe ^/?
)

exit /b 0