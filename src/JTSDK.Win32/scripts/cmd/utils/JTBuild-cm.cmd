@ECHO off
:: -----------------------------------------------------------------------------
:: Name ..............: JTBuild-cmd.cmd
:: Description .......: Test Build script for WSJT-X (limited functionality)
:: Author ............: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright .........: Copyright (C) 2018 Greg Beam, KI7MT
:: License ...........: GPL-3
::
:: JTBuild-cmd.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: JTBuild-cmd.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::

:: Used to prevent CMake errors with MinGW Makefiles
IF EXIST %JTSDK_HOME%\tools\msys2\usr\bin\sh.exe (
set sh_orig=%JTSDK_HOME%\tools\msys2\usr\bin\sh.exe
set sh_bak=%JTSDK_HOME%\tools\msys2\usr\bin\sh-bak.exe
ren %sh_orig% %sh_bak% >NUL 2>&1
)
GOTO DEFAULT_TEXT

:: generate build.txt file if not exist --------------------------------------
:DEFAULT_TEXT
IF NOT EXIST %JTSDK_HOME%\tmp\build.txt (

mkdir %JTSDK_HOME%\tmp >NUL 2>&1

>%JTSDK_HOME%\tmp\build.txt (
ECHO # This file is auto-generated by : %~n0.cmd
ECHO.
ECHO # For use with JTBuild-cmd only.
ECHO # - Only the paths needs to be changed, not the prefix
ECHO # - Do not use spaces in the paths as the build will fail
ECHO # - Ensure there is only one space between the prefix and path
ECHO.
ECHO # Edit the next line to set Source Location
ECHO SRCD %JTSDK_HOME%\tmp\wsjtx
ECHO.
ECHO # Edit the next line to set Destination Directory
ECHO DEST %JTSDK_HOME%\tmp\wsjtx-output
ECHO.
ECHO # END Default Text File
)
GOTO FIRST-RUN
)

:: Sets srcd => Source Location
:: Sets dest => Desctination Location
:: Sets cfgd => JTSDK_CONFIG location
:: Sets qtv => QTV
cat %JTSDK_HOME%\tmp\build.txt |grep "SRCD" |awk "{print $2}" >s.d & SET /p srcd=<s.d & rm s.d
cat %JTSDK_HOME%\tmp\build.txt |grep "DEST" |awk "{print $2}" >d.d & SET /p dest=<d.d & rm d.d
set cfdg=%JTSDK_CONFIG%
set qtv=%QTV%

:: option parameters -----------------------------------------------------------
SET qt59=No
SET clean-first=No
SET reconfigure=No
SET autorun=No
SET JJ=%NUMBER_OF_PROCESSORS%
GOTO CHECK-OPTIONS

:: Setup process variables -----------------------------------------------------
:CHECK-OPTIONS

:: QT CMake Tool Chain File Selection
IF EXIST %cfgd%\qt59 ( 
SET tchain=%JTSDK_HOME%/tools/tc-files/QT59.cmake
) ELSE (
SET tchain=%JTSDK_HOME%/tools/tc-files/QT55.cmake
)

:: clean-first parameter
IF EXIST %cfgd%\clean (
SET clean-first=Yes
)

:: reconfigure parameter
IF EXIST %cfgd%\reconfigure (
SET reconfigure=Yes
)

:: Autorun parameter
IF EXIST %cfgd%\autorun (
SET autorun=Yes
)
GOTO START

:: start main script -----------------------------------------------------------
:START
IF /I [%1]==[help] (
GOTO HELP-OPTIONS
) ELSE IF /I [%1]==[-h] (
GOTO HELP-OPTIONS
) ELSE IF /I [%1]==[-o] (
GOTO OPTION-STATUS
) ELSE IF /I [%1]==[rconfig] (
SET copt=Release
SET topt=config
GOTO GET-AVER
) ELSE IF /I [%1]==[dconfig] (
SET copt=Debug
SET topt=config
GOTO GET-AVER
) ELSE IF /I [%1]==[rinstall] (
SET copt=Release
SET topt=install
GOTO GET-AVER
) ELSE IF /I [%1]==[dinstall] (
SET copt=Debug
SET topt=install
GOTO GET-AVER
) ELSE IF /I [%1]==[package] (
SET copt=Release
SET topt=package
GOTO GET-AVER
) ELSE IF /I [%1]==[docs] (
SET copt=Release
SET topt=docs
GOTO GET-AVER
) ELSE ( GOTO EOF )
GOTO GET-AVER

