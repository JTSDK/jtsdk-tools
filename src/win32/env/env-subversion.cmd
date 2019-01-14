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
:: License ......: GPL-3
::
:: env-subversion.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-subversion.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
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