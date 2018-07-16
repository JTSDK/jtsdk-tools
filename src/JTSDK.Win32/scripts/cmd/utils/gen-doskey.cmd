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

::------------------------------------------------------------------------------
:: DOSKEY for JTSDK Core Applications
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
:: DOSKEY build-hamlib3 = start /wait ridk exec bash msys-build-hamlib3.sh
DOSKEY msys2 = %JTSDK_HOME%\tools\msys2\msys2_shell.cmd

::------------------------------------------------------------------------------
:: DOSKEY GENERAL PURPOSE
::------------------------------------------------------------------------------
DOSKEY version-check = PUSHD %JTSDK_HOME%\scripts\cmd\utils $T call versoin-check.cmd $T POPD
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY home = CD %JTSDK_HOME%
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b

exit /b 0