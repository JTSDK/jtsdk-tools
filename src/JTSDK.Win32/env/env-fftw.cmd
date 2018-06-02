::-----------------------------------------------------------------------------::
:: Name .........: env-fftw.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Path Variables for FFTW
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
:: Example ......: call env-fftw.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: env-fftw.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: env-fftw.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET fftwv=3.3.5

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET fftw_debug=0
) ELSE (
    SET fftw_debug=1
)

:: If JTSDK_HOME variable is not set, exit without setting path
call check-home.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)

:: If JTSDK_CONFIG variable is not set, exit without setting path
call check-config.cmd
IF %ERRORLEVEL% NEQ 0 (EXIT /b 1)
GOTO SET_FFTW_PATH

:SET_FFTW_PATH
SET fftw3f_dir=%JTSDK_HOME%\tools\fftw\%fftwv%
SET "fftw3f_dir_f=%fftw3f_dir:\=/%"
GOTO EOF

:EOF
IF %fftw_debug%==1 (
    ECHO.
    ECHO FFTW Version Informaiton
    ECHO Path ..........: %fftw3f_dir%
    ECHO Forward Path ..: %fftw3f_dir:\=/%
    ECHO.    
   %fftw3f_dir%\fftwf-wisdom --version
)

exit /b 0