::-----------------------------------------------------------------------------::
:: Name .........: env-asciidoc.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for AsciiDoc
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-asciidoc.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-asciidoc.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-asciidoc.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET asciidocv=8.6.9

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET asciidoc_debug=0
) ELSE (
    SET asciidoc_debug=1
)
GOTO CHECK_HOME

:CHECK_HOME
:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_ASCIIDOC_PATH

:: ASCIIDOC --------------------------------------------------------------------
:SET_ASCIIDOC_PATH
SET asciidoc_dir=
SET asciidoc_dir_f=

:: Set the path only if it exists
IF EXIST %JTSDK_HOME%\tools\asciidoc\%asciidocv%\asciidoc.py (
    SET asciidoc_dir=%JTSDK_HOME%\tools\asciidoc\%asciidocv%
    SET "asciidoc_dir_f=%asciidoc_dir:\=/%"
)

::------------------------------------------------------------------------------
:: DOSKEY (ENABLE | DISABLE) FEATURES
:: Note: None for AsciiDoc
::------------------------------------------------------------------------------
GOTO EOF

:EOF
IF %asciidoc_debug%==1 (
    CLS
    ECHO AsciiDoc Version ^( %asciidocv% ^)
    ECHO Path ..........: %asciidoc_dir%
    ECHO Forward Path ..: %asciidoc_dir:\=/%
)

exit /b 0