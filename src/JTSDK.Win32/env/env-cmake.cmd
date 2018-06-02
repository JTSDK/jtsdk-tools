::-----------------------------------------------------------------------------::
:: Name .........: env-cmake.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Cmake
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-cmake.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-cmake.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-cmake.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET cmake_debug=0
) ELSE (
    SET cmake_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_CMAKE_PATH

::------------------------------------------------------------------------------
:: CONDITIONAL PATHS for Multiple versions of Cmake
::------------------------------------------------------------------------------
:SET_CMAKE_PATH
SET cmake_dir=

IF EXIST "%JTSDK_CONFIG%\cmake311" (
SET cmakev=3.11.2
) ELSE (
SET cmakev=3.5.2
)
SET cmake_dir=%JTSDK_HOME%\tools\cmake\%cmakev%\Bin
SET "cmake_dir_f=%cmake_dir:\=/%"
GOTO SET_DOSKEY

:SET_DOSKEY
::------------------------------------------------------------------------------
:: DOSKEY (ENABLE | DISABLE) FEATURES
:: Note: This is now handled by JTSDK.NetCore.Options program
::------------------------------------------------------------------------------
::DOSKEY enable-cmake311 = touch %JTSDK_CONFIG%\cmake311
::DOSKEY disable-cmake311 = rm -f %JTSDK_CONFIG%\cmake311
GOTO EOF

:EOF
IF %cmake_debug%==1 (
    ECHO.
    ECHO Camake Version Informaiton
    ECHO Path ..........: %cmake_dir%
    ECHO Forward Path ..: %cmake_dir:\=/%
    ECHO.
    %cmake_dir%\cmake --version
)

exit /b 0