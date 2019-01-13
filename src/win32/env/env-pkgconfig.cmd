::-----------------------------------------------------------------------------::
:: Name .........: env-pkgconfig.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for GNU Package Config
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-pkgconfig.cmd
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
SET pkgconfigv=0.28.1

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET pkgconfig_debug=0
) ELSE (
    SET pkgconfig_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_PKGCONFIG_PATH

:SET_PKGCONFIG_PATH
SET pkgconfig_dir=%JTSDK_HOME%\tools\pkgconfig\%pkgconfigv%\bin
SET "pkgconfig_dir_f=%pkgconfig_dir:\=/%"
GOTO EOF

:EOF
IF %pkgconfig_debug%==1 (
    ECHO.
    ECHO GNU Pkg Config Informaiton
    ECHO Path ..........: %pkgconfig_dir%
    ECHO Forward Path ..: %pkgconfig_dir:\=/%
    ECHO.
   %pkgconfig_dir%\pkg-config --version
)

exit /b 0