:: Get the WSJT-X Version from Versions.cmake-----------------------------------
:GET-AVER
SET vfile="%srcd%\Versions.cmake"
cat %vfile% |grep "_MAJOR" |awk "{print $3}" | tr -d ")" >ma.v & SET /p mav=<ma.v & rm ma.v
cat %vfile% |grep "_MINOR" |awk "{print $3}" | tr -d ")" >mi.v & SET /p miv=<mi.v & rm mi.v
cat %vfile% |grep "_PATCH" |awk "{print $3}" | tr -d ")" >pa.v & SET /p pav=<pa.v & rm pa.v
cat %vfile% |grep "_RC" |awk "{print $3}" |tr -d ")" >rcx.v & SET /p rcx=<rcx.v & rm rcx.v
cat %vfile% |grep "_RELEASE" |awk "{print $3}" | tr -d ")" >rel.v & SET /p relx=<rel.v & rm rel.v

IF [%relx%]==[1] (
SET aver=%mav%.%miv%.%pav%
SET desc=GA Release
)

IF %rcx% GTR 0 (
IF [%relx%]==[1] (
SET aver=%mav%.%miv%.%pav%
SET desc=GA Release
)
)

IF [%rcx%]==[0] (
IF [%relx%]==[0] (
SET aver=%mav%.%miv%.%pav%
SET desc=devel
)
)

IF %rcx% GTR 0 (
IF [%relx%]==[0] (
SET aver=%mav%.%miv%.%pav%
SET desc=Release Candidate
)
)
GOTO SETUP-DIRS

:: setup directories -----------------------------------------------------------
:SETUP-DIRS
ECHO.
ECHO --------------------------------------------
ECHO  Folder Locations
ECHO --------------------------------------------
ECHO.
SET buildd=%dest%\%qtv%\%aver%\%copt%\build
SET installd=%dest%\%qtv%\%aver%\%copt%\install
SET pkgd=%dest%\%qtv%\%aver%\%copt%\package
mkdir %buildd% >NUL 2>&1
mkdir %installd% >NUL 2>&1
mkdir %pkgd% >NUL 2>&1
ECHO  Build .......^: %buildd%
ECHO  Install .....^: %installd%
ECHO  Package .....^: %pkgd%
ECHO.
GOTO START-MAIN

:START-MAIN
ECHO --------------------------------------------
ECHO  WSJT-X Build Information
ECHO --------------------------------------------
ECHO.
ECHO  Description ...^: %desc%
ECHO  Version .......^: %aver%
ECHO  Type ..........^: %copt%
ECHO  Target ........^: %topt%
ECHO  Tool Chain ....^: %qtv%
ECHO  SRC ...........^: %srcd%
ECHO  Build .........^: %buildd%
ECHO  Install .......^: %installd%
ECHO  Package .......^: %pkgd%
ECHO  TC File .......^: %tchain%
ECHO  Clean .........^: %clean-first%
ECHO  Reconfigure ...^: %reconfigure%
ECHO.
GOTO BUILD-SELECT

:: select build type ---------------------------------------------- BUILD SELECT
:BUILD-SELECT
IF /I [%topt%]==[config] ( GOTO CONFIG-ONLY )
IF /I [%topt%]==[install] ( GOTO INSTALL-TARGET )
IF /I [%topt%]==[package] ( GOTO PKG-TARGET )
IF /I [%topt%]==[docs] (
GOTO DOCS-TARGET
) ELSE (
GOTO UD-TARGET
)
GOTO EOF

