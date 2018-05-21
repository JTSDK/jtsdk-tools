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
:: License ......: GPLv3
::
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