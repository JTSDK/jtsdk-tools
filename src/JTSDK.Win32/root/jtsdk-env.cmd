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
@chcp 1252 >NUL 2>&1
SET LANG=en_US

:: RESET TOOL STATUS
SET DBTOOLS=Not Installed
SET DOCTOOLS=Not installed
SET JAVATOOLS=Not Installed
SET PYTOOLS=Not Installed
SET CORETOOLS=Not Installed

:: JTSDK Version
SET /P version=<ver.jtsdk
SET /P git_tag=<ver.git

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
:: CREATE LOCAL DIRECTORIES
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
:: DOC TOOLS PATH
:: Set those tool paths ONLY if they were installed with jtsdk-db-tools
::------------------------------------------------------------------------------

:: CHeck doc-tools
IF EXIST "%JTSDK_HOME%\doc.tools" (GOTO DOC_TOOLS)
GOTO DB_CHECK

:DOC_TOOLS
ECHO ^*^* Setting Doc Tools Paths
SET DOCTOOLS=Installed
SET asciidocv=8.6.9
SET docfxv=2.37
SET pandocv=2.2.1

:: AsciiDoc
SET asciidoc_dir=%JTSDK_HOME%\tools\asciidoc\%asciidocv%
SET "asciidoc_dir_f=%asciidoc_dir:\=/%"
SET JTSDK_PATH=%asciidoc_dir%

:: DOCFX
SET docfx_dir=%JTSDK_HOME%\tools\docfx\%docfxv%
SET JTSDK_PATH=%JTSDK_PATH%;%docfx_dir%

:: PANDOC
SET pandoc_dir=%JTSDK_HOME%\tools\pandoc\%pandocv%
SET JTSDK_PATH=%JTSDK_PATH%;%pandoc_dir%

:: END DOC TOOLS ---------------------------------------------------------------
GOTO DB_CHECK

::------------------------------------------------------------------------------
:: DB TOOLS PATH
:: Set those tool paths ONLY if they were installed with jtsdk-db-tools
::------------------------------------------------------------------------------

:DB_CHECK
IF EXIST %JTSDK_HOME%\db.tools (GOTO DB_TOOLS)
GOTO JAVA_CHECK

:DB_TOOLS
ECHO ^*^* Setting DB Tool Paths
SET DBTOOLS=Installed
SET sqlite3v=3.24.0
SET psqlv=10

:: SQLITE
SET sqlite3_dir=%JTSDK_HOME%\tools\sqlite3\%sqlite3v%
SET JTSDK_PATH=%JTSDK_PATH%;%sqlite3_dir%

:: POSTGRES
IF EXIST "%JTSDK_HOME%\tools\PostgreSQL\10\pg_env.bat" (
call %JTSDK_HOME%\tools\PostgreSQL\10\pg_env.bat
)

:: END DB TOOLS ----------------------------------------------------------------
GOTO JAVA_CHECK

::------------------------------------------------------------------------------
:: JAVA TOOLS
:: Set those tool paths ONLY if they were installed with jtsdk-java-tools
::------------------------------------------------------------------------------

:JAVA_CHECK
IF EXIST "%JTSDK_HOME%\java.tools" (GOTO JAVA_TOOLS)
GOTO CORE_CHECK

:JAVA_TOOLS
ECHO ^*^* Setting Java Tool Paths
SET JAVATOOLS=Installed
SET gradlev=4.9
SET mavenv=3.5.4
SET antv=1.10.4

:: GRADLE
SET gradle_dir=%JTSDK_HOME%\tools\gradle\%gradlev%
SET JTSDK_PATH=%JTSDK_PATH%;%gradle_dir%\bin

:: APACHE MAVEN
SET maven_dir=%JTSDK_HOME%\tools\maven\%mavenv%
SET JTSDK_PATH=%JTSDK_PATH%;%maven_dir%\bin

:: APACHE ANT
SET ant_dir=%JTSDK_HOME%\tools\ant\%antv%
SET JTSDK_PATH=%JTSDK_PATH%;%ant_dir%\bin

:: END JAVA TOOLS --------------------------------------------------------------
GOTO CORE_CHECK

::------------------------------------------------------------------------------
:: CORE TOOLS
:: Set those tool paths ONLY if they were installed with jtsdk-core-tools
::------------------------------------------------------------------------------

:CORE_CHECK
IF EXIST "%JTSDK_HOME%\core.tools" (GOTO CORE_TOOLS)
GOTO PY_CHECK

:CORE_TOOLS
ECHO ^*^* Setting Core Tool Paths
SET CORETOOLS=Installed
SET fftwv=3.3.5
SET innov=5.5.9
SET libusbv=1.0.22
SET nsisv=3.03
SET pkgconfigv=0.28.1
SET rubyv=2.5.1-2
SET svnv=1.9.7

