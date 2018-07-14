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
@chcp 1252
SET LANG=en_US

:: Set Supported Versions
SET asciidocv=8.6.9
SET docfxv=2.37
SET fftwv=3.3.5
SET gradlev=4.8.1
SET innov=5.5.9
SET libusbv=1.0.22
SET mavenv=3.5.4
SET nsisv=3.03
SET pandocv=2.2.1
SET pkgconfigv=0.28.1
SET rubyv=2.5.1-2
SET sqlite3v=3.24.0
SET svnv=1.9.7
SET psqlv=10

:: JTSDK Version
SET /P version=<ver.jtsdk

:: set the header informaiton
TITLE JTSDK Tools %version%

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

:: DOCFX -----------------------------------------------------------------------
SET docfx_dir=%JTSDK_HOME%\tools\docfx\%docfxv%
SET JTSDK_PATH=%JTSDK_PATH%;%docfx_dir%

:: FFTW ------------------------------------------------------------------------
SET fftw3f_dir=%JTSDK_HOME%\tools\fftw\%fftwv%
SET "fftw3f_dir_f=%fftw3f_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%fftw3f_dir%

:: GRADLE ----------------------------------------------------------------------
SET gradle_dir=%JTSDK_HOME%\tools\gradle\%gradlev%
SET JTSDK_PATH=%JTSDK_PATH%;%gradle_dir%\bin

:: INNO ------------------------------------------------------------------------
SET inno_dir=%JTSDK_HOME%\tools\inno\%innov%
SET "inno_dir_f=%inno_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%inno_dir%

:: LIBUSB ----------------------------------------------------------------------
SET libusb_dir=%JTSDK_HOME%\tools\libusb\%libusbv%
SET "libusb_dir_f=%libusb_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%linusb_dir%

:: MAVEN -----------------------------------------------------------------------
SET maven_dir=%JTSDK_HOME%\tools\maven\%mavenv%
SET JTSDK_PATH=%JTSDK_PATH%;%maven_dir%\bin

:: NSIS ------------------------------------------------------------------------
SET nsis_dir=%JTSDK_HOME%\tools\nsis\%nsisv%
SET "nsis_dir_f=%nsis_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%nsis_dir%

:: NUGET -----------------------------------------------------------------------
SET nuget_dir=%JTSDK_HOME%\tools\nuget
SET JTSDK_PATH=%JTSDK_PATH%;%nuget_dir%

:: PANDOC --------------------------------------------------------------------
SET pandoc_dir=%JTSDK_HOME%\tools\pandoc\%pandocv%
SET JTSDK_PATH=%JTSDK_PATH%;%pandoc_dir%

:: PKG_CONFIG ------------------------------------------------------------------
SET pkgconfig_dir=%JTSDK_HOME%\tools\pkgconfig\%pkgconfigv%\bin
SET "pkgconfig_dir_f=%pkgconfig_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%pkgconfig_dir%

:: RUBY ------------------------------------------------------------------------
SET ruby_dir=%JTSDK_HOME%\tools\ruby\%rubyv%\bin
SET "ruby_dir_f=%ruby_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%ruby_dir%

:: SQLITE ----------------------------------------------------------------------
SET sqlite3_dir=%JTSDK_HOME%\tools\sqlite3\%sqlite3v%
SET JTSDK_PATH=%JTSDK_PATH%;%sqlite3_dir%

:: SVN- ------------------------------------------------------------------------
SET svn_dir=%JTSDK_HOME%\tools\subversion\%svnv%\bin
SET "svn_dir_f=%svn_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%svn_dir%

:: UNIX TOOLS ------------------------------------------------------------------
SET unix_dir=%JTSDK_HOME%\tools\msys2\usr\bin
SET JTSDK_PATH=%JTSDK_PATH%;%unix_dir%

:: POSTGRES --------------------------------------------------------------------
IF EXIST "%JTSDK_HOME%\tools\PostgreSQL\10\pg_env.bat" (
call %JTSDK_HOME%\tools\PostgreSQL\10\pg_env.bat
)