REM  --------------------------------------------------------------- CONFIG-ONLY
:CONFIG-ONLY
CD /D %buildd%
ECHO.
ECHO --------------------------------------------
ECHO  WSJT-X Configuring Build Tree
ECHO --------------------------------------------
ECHO.
cmake -G "MinGW Makefiles" -Wno-dev -D CMAKE_TOOLCHAIN_FILE=%tchain% ^
-D CMAKE_COLOR_MAKEFILE=OFF ^
-D CMAKE_BUILD_TYPE=%copt% ^
-D CMAKE_INSTALL_PREFIX=%installd% %srcd%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
GOTO FINISH-CONFIG
GOTO EOF

REM  ---------------------------------------------------------------- USER GUIDE
:DOCS-TARGET
CD /D %buildd%
ECHO.
ECHO --------------------------------------------
ECHO  WSJT-X Building User Guide
ECHO --------------------------------------------
ECHO.
ECHO.
IF NOT EXIST Makefile ( GOTO DT1 )
IF /I [%reconfigure%]==[Yes] (
GOTO DT1
) ELSE (
GOTO DT2
)

:DT1
cmake -G "MinGW Makefiles" -Wno-dev -D CMAKE_TOOLCHAIN_FILE=%tchain% ^
-D CMAKE_BUILD_TYPE=%copt% ^
-D CMAKE_INSTALL_PREFIX=%installd% %srcd%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
GOTO DT2

:DT2
IF /I [%clean-first%]==[Yes] (
mingw32-make -f Makefile clean >NUL 2>&1
)
ECHO.
cmake --build . --target docs
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
DIR /B %buildd%\doc\*.html >d.n & SET /P docname=<d.n & rm d.n
GOTO FINISH-UG

REM  ------------------------------------------------------------ INSTALL-TARGET
:INSTALL-TARGET
CD /D %buildd%
ECHO.
ECHO --------------------------------------------
ECHO  WSJT-X Building Install Target
ECHO --------------------------------------------
ECHO.
IF NOT EXIST Makefile ( GOTO IT1 )
IF /I [%reconfigure%]==[Yes] (
GOTO IT1
) ELSE (
GOTO IT2
)

:IT1
cmake -G "MinGW Makefiles" -Wno-dev -D CMAKE_TOOLCHAIN_FILE=%tchain% ^
-D CMAKE_BUILD_TYPE=%copt% ^
-D CMAKE_COLOR_MAKEFILE=OFF ^
-D CMAKE_INSTALL_PREFIX=%installd% %srcd%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
GOTO IT2

:IT2
IF /I [%clean-first%]==[Yes] (
mingw32-make -f Makefile clean >NUL 2>&1
)
ECHO.
cmake --build . --target %topt% -- -j %JJ%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
IF /I [%copt%]==[Debug] ( GOTO IT3 )
GOTO FINISH-INSTALL

:: DEBUG MAKE BATCH FILE -------------------------------------- DEBUG BARCH FILE
:IT3
ECHO -- Generating Debug Batch File
CD /D %installd%\bin
IF EXIST wsjtx.cmd (
DEL /Q wsjtx.cmd
)
>wsjtx.cmd (
ECHO @ECHO OFF
ECHO REM -- Debug Batch File
ECHO REM -- Part of the JTSDK v2.0 Project
ECHO SETLOCAL
ECHO TITLE WSJT-X Debug Terminal
ECHO SET PATH=.;.\data;.\doc;%fft%;%gccd%;%qt5d%;%qt5a%;%qt5p%;%hl3%
ECHO CALL wsjtx.exe
ECHO CD /D %dest%
ECHO ENDLOCAL
ECHO COLOR 0B
ECHO EXIT /B 0
)
GOTO FINISH-INSTALL

REM  ------------------------------------------------------------------- PACKAGE
:PKG-TARGET
CD /D %buildd%
ECHO.
ECHO --------------------------------------------
ECHO  WSJT-X Building Win32 Installer
ECHO --------------------------------------------
ECHO.
IF NOT EXIST Makefile ( GOTO PT1 )
IF /I [%reconfigure%]==[Yes] (
GOTO PT1
) ELSE (
GOTO PT2
)

:PT1
cmake -G "MinGW Makefiles" -Wno-dev -D CMAKE_TOOLCHAIN_FILE=%tchain% ^
-D CMAKE_BUILD_TYPE=%copt% ^
-D CMAKE_INSTALL_PREFIX=%pkgd% %srcd%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
GOTO PT2

