::-----------------------------------------------------------------------------::
:: Name .........: jtsdk-main-env.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Environment Test Script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: jtsdk-main-env.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: jtsdk-main-env.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET LANG=en_US

:: Set Supported Versions
SET asciidocv=8.6.9
SET fftwv=3.3.5
SET innov=5.5.9
SET libusbv=1.0.22
SET nsisv=3.03
SET pkgconfigv=0.28.1
SET rubyv=2.4.4-1
SET svnv=1.9.7

:: JTSDK Version
SET /P version=<ver.jtsdk

:: set the header informaiton
TITLE JTSDK Tools Full Environment

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
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
mkdir %JTSDK_HOME%\tmp >NUL 2>&1
mkdir %JTSDK_HOME%\tools\hamlib >NUL 2>&1

::------------------------------------------------------------------------------
:: SET COMMON APPLICATION PATHS
::------------------------------------------------------------------------------

:: ASCIIDOC --------------------------------------------------------------------
IF EXIST %JTSDK_HOME%\tools\asciidoc\%asciidocv%\asciidoc.py (
    SET asciidoc_dir=%JTSDK_HOME%\tools\asciidoc\%asciidocv%
    SET "asciidoc_dir_f=%asciidoc_dir:\=/%"
    SET JTSDK_PATH=%asciidoc_dir%
)

:: FFTW ------------------------------------------------------------------------
SET fftw3f_dir=%JTSDK_HOME%\tools\fftw\%fftwv%
SET "fftw3f_dir_f=%fftw3f_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%fftw3f_dir%

:: INNO ------------------------------------------------------------------------
SET inno_dir=%JTSDK_HOME%\tools\inno\%innov%
SET "inno_dir_f=%inno_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%inno_dir%

:: LIBUSB ----------------------------------------------------------------------
IF EXIST %JTSDK_HOME%\tools\libusb\%libusbv%\libusb-1.0.def (
    SET libusb_dir=%JTSDK_HOME%\tools\libusb\%libusbv%
    SET "libusb_dir_f=%libusb_dir:\=/%"
    SET JTSDK_PATH=%JTSDK_PATH%;%linusb_dir%
)

:: NSIS ------------------------------------------------------------------------
SET nsis_dir=%JTSDK_HOME%\tools\nsis\%nsisv%
SET "nsis_dir_f=%nsis_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%nsis_dir%

:: PKG_CONFIG ------------------------------------------------------------------
SET pkgconfig_dir=%JTSDK_HOME%\tools\pkgconfig\%pkgconfigv%\bin
SET "pkgconfig_dir_f=%pkgconfig_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%pkgconfig_dir%

:: RUBY ------------------------------------------------------------------------
SET ruby_dir=%JTSDK_HOME%\tools\ruby\%rubyv%\bin
SET "ruby_dir_f=%ruby_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%ruby_dir%

:: SVN- ------------------------------------------------------------------------
SET svn_dir=%JTSDK_HOME%\tools\subversion\%svnv%\bin
SET "svn_dir_f=%svn_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%svn_dir%

:: UNIX TOOLS ------------------------------------------------------------------
SET unix_dir=%JTSDK_HOME%\tools\msys2\usr\bin
SET JTSDK_PATH=%JTSDK_PATH%;%unix_dir%


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
SET JTSDK_PATH=%JTSDK_PATH%;%cmake_dir%

::------------------------------------------------------------------------------
:: CONDITIONAL PATHS for Multiple versions of Qt
::------------------------------------------------------------------------------
IF EXIST "%JTSDK_CONFIG%\QT59" (
SET QTV=5.9.5
SET PROMPT=$C QT 5.9 $F $P$F
SET title-string=JTSDK QT 5.9 Development Environment
SET QTD=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw530_32\bin
) ELSE (
set QTV=5.5
SET PROMPT=$C QT 5.5 $F $P$F
SET title-string=JTSDK QT 5.5 Development Environment
SET QTD=%JTSDK_HOME%\tools\Qt\5.5\mingw492_32\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.5\mingw492_32\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw492_32\bin
)
SET JTSDK_PATH=%GCCD%;%QTD%;%QTP%;%JTSDK_PATH%

:: Set forward slash paths for MSYS2 and QT
SET "QTD_F=%QTD:\=/%"
SET "GCCD_F=%GCCD:\=/%"

::------------------------------------------------------------------------------
:: SET FINAL ENVIRONMENT PATHS and CONSOLE TITLE
::------------------------------------------------------------------------------
TITLE %title-string%
SET PATH=%JTSDK_PATH%;%PATH%

::------------------------------------------------------------------------------
:: DOSKEY for JTSDK.NectCore
::------------------------------------------------------------------------------
DOSKEY config = dotnet %JTSDK_APPS%\Jtsdk.Core.Options.dll $*

::------------------------------------------------------------------------------
:: DOSKEY -for Generating QT Tool Chain Files
::------------------------------------------------------------------------------
DOSKEY gen-tc = PUSHD %JTSDK_HOME%\scripts\cmd\utils $T call qt-gen-tc.cmd $T POPD

::------------------------------------------------------------------------------
:: DOSKEY for MSYS2 related using Ruby ridk
::------------------------------------------------------------------------------
:: DOSKEY update-msys2 = cls $T ridk exec pacman -Syuu
:: DOSKEY search-msys2 = ridk exec pacman -Ss $*
DOSKEY msys2 = call %JTSDK_HOME%\tools\msys2\msys2_shell.cmd
DOSKEY build-hamlib3 = start /wait ridk exec bash msys-build-hamlib3.sh

::------------------------------------------------------------------------------
:: DOSKEY GENERAL PURPOSE
::------------------------------------------------------------------------------
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY home = CD %JTSDK_HOME%
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b

::------------------------------------------------------------------------------
:: AUTO GENERATE QT Tool Chain Files
::------------------------------------------------------------------------------
call %JTSDK_HOME%\scripts\cmd\utils\qt-gen-tc.cmd >NUL 2>&1

::------------------------------------------------------------------------------
:: PRINT ENVIRONMENT MSG
::------------------------------------------------------------------------------
:ENV_MSG
CD /D %JTSDK_HOME%
CLS
ECHO ^*^*^*^* Gathering Environment Information, Please Wait ^*^*^*^*
SETLOCAL

qmake.exe --version |awk "FNR==1 {print $3}" >q.m & set /p QMV=<q.m & rm q.m
g++.exe --version |grep Built |awk "{print $7}" >g.v & set /p CVER=<g.v & rm g.v
mingw32-make --version |grep Make |awk "{print $3}" >g.v & set /p GNMK=<g.v & rm g.v
asciidoctor --version |grep "asciidoctor" |awk "{print $2}" >a.v & set /p ADV=<a.v & rm a.v
cmake --version |awk "{print $3}" >c.m & set /p CMV=<c.m & rm c.m
makensis.exe /VERSION  |tr -d "v" >n.m & set /p NSM=<n.m & rm n.m
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
ECHO    Git            : %GITV%
ECHO    InnoSetup      : %innov%
ECHO    DotNet Core    : %DOTV%
ECHO    NSIS           : %NSM%
ECHO    Pkg Config     : %PKG%
ECHO    Subversion     : %SVNV%
ECHO.
ECHO. MSYS2 Environment
ECHO    Bash           : %BENV%
ECHO.
ENDLOCAL 

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K