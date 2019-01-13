::-----------------------------------------------------------------------------::
:: Name .........: env-ant.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Gradle
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-gradle.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-gradle.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-gradle.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET gradlev=4.9

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET ant_debug=0
) ELSE (
    SET ant_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JAVA_HOME variable is not set, exit without setting path
call check-java.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_GRADLE_PATH

:SET_GRADLE_PATH
:: Note, to add Gradle to the Path, use : %GRADLE_HOME%\bin
SET GRADLE_HOME=%JTSDK_HOME%\tools\ant\%antv%
GOTO EOF

:EOF
IF %gradle_debug%==1 (
    CLS
    ECHO.
    ECHO Ant Version Informaiton
    ECHO ANT_HOME .......: %ANT_HOME%
    ECHO BIN Directory ..: %ANT_HOME%\bin
    %GRADLE_HOME%\bin\ant -version
)

exit /b 0