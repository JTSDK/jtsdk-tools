::-----------------------------------------------------------------------------::
:: Name .........: env-nsis.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Null Soft Installer
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-nsis.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET nsisv=3.03

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET nsis_debug=0
) ELSE (
    SET nsis_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_NSIS_PATH

:SET_NSIS_PATH
SET nsis_dir=%JTSDK_HOME%\tools\nsis\%nsisv%
SET "nsis_dir_f=%nsis_dir:\=/%"
GOTO EOF

:EOF
IF %nsis_debug%==1 (
    ECHO.
    ECHO NSIS Setup Version Informaiton
    ECHO Path ..........: %nsis_dir%
    ECHO Forward Path ..: %nsis_dir:\=/%
    ECHO.
    %nsis_dir%\makensis.exe ^/VERSION
    ECHO.
)

exit /b 0