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
:: License ......: GPLv3
::
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