:PT2
IF /I [%clean-first%]==[Yes] (
mingw32-make -f Makefile clean >NUL 2>&1
)
ECHO.
cmake --build . --target %topt% -- -j %JJ%
IF ERRORLEVEL 1 ( GOTO NSIS-ERROR )
DIR /B %buildd%\*-win32.exe >p.k & SET /P wsjtxpkg=<p.k & rm p.k
ECHO Copying package to^: %pkgd%
COPY /Y %buildd%\%wsjtxpkg% %pkgd% > NUL
GOTO FINISH-PKG

REM  ***************************************************************************
REM   FINISH MESSAGES
REM  ***************************************************************************
:FINISH-INSTALL
ECHO.
ECHO --------------------------------------------
ECHO  WSJT-X Build Summary
ECHO --------------------------------------------
ECHO.
ECHO   Description ...^: %desc%
ECHO   Version .......^: %aver%
ECHO   Type ..........^: %copt%
ECHO   Target ........^: %topt%
ECHO   Tool Chain ....^: %qtv%
ECHO   Clean .........^: %clean-first%
ECHO   Reconfigure ...^: %reconfigure%
ECHO   SRC ...........^: %srcd%
ECHO   Build .........^: %buildd%
ECHO   Install .......^: %installd%
ECHO.
GOTO FRUN

:: AUTO RUN ----------------------------------------------------------- AUTO RUN
:FRUN
IF /I [%autorun%]==[Yes] (
ECHO   JTSDK Option^ ..: Autorun Enabled
ECHO   Starting ......: wsjtx %aver% r%sver% %desc% in %copt% mode
GOTO FRUN1
) ELSE (
GOTO EOF
)

:FRUN1
IF /I [%copt%]==[Debug] (
CD /D %installd%\bin
CALL wsjtx.cmd
GOTO EOF
) ELSE (
CALL wsjtx.exe
GOTO EOF
)
GOTO EOF

:: ----------------------------------------------------------- FINISH CONFIG MSG
:FINISH-CONFIG
ECHO.
ECHO --------------------------------------------
ECHO  Configure Summary
ECHO --------------------------------------------
ECHO.
ECHO   Description .^: %desc%
ECHO   Version .....^: %aver%
ECHO   Type ........^: %copt%
ECHO   Target ......^: %topt%
ECHO   Tool Chain ..^: %qtv%
ECHO   Clean .........^: %clean-first%
ECHO   Reconfigure ...^: %reconfigure%
ECHO   SRC .........^: %srcd%
ECHO   Build .......^: %buildd%
ECHO   Install .....^: %installd%
ECHO.
ECHO   Config Only builds simply configure the build tree with
ECHO   default options. To further configure or re-configure this build,
ECHO   run the following commands:
ECHO.
ECHO   cd %buildd%
ECHO   cmake-gui .
ECHO   Once the CMake-GUI opens, click on Generate, then Configure
ECHO.
ECHO   You now have have a fully configured build tree. If you make 
ECHO   changes be sure click on Generate and Configure again.
ECHO.
ECHO   To return to the main menu, type: main-menu
ECHO.
GOTO EOF

:: ------------------------------------------------------------- FINISHED UG MSG
:FINISH-UG
ECHO.
ECHO --------------------------------------------
ECHO  User Guide Summary
ECHO --------------------------------------------
ECHO.
ECHO   Name ........^: %docname%
ECHO   Version .....^: %aver%
ECHO   Type ........^: %copt%
ECHO   Target ......^: %topt%
ECHO   Tool Chain ..^: %qtv%
ECHO   SRC .........^: %srcd%
ECHO   Build .......^: %buildd%
ECHO   Location ....^: %buildd%\doc\%docname%
ECHO.
ECHO   The user guide does ^*not^* get installed like normal install
ECHO   builds, it remains in the build folder to aid in browser
ECHO   shortcuts for quicker refresh during development iterations. 
ECHO.
ECHO   The name ^[ %docname% ^] also remains constant rather
ECHO   than including the version infomation.
ECHO.
GOTO EOF

