@ECHO OFF
REM  ---------------------------------------------------------------------------
REM  Name .........: build-wsjtx-git.cmd
REM  Project ......: This script is used with JTSDK v3 Tool Chain
REM  Description ..: Build script for WSJTX Git Repositories
REM  Project URL ..: https://github.com/KI7MT/jtsdk-dotnet-core
REM
REM  Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
REM  Copyright ....: Copyright (C) 2018, Greg Beam KI7MT
REM  License ......: GPL-3
REM
REM  build-wsjtx-git.cmd is free software: you can redistribute it and/or
REM  modify it under the terms of the GNU General Public License as published
REM  by the Free Software Foundation either version 3 of the License, or
REM  (at your option) any later version.
REM
REM  build-wsjtx-git.cmd is distributed in the hope that it will be useful,
REM  but WITHOUT ANY WARRANTY; without even the implied warranty of
REM  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
REM  Public License for more details.
REM
REM  You should have received a copy of the GNU General Public License
REM  along with this program.  If not, see <http://www.gnu.org/licenses/>.
REM ----------------------------------------------------------------------------
CLS

:: Set Source and Destination Directories
cat %JTSDK_HOME%\tmp\default.txt |grep "SRCD" |awk "{print $2}" >s.d & SET /p srcd=<s.d & rm s.d
cat %JTSDK_HOME%\tmp\default.txt |grep "DEST" |awk "{print $2}" >d.d & SET /p dest=<d.d & rm d.d

:: option parameters
SET qt59=No
SET clean=No
SET reconfigure=No
SET autorun=No
SET JJ=%NUMBER_OF_PROCESSORS%

:: null out some process variables
SET folder=
SET branch=
GOTO CHECK-OPTIONS

:CHECK-OPTIONS
IF EXIST %config%\qt59 ( 
SET tchain=%JTSDK_HOME%/tools/tc-files/QT59.cmake
) ELSE (
SET tchain=%JTSDK_HOME%/tools/tc-files/QT55.cmake
)
IF EXIST %cfgd%\qt59 (
SET qt59=Yes
SET qtv=qt59
) ELSE (
SET qtv=qt55
)
IF EXIST %cfgd%\clean (
SET clean=Yes
)
IF EXIST %cfgd%\reconfigure (
SET reconfigure=Yes
)
IF EXIST %cfgd%\autorun.txt (
SET autorun=Yes
)
GOTO START

:START
IF /I [%1]==[-o] (
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

:SETUP-DIRS
ECHO.
ECHO --------------------------------------------
ECHO  Folder Locations
ECHO --------------------------------------------
ECHO.
SET buildd=%dest%\%qtv%\%aver%\%copt%\build
SET installd=%dest%\%qtv%\%aver%\%copt%\install
SET pkgd=%dest%\%folder%\%qtv%\%aver%\%copt%\package
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
ECHO  Clean .........^: %clean%
ECHO  Reconfigure ...^: %reconfigure%
ECHO.
GOTO BUILD-SELECT

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
IF /I [%clean%]==[Yes] (
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
IF /I [%clean%]==[Yes] (
mingw32-make -f Makefile clean >NUL 2>&1
)
ECHO.
cmake --build . --target %topt% -- -j %JJ%
IF ERRORLEVEL 1 ( GOTO ERROR-CMAKE )
IF /I [%copt%]==[Debug] ( GOTO IT3 )
GOTO FINISH-INSTALL

:: DEBUG MAKE BATCH FILE
:IT3
ECHO -- Generating Debug Batch File
CD /D %installd%\bin
IF EXIST wsjtx.cmd (
DEL /Q wsjtx.cmd
)
>wsjtx.cmd (
ECHO @ECHO OFF
ECHO REM -- Debug Batch File
ECHO REM -- Part of the JTSDK v3.0 Project
ECHO SETLOCAL
ECHO TITLE WSJT-X Debug Terminal
ECHO SET PATH=.;.\data;.\doc;%fftw3f_dir%;%GCCD%;%QTD%;%QTP%;%%JTSDK_HOME%\tools\hamlib\%QTV%\bin%
ECHO CALL wsjtx.exe
ECHO CD /D %dest%
ECHO ENDLOCAL
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
IF /I [%clean%]==[Yes] (
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
ECHO   Clean .........^: %clean%
ECHO   Reconfigure ...^: %reconfigure%
ECHO   SRC ...........^: %srcd%
ECHO   Build .........^: %buildd%
ECHO   Install .......^: %installd%
ECHO.
GOTO FRUN

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
ECHO   Clean .......^: %clean%
ECHO   Reconfigure .^: %reconfigure%
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
ECHO   Clean .......^: %clean%
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
:HELP-OPTIONS
CLS
ECHO --------------------------------------------
ECHO  WSJT-X DEFAULT BUILD COMMANDS
ECHO --------------------------------------------
ECHO.
ECHO  Usage .....^: build-wsjtx-git ^[ OPTION ^]
ECHO  Example....^: build-wsjtx-git rinstall
ECHO.
ECHO  OPTIONS:
ECHO     rconfig    WSJTX Release, Config Only
ECHO     dconfig    WSJTX Debug, Config Only
ECHO     rinstall   WSJTX Release, Install
ECHO     dinstall   WSJTX Debug, Install
ECHO     package    WSJTX Release, Package
ECHO     docs       WSJTX Release, User Guide
ECHO.
ECHO  ^* To Display this message, type .....^:  build-wsjtx ^-h
ECHO  ^* To List available tags, type ......^:  git tag ^-l
ECHO  ^* To List available branches, type ..^:  git branch
ECHO  ^* Return to Main Menu, Type .........^:  main-menu 
ECHO.
GOTO EOF

:OPTION-STATUS
CALL %scr%\help\jtsdk-help.cmd listoptions
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
ECHO  re-build ^( wsjtx %desc% %copt% %topt% ^)
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

:MISSING-LIST
CLS
ECHO --------------------------------------------
ECHO  Missing [ %missing% ]
ECHO --------------------------------------------
ECHO.
ECHO  ^[ %missing% ^] is either missing or could
ECHO  not be opened.
ECHO.
ECHO  To correct this, run the following command^:
ECHO.
ECHO  wsjtx-list ^-u
ECHO.
ECHO  If the problem presists after updating,
ECHO  contact the development list.
ECHO.
GOTO EOF

:MISSING-OPTIONS
CLS
ECHO --------------------------------------------
ECHO  MISSING COMMAND LINE OPTION
ECHO --------------------------------------------
ECHO.
ECHO  Option Count Error ^- ^[ %argcount% ^]
ECHO.
ECHO  The WSJTX build script requires at least ^[ 1 ^]
ECHO  argument for defualt builds and ^[ 8 ^] for
ECHO  custom command line builds, you supplied ^[ %argcount% ^]
ECHO.
ECHO  Press any key to display the help message ... 
ECHO.
PAUSE>NUL
GOTO HELP-OPTIONS

:CLI-INVALID-OPTION
ECHO.
ECHO  Invalid Option ^- ^[ %1 %2 ^]
ECHO.
ECHO  Please correct the command line options
ECHO  and try again.
ECHO.
ECHO  Press any key to display the help message ... 
PAUSE>NUL
GOTO HELP-OPTIONS

REM  ***************************************************************************
REM  END QTENV-BUILD-WSJTX.CMD
REM  ***************************************************************************
:EOF
popd

EXIT /B 0