::------------------------------------------------------------------------------
:: CONDITIONAL PATHS for Multiple versions of Cmake
::------------------------------------------------------------------------------
:: Note: Cmake 3.10.3 was chosen to match Ubuntu Bionc (18.04.0)
::       if the first point release ugrades this version, JTSDK should
::       follow suit.
IF EXIST "%JTSDK_CONFIG%\cmake310" (
SET cmakev=3.10.3
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
SET PROMPT=$C QT 5.9 $F $P^:
SET title-string=JTSDK-Tools QT 5.9 Environment
SET QTD=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw530_32\bin
) ELSE (
set QTV=5.5
SET PROMPT=$C QT 5.5 $F $P^:
SET title-string=JTSDK-Tools QT 5.5 Environment
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
SET /P git_tag=<ver.git
qmake.exe --version |awk "FNR==1 {print $3}" >q.m & SET /P QMV=<q.m & rm q.m
g++.exe --version |grep Built |awk "{print $7}" >g.v & SET /P CVER=<g.v & rm g.v
mingw32-make --version |grep Make |awk "{print $3}" >g.v & SET /P GNMK=<g.v & rm g.v
asciidoctor --version |grep "asciidoctor" |awk "{print $2}" >a.v & SET /P ADV=<a.v & rm a.v
cmake --version |awk "{print $3}" >c.m & SET /P CMV=<c.m & rm c.m
makensis.exe /VERSION  |tr -d "v" >n.m & SET /P NSM=<n.m & rm n.m
pkg-config --version >p.c & SET /P PKG=<p.c & rm p.c
git --version |awk "{print $3}" >c.m & SET /P GITV=<c.m & rm c.m
svn --version |awk "{print $3}" >c.m & SET /P SVNV=<c.m & rm c.m
mvn --version |awk "FNR==1 {print $3}" >mv.v & SET /P MVNV=<mv.v & rm mv.v
gradle --version |awk "FNR==2 {print $2}" >g.v & SET /P GDLV=<g.v & rm g.v
sqlite3 --version |awk "FNR==1 {print $1}" >s.v & SET /P SQ3V=<s.v & rm s.v
dotnet --version >d.n & SET /P DOTV=<d.n & rm d.n
bash --version |awk "FNR==1 {print $4}" >b.v & SET /P BENV=<b.v & rm b.v
pandoc --version | awk "FNR==1 {print $2}" >p.v & SET /P PDV=<p.v & rm p.v
docfx.exe --version | awk "FNR==1 {print $2}" >p.v & SET /P DFX=<p.v & rm p.v
nuget help |awk "FNR==1 {print $3}" >ng.v & SET /P NUG=<ng.v & rm ng.v

::------------------------------------------------------------------------------
:: CONDITIONAL VERSION CHECKS
::------------------------------------------------------------------------------

:: PostgreSQL
IF EXIST "%JTSDK_HOME%\tools\PostgreSQL\10\bin\psql.exe" (
postgres --version --version |awk "FNR==1 {print $3}" >p.m & SET /P PGV=<p.m & rm p.m
) ELSE (
SET PGV=Not Installed
)

CLS
ECHO --------------------------------------------
ECHO  %title-string%
ECHO --------------------------------------------
ECHO.
ECHO  JTSDK
ECHO    Version        : %version%
ECHO    Git Tag        : %git_tag%
ECHO.
ECHO  Core Tools
ECHO    Asciidoctor    : %ADV%
ECHO    Cmake          : %CMV%
ECHO    Git            : %GITV%
ECHO    DotNet Core    : %DOTV%
ECHO    GCC            : %CVER%
ECHO    InnoSetup      : %innov%
ECHO    Maven          : %MVNV%
ECHO    Mingw32 Make   : %GNMK%
ECHO    MSYS2 Bash     : %BENV%
ECHO    NSIS           : %NSM%
ECHO    NuGet          : %NUG%
ECHO    Pkg Config     : %PKG%
ECHO    Qmake          : %QMV%
ECHO    QT Version     : %QTV%
ECHO    SQLite         : %SQ3V%
ECHO    Subversion     : %SVNV%
ECHO.
ECHO. Doc Tools
ECHO    DocFX          : %DFX%
ECHO    Pandoc         : %PDV%
ECHO.
ECHO. Database Tools
ECHO    PostgeSQL      : %PGV%
ECHO.
ENDLOCAL 

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K