:: ---------------------------------------------------------- FINISH PACKAGE MSG
:FINISH-PKG
ECHO.
ECHO --------------------------------------------
ECHO  Win32 Installer Summary
ECHO --------------------------------------------
ECHO.
ECHO   Name ........^: %wsjtxpkg%
ECHO   Version .....^: %aver%
ECHO   Type ........^: %copt%
ECHO   Target ......^: %topt%
ECHO   Tool Chain ..^: %qtv%
ECHO   Clean .......^: %clean-first%
ECHO   Reconfigure .^: %reconfigure%
ECHO   SRC .........^: %srcd%
ECHO   Build .......^: %buildd%
ECHO   Location ....^: %pkgd%\%wsjtxpkg%
ECHO.
ECHO   To Install the package, browse to Location and
ECHO   run as you normally do to install Windows applications.
ECHO.
GOTO EOF

REM  ***************************************************************************
REM   HELP MESSAGES
REM  ***************************************************************************

:: ---------------------------------------------------------------- HELP OPTIONS
:HELP-OPTIONS
CLS
ECHO --------------------------------------------
ECHO  WSJT-X DEFAULT BUILD COMMANDS
ECHO --------------------------------------------
ECHO.
ECHO  Usage .....^: jtbuild-cmd ^[ OPTION ^]
ECHO  Example....^: jtbuild-cmd rinstall
ECHO.
ECHO  OPTIONS:
ECHO     rconfig    WSJTX Release, Config Only
ECHO     dconfig    WSJTX Debug, Config Only
ECHO     rinstall   WSJTX Release, Install
ECHO     dinstall   WSJTX Debug, Install
ECHO     package    WSJTX Release, Package
ECHO     docs       WSJTX Release, User Guide
ECHO.
ECHO  ^* To Display this message, type .....^: jtbuild-cmd ^-h
ECHO.
GOTO EOF

:: ----------------------------------------------------------- OPTION STATUS MSG
:OPTION-STATUS
dotnet %JTSDK_HOME%\tools\apps\JTConfig.dll -l
GOTO EOF

REM  ***************************************************************************
REM   ERROR MESSAGES
REM  ***************************************************************************
:ERROR-CMAKE
ECHO.
ECHO --------------------------------------------
ECHO  CMAKE BUILD ERROR
ECHO --------------------------------------------
ECHO.
ECHO  There was a problem building ^( %desc% ^)
ECHO.
ECHO  Check the screen for error messages, correct, then try to
ECHO  re-build ^( jtbuild-cmd %desc% %copt% %topt% ^)
ECHO.
ECHO.
GOTO EOF

:NSIS-ERROR
ECHO.
ECHO --------------------------------------------
ECHO  Win32 INSTALLER BUILD ERROR
ECHO --------------------------------------------
ECHO.
ECHO  There was a problem building the package, or the script
ECHO  could not find:
ECHO.
ECHO  %buildd%\%WSJTXPKG%
ECHO.
ECHO  Check the Cmake logs for any errors, or correct any build
ECHO  script issues that were obverved and try to rebuild the package.
ECHO.
GOTO EOF

:FIRST-RUN
ECHO.
ECHO --------------------------------------------
ECHO  First Run of JTBuild-cmd
ECHO --------------------------------------------
ECHO.
ECHO  A file named %JTSDK_HOME%\tmp\build.txt
ECHO  was auto-generates.
ECHO.
ECHO  Check this file to ensure SRCD and DEST
ECHO  value are set to the appropriate locations.
ECHO.
ECHO  If Need be, clone the WSJT-X repository from
ECHO  Sourceforge first, then set the location value
ECHO  as appropriate.
ECHO. 
ECHO  After verifying the build.txt file, re-run
ECHO  your commands.
ECHO.
GOTO EOF

REM  ***************************************************************************
REM  END QTENV-BUILD-WSJTX.CMD
REM  ***************************************************************************

:EOF
COLOR 0B
popd
IF EXIST %JTSDK_HOME%\tools\msys2\usr\bin\sh_bak.exe (
ren %sh_bak% %sh_orig% >NUL 2>&1
)

EXIT /B 0