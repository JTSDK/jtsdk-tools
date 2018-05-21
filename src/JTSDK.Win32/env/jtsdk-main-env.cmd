::-----------------------------------------------------------------------------::
:: Name .........: JTSDKENV.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Environment Test Script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF
SET LANG=en_US

:: JTSDK Version
SET version=3.0.0-7-beta

SET docfxv=2.35.4.0
SET dotnetsdkv=2.1.200

:: set the header informaiton
TITLE JTSDK Tools Full Environment

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES
::------------------------------------------------------------------------------
SET JTSDK_HOME=%CD%
SET JTSDK_CONFIG=%LOCALAPPDATA%\JTSDK\config
SET JTSDK_DATA=%LOCALAPPDATA%\JTSDK\data
SET JTSDK_APPS=%JTSDK_HOME%\tools\apps

::------------------------------------------------------------------------------
:: CREATE ESSENTIAL DIRECTORIES
::------------------------------------------------------------------------------

:: %LOCALAPPDATA% Folders 
mkdir %LOCALAPPDATA%\JTSDK >NUL 2>&1
mkdir %JTSDK_CONFIG% >NUL 2>&1
mkdir %JTSDK_DATA% >NUL 2>&1

:: JTSDK-Tools Root Folders
mkdir %JTSDK_APPS% >NUL 2>&1
mkdir %JTSDK_HOME%\src >NUL 2>&1
mkdir %JTSDK_HOME%\tools\hamlib >NUL 2>&1

::------------------------------------------------------------------------------
:: SET COMMON APPLICATION PATHS
::------------------------------------------------------------------------------

:: JTSDK.NetCore ---------------------------------------------------------------
SET jtsdk_core_dir=%JTSDK_HOME%\tools\JTSDK.NetCore
SET "jtsdk_core_f=%jtsdk_core:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%jtsdk_core_dir%

::------------------------------------------------------------------------------
:: DOT NET SDK RELATED PATHS
::------------------------------------------------------------------------------

:: DOT NET SDK------------------------------------------------------------------
SET dotnetsdk_dir=%JTSDK_HOME%\tools\dotnet
SET JTSDK_PATH=%JTSDK_PATH%;%dotnetsdk_dir%

:: DOT NET RUNTIME -------------------------------------------------------------
SET dotnet_dir=%JTSDK_HOME%\tools\dotnet\runtime\%dotnetv%
SET JTSDK_PATH=%JTSDK_PATH%;%dotnet_dir%

:: PYTHON ----------------------------------------------------------------------
IF EXIST "%JTSDK_CONFIG%\python3" (
SET pythonv=3.6.4
) ELSE (
SET pythonv=2.7.14
)
SET pyv=%JTSDK_HOME%\tools\python\%pythonv%
SET pyv_dir=%pyv%;%pyv%\Scripts;%pyv%\Lib;%pyv%\DLLs
SET "pyv_dir_f=%pyv_dir:\=/%"
SET JTSDK_PATH=%pyv_dir%;%JTSDK_PATH%

:: QT --------------------------------------------------------------------------
IF EXIST "%JTSDK_CONFIG%\QT59" (
SET QTV=5.9.5
SET PROMPT=$C QT 5.9 $F $P$F
SET title-string=JTSDK QT 5.9 Development Environment
set QTD=%JTSDK_HOME%\tools\qt\%QTV%\mingw53_32\bin
set QTP=%JTSDK_HOME%\tools\qt\%QTV%\mingw53_32\plugins\platforms
set GCCD=%JTSDK_HOME%\tools\qt\Tools\mingw530_32\bin
) ELSE (
set QTV=5.5
SET PROMPT=$C QT 5.5 $F $P$F
SET title-string=JTSDK QT 5.5 Development Environment
set QTD=%JTSDK_HOME%\tools\qt\%QTV%\mingw492_32\bin
set QTP=%JTSDK_HOME%\tools\qt\%QTV%\mingw492_32\plugins\platforms
set GCCD=%JTSDK_HOME%\tools\qt\Tools\mingw492_32\bin
)
SET JTSDK_PATH=%GCCD%;%QTD%;%QTP%;%JTSDK_PATH%

:: Set forward slash paths for MSYS2 and QT
set "QTD_F=%QTD:\=/%"
set "GCCD_F=%GCCD:\=/%"

::------------------------------------------------------------------------------
:: SET FINAL ENVIRONMENT PATHS and CONSOLE TITLE
::------------------------------------------------------------------------------
TITLE %title-string%
SET PATH=%JTSDK_PATH%;%WINDIR%\System32

::------------------------------------------------------------------------------
:: DOSKEY (ENABLE | DISABLE) FEATURES
::------------------------------------------------------------------------------
DOSKEY enable-qt59 = touch %JTSDK_CONFIG%\qt59
DOSKEY disable-qt59 = rm -f %JTSDK_CONFIG%\qt59

