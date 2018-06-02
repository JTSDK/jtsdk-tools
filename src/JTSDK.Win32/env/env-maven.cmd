::-----------------------------------------------------------------------------::
:: Name .........: env-maven.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Maven
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-maven.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-maven.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-maven.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET mavenv=3.5.3

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET maven_debug=0
) ELSE (
    SET maven_debug=1
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
GOTO SET_MAVEN_PATH

:SET_MAVEN_PATH
:: Note, to add Maven to Path, use %MAVEN_HOME%\bin
SET MAVEN_HOME=%JTSDK_HOME%\tools\madven\%mavenv%
SET M2_HOME=%JTSDK_HOME%\tools\maven\%mavenv%
GOTO EOF

:EOF
IF %maven_debug%==1 (
    CLS
    ECHO.
    ECHO Maven Version Informaiton
    ECHO MAVEN_HOME ....: %MAVEN_HOME%
    ECHO M2_HOME .......: %M2_HOME%
    ECHO BIN Directory .: %M2_HOME%\bin
    ECHO.
    ECHO ------------------------------------------------------------
    ECHO Maven %mavenv%
    ECHO ------------------------------------------------------------
    ECHO.
    %M2_HOME%\bin\mvn --version
)

exit /b 0