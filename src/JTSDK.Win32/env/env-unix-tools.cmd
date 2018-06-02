::-----------------------------------------------------------------------------::
:: Name .........: env-unix-tools.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for MSYS2 Unix Tools
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-unix-tools.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-unix-tools.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-unix-tools.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET scriptd=%JTSDK_HOME%\scripts\cmd

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET unix_debug=0
) ELSE (
    SET unix_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_UNIX_TOOLS

::------------------------------------------------------------------------------
:: PATH for MSYS2 Unix Tools
::------------------------------------------------------------------------------
:SET_UNIX_TOOLS
SET unix_dir=%JTSDK_HOME%\tools\msys2\usr\bin
GOTO SET_DOSKEY

:SET_DOSKEY
::------------------------------------------------------------------------------
:: DOSKEY (ENABLE | DISABLE) FEATURES
:: Note: This is now handled by JTSDK.NetCore.Options program
::------------------------------------------------------------------------------
:: DOSKEY enable-unix = copy /y nul %JTSDK_CONFIG%\unixtools >nul 2>&1 $T call %scriptd%\config-change-msg unix
:: DOSKEY disable-unix = del /Q %JTSDK_CONFIG%\unixtools >nul 2>&1 $T call %scriptd%\config-change-msg unix
GOTO EOF

:EOF
IF %unix_debug%==1 (
    ECHO.
    ECHO MSYS2 Unix Tools Path
    ECHO Path ..........: %unix_dir%
    ECHO.
)