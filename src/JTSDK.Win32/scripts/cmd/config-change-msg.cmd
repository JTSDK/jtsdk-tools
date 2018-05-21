::-----------------------------------------------------------------------------::
:: Name .........: config-change-msg.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Messages for Configuraiton changes
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call config-change-msg.cmd %1
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Cmake Versoin Change
if %1==cmake (
    SET opt="Cmake"
    GOTO CMAKE_CHANGE
)

:: Enable | Disable Unix Tools
if %1==unix (
    SET opt=Unix Tools
    GOTO UNIX_CHANGE
)

:: QT Tool Chain Change
if [%1]==["qt"] (
    SET opt="QT Tools"
    GOTO QT_CHANGE
)
GOTO EOF

:UNIX_CHANGE
CLS
ECHO --------------------------------------------
ECHO  Configuration Change for ^( %opt% ^)
ECHO --------------------------------------------
ECHO.
ECHO  Changing this configuraiton option requires
ECHO  restating the JTSDK Environment before the
ECHO  change can take affect.
ECHO.
GOTO EOF

:CMAKE_CHANGE
CLS
ECHO.
ECHO --------------------------------------------
ECHO  Configuration Change for ^( %opt% ^)
ECHO --------------------------------------------
ECHO.
ECHO  Changing Cmake version requires restarting
ECHO  the JTSDK Environment before the the change
ECHO  can take affect.
ECHO.
GOTO EOF

:QT_CHANGE
CLS
ECHO.
ECHO -----------------------------------------------
ECHO  Configuration Change for ^( %opt% ^)
ECHO -----------------------------------------------
ECHO.
ECHO  Changing the QT Tool Chain requires restarting
ECHO  the JTSDK Environment before the the change
ECHO  can take affect.
ECHO.
GOTO EOF

:EOF
EXIT /b 0