DOSKEY enable-cmake310 = touch %JTSDK_CONFIG%\cmake310
DOSKEY disable-cmake310 = rm -f %JTSDK_CONFIG%\cmake310

::------------------------------------------------------------------------------
:: DOSKEY for JTSDK.NectCore
::------------------------------------------------------------------------------
DOSKEY jtsdk-options = dotnet %jtsdk_core_dir%\Jtsdk.Core.Options.dll $*

::------------------------------------------------------------------------------
:: DOSKEY for MSYS2 related using Ruby ridk
::------------------------------------------------------------------------------
:: DOSKEY update-msys2 = cls $T ridk exec pacman -Syuu
:: DOSKEY search-msys2 = ridk exec pacman -Ss $*
DOSKEY build-hamlib3 = start /wait ridk exec bash msys-build-hamlib3.sh

::------------------------------------------------------------------------------
:: DOSKEY GENERAL PURPOSE
::------------------------------------------------------------------------------
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY home = CD %JTSDK_HOME%
DOSKEY enable-qt57 = touch %JTSDK_CONFIG%\qt57
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b
DOSKEY postinstall="%JTSDK_HOME%\tools\postinstall\pinstall.cmd"

::------------------------------------------------------------------------------
:: UNINSTALL COMMANDS
::------------------------------------------------------------------------------
DOSKEY uninstall-python2 = CD %JTSDK_HOME%\tools\third-party-setup $T call uninstall-python2.cmd
DOSKEY uninstall-python3 = CD %JTSDK_HOME%\tools\third-party-setup $T call uninstall-python3.cmd
DOSKEY uninstall-qt = %JTSDK_HOME%\tools\qt\MaintenanceTool.exe
DOSKEY uninstall-jtsdk = %JTSDK_HOME%\unins000.exe

::------------------------------------------------------------------------------
:: CHECK FIRST RUN
::------------------------------------------------------------------------------
if exist 1st-run.txt (
GOTO POSTINSTALL_MSG  
)
GOTO ENV_MSG

::------------------------------------------------------------------------------
:: POSTINSTALL 1st RUN
::------------------------------------------------------------------------------
:POSTINSTALL_MSG
CLS
ECHO.
ECHO --------------------------------------------
ECHO  Post Install Action Required
ECHO --------------------------------------------
ECHO.
ECHO  This appears to be the first time
ECHO  ^[ %0 ^] has been run.
ECHO.
ECHO  To fininsh the installation, type: postinstall
ECHO.
GOTO RUN

::------------------------------------------------------------------------------
:: PRIN ENVIRONMENT MSG
::------------------------------------------------------------------------------
:ENV_MSG
CD /D %JTSDK_HOME%
CLS
ECHO ^*^*^*^* Gathering Environment Information, Please Wait ^*^*^*^*
setlocal

qmake --version |awk "FNR==2 {print $4}" >q.m & set /p QMV=<q.m & rm q.m
g++.exe --version |grep Built |awk "{print $7}" >g.v & set /p CVER=<g.v & rm g.v
mingw32-make --version |grep Make |awk "{print $3}" >g.v & set /p GNMK=<g.v & rm g.v
asciidoctor --version |grep "asciidoctor" |awk "{print $2}" >a.v & set /p ADV=<a.v & rm a.v
cmake --version |awk "{print $3}" >c.m & set /p CMV=<c.m & rm c.m
makensis.exe /VERSION  >n.m & set /p NSM=<n.m & rm n.m
pkg-config --version >p.c & set /p PKG=<p.c & rm p.c
git --version |awk "{print $3}" >c.m & set /p GITV=<c.m & rm c.m
svn --version |awk "{print $3}" >c.m & set /p SVNV=<c.m & rm c.m
dotnet --version >d.n & set /p DOTV=<d.n & rm d.n
bash --version |awk "FNR==1 {print $4}" >b.v & set /p BENV=<b.v & rm b.v

CLS
ECHO --------------------------------------------
ECHO  %title-string%
ECHO --------------------------------------------
ECHO.
ECHO  JTSDK
ECHO    Version        : %version%
ECHO.
ECHO  QT Information
ECHO    Version        : %QTV%
ECHO    Qmake          : %QMV%
ECHO.
ECHO  GCC Tool Chain
ECHO    GCC            : %CVER%
ECHO    Mingw32 Make   : %GNMK%
ECHO.
ECHO  Misc Tools
ECHO    Asciidoctor    : %ADV%
ECHO    Cmake          : %CMV%
ECHO    Git Portable   : %GITV%
ECHO    InnoSetup      : %innov%
ECHO    DotNet Core    : %DOTV%
ECHO    NSIS           : %NSM%
ECHO    Pkg Config     : %PKG%
ECHO    Python         : %pythonv%
ECHO    Subversion     : %SVNV%
ECHO.
ECHO. MSYS2 Environment
ECHO    Bash           : %BENV%
ECHO.
endlocal 

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K