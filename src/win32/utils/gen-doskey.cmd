@ECHO off
:: -----------------------------------------------------------------------------
:: Name ..............: gen-doskey.cmd
:: Description .......: Generate Global DOSKEY's
:: Author ............: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright .........: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ...........: GPL-3
::
:: gen-doskey is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: gen-doskey is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::

:: Add ClassPath for JTEnvJV
::SET jtenv_cp=%JTSDK_HOME%\tools\scripts\java\jtenv\lib

::------------------------------------------------------------------------------
:: DOSKEY for JTSDK Core Applications
::------------------------------------------------------------------------------
DOSKEY jtconfig = dotnet %JTSDK_APPS%\JTConfig.dll $*

::------------------------------------------------------------------------------
:: DOSKEY -for Generating QT Tool Chain Files
::------------------------------------------------------------------------------
DOSKEY gen-tc = PUSHD %JTSDK_HOME%\tools\scripts\cmd\utils $T call qt-gen-tc.cmd $T POPD

::------------------------------------------------------------------------------
:: DOSKEY's for MSYS2
::------------------------------------------------------------------------------
:: DOSKEY update-msys2 = cls $T ridk exec pacman -Syuu
:: DOSKEY search-msys2 = ridk exec pacman -Ss $*
:: DOSKEY build-hamlib3 = start /wait ridk exec bash msys-build-hamlib3.sh
DOSKEY msys2 = %JTSDK_HOME%\tools\msys2\msys2_shell.cmd

::------------------------------------------------------------------------------
:: DOSKEY for JTEnv Commands
::------------------------------------------------------------------------------
DOSKEY jtenv = dotnet %JTSDK_APPS%\JTEnv.dll $*
::DOSKEY jtenv-jv = java -cp %jtenv_cp% -jar %jtenv_cp%\jtenv-3.0.2.jar $*
::DOSKEY jtenv-py = python %JTSDK_HOME%\tools\scripts\python\JTEnvPY.py $*

::------------------------------------------------------------------------------
:: DOSKEY for jtbuild.cmd
::------------------------------------------------------------------------------
DOSKEY jtbuild = call %JTSDK_HOME%\tools\scripts\cmd\utils\jtbuild.cmd $*

::------------------------------------------------------------------------------
:: DOSKEY GENERAL PURPOSE
::------------------------------------------------------------------------------
DOSKEY version-check = call %JTSDK_HOME%\tools\scripts\cmd\utils\version-check.cmd
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY home = CD %JTSDK_HOME%
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b

exit /b 0