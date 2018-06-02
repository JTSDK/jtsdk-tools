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
:: License ......: GPL-3
::
:: env-pgit.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-pgit.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
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