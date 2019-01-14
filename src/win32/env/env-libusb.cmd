::-----------------------------------------------------------------------------::
:: Name .........: env-libusb.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for Lib USB Linrary
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-libusb.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-libusb.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-libusb.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET libusbv=1.0.22

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET libusb_debug=0
) ELSE (
    SET libusb_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_LIBUSB_PATH

:SET_LIBUSB_PATH
SET libusb_dir=
SET libusb_dir_f=

IF EXIST %JTSDK_HOME%\tools\libusb\%libusbv%\libusb-1.0.def (
    SET libusb_dir=%JTSDK_HOME%\tools\libusb\%libusbv%
    SET "libusb_dir_f=%libusb_dir:\=/%"
)
GOTO EOF
:EOF
IF %libusb_debug%==1 (
    ECHO.
    ECHO Library Version ^( %libusbv% ^)
    ECHO Lib USB Library Informaiton
    ECHO Path ..........: %libusb_dir%
    ECHO Forward Path ..: %libusb_dir:\=/%
    ECHO.
)

exit /b 0