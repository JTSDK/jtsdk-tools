::-----------------------------------------------------------------------------::
:: Name .........: build.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: JTSDK.NetCore Build script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: build [%1] wehre [%1] is clean or publish
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2018 Greg Beam, KI7MT
:: License ......: Apache 2.0
::
::-----------------------------------------------------------------------------::

:: Get Command line Options %1
IF /I [%1]==[clean] (
set message=Clean Build Tree
set action=clean
GOTO START
) ELSE IF /I [%1]==[publish] (
set message=Publish JTSDK.NetCore
set action=publish -o %JTSDK_HOME%\tools\JTSDK.NetCore
GOTO START
) ELSE ( GOTO HELP )

:START
ECHO.
ECHO ------------------------------
ECHO  %message%
ECHO ------------------------------
ECHO.
CD %CD%\src\JTSDK.NetCore
dotnet %action%
goto EOF

:HELP
ECHO.
ECHO ------------------------------
ECHO  JTSDK Build Help
ECHO ------------------------------
ECHO.
ECHO  The build script takes one option^:
ECHO.
ECHO    clean          :  clean the build tree
ECHO    publish        :  publishes the application
ECHO.
ECHO    Example: build clean
ECHO    Example: build publish
ECHO.
GOTO EOF

:EOF
ECHO.
CD %JTSDK_HOME%

exit /b 0