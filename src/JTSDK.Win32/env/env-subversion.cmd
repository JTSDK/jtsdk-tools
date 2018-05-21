::-----------------------------------------------------------------------------::
:: Name .........: env-subversion.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for subversion
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-subversion.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET svnv=1.9.7

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET subversion_debug=0
) ELSE (
    SET subversion_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_SUBVERSION_PATH

:SET_SUBVERSION_PATH
SET svn_dir=
SET svn_dir=%JTSDK_HOME%\tools\subversion\%svnv%\bin
SET "svn_dir_f=%svn_dir:\=/%"
GOTO EOF

:EOF
IF %subversion_debug%==1 (
    ECHO.
    ECHO Subversion Version Informaiton
    ECHO Path ..........: %svn_dir%
    ECHO Path Forward ..: %svn_dir_f%
    ECHO.    
    %svn_dir%\svn --version
)

exit /b 0