:: FFTW
SET fftw3f_dir=%JTSDK_HOME%\tools\fftw\%fftwv%
SET "fftw3f_dir_f=%fftw3f_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%fftw3f_dir%

:: INNO
SET inno_dir=%JTSDK_HOME%\tools\inno\%innov%
SET "inno_dir_f=%inno_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%inno_dir%

:: LIBUSB
SET libusb_dir=%JTSDK_HOME%\tools\libusb\%libusbv%
SET "libusb_dir_f=%libusb_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%linusb_dir%

:: NSIS
SET nsis_dir=%JTSDK_HOME%\tools\nsis\%nsisv%
SET "nsis_dir_f=%nsis_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%nsis_dir%

:: NUGET
SET nuget_dir=%JTSDK_HOME%\tools\nuget
SET JTSDK_PATH=%JTSDK_PATH%;%nuget_dir%

:: PKG_CONFIG
SET pkgconfig_dir=%JTSDK_HOME%\tools\pkgconfig\%pkgconfigv%\bin
SET "pkgconfig_dir_f=%pkgconfig_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%pkgconfig_dir%

:: RUBY
SET ruby_dir=%JTSDK_HOME%\tools\ruby\%rubyv%\bin
SET "ruby_dir_f=%ruby_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%ruby_dir%

:: SVN
SET svn_dir=%JTSDK_HOME%\tools\subversion\%svnv%\bin
SET "svn_dir_f=%svn_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%svn_dir%

:: UNIX TOOLS
IF EXIST "%JTSDK_CONFIG%\unix" (
SET unix_dir=%JTSDK_HOME%\tools\msys2\usr\bin
SET JTSDK_PATH=%JTSDK_PATH%;%unix_dir%
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
IF EXIST %JTSDK_CONFIG%\QT59 (
SET QTV=5.9.5
SET PROMPT=$CQT-5.9$F $P ^>
SET title-string=JTSDK-Tools QT 5.9 Environment
SET QTD=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.9.5\mingw53_32\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw530_32\bin
) ELSE (
set QTV=5.5
SET PROMPT=$CQT-5.5$F $P ^>
SET title-string=JTSDK-Tools QT 5.5 Environment
SET QTD=%JTSDK_HOME%\tools\Qt\5.5\mingw492_32\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.5\mingw492_32\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw492_32\bin
)
SET JTSDK_PATH=%GCCD%;%QTD%;%QTP%;%JTSDK_PATH%

:: Set forward slash paths for MSYS2 and QT
SET "QTD_F=%QTD:\=/%"
SET "GCCD_F=%GCCD:\=/%"

:: END CORE TOOLS -------------------------------------------------------------
GOTO PY_CHECK

::------------------------------------------------------------------------------
:: PYTHON TOOLS
:: Set those tool paths ONLY if they were installed with jtsdk-core-tools
::------------------------------------------------------------------------------

:PY_CHECK
IF EXIST "%JTSDK_HOME%\tools\Anaconda3\Scripts\activate.bat" (GOTO PY_TOOLS)
GOTO SET_FINAL 

:PY_TOOLS
ECHO ^*^* Setting Python Tool Paths
SET PYTOOLS=Installed
call %JTSDK_HOME%\tools\Anaconda3\Scripts\activate.bat %JTSDK_HOME%\tools\Anaconda3
GOTO SET_FINAL

::------------------------------------------------------------------------------
:: SET FINAL ENVIRONMENT PATHS and CONSOLE TITLE
::------------------------------------------------------------------------------

:SET_FINAL
ECHO ^*^* Set Final Paths and headers
TITLE %title-string%
SET PATH=%JTSDK_PATH%;%PATH%

::------------------------------------------------------------------------------
:: GENERATE DOSKEY's
::------------------------------------------------------------------------------
ECHO ^*^* Generating Doskey^'s
call %JTSDK_HOME%\scripts\cmd\utils\gen-doskey.cmd

::------------------------------------------------------------------------------
:: AUTO GENERATE QT Tool Chain Files (safety feature)
::------------------------------------------------------------------------------
ECHO ^*^* Generating Generating Tool Chain Files
call %JTSDK_HOME%\scripts\cmd\utils\qt-gen-tc.cmd >NUL 2>&1

::------------------------------------------------------------------------------
:: PRINT ENVIRONMENT MESSAGE
::------------------------------------------------------------------------------
CLS
ECHO --------------------------------------------
ECHO  %title-string%
ECHO --------------------------------------------
ECHO.
ECHO  JTSDK
ECHO    Version        : %version%
ECHO    Git Tag        : %git_tag%
ECHO.
ECHO  Tool Chain Status
ECHO    Core Tools     : %CORETOOLS%
ECHO    DOC Tools      : %DOCTOOLS%
ECHO    DB Tools       : %DBTOOLS%
ECHO    Python Tools   : %PYTOOLS%
ECHO    Java Tools     : %JAVATOOLS%
ECHO.
GOTO RUN

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K