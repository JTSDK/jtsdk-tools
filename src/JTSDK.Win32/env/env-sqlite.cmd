::-----------------------------------------------------------------------------::
:: Name .........: env-sqlite.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Sqlite
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-sqlite.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET sqlite3v=3230100

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET sqlite3_debug=0
) ELSE (
    SET sqlite3_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_SQLITE_PATH

:SET_SQLITE_PATH
SET sqlite3_dir=%JTSDK_HOME%\tools\sqlite3\%sqlite3v%
SET "sqlite3_dir_f=%sqlite3_dir:\=/%"
GOTO EOF

:EOF
IF %sqlite3_debug%==1 (
    ECHO.
    ECHO SQlite3 Version Informaiton
    ECHO Path ..........: %sqlite3_dir%
    ECHO Path Forward ..: %sqlite3_dir_f%
    ECHO.
    %sqlite3_dir%\sqlite3 --version
)

exit /b 0