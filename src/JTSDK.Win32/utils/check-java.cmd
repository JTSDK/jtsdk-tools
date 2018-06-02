::-----------------------------------------------------------------------------::
:: Name .........: check-java.cmd
:: Project ......: Part of the JTSDK Version 3.0.0 Project
:: Description ..: Check if %JAVA_HOME% exists
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file from a script, or from command line
:: Example ......: call check-java.cmd
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ......: GPLv3
::
::-----------------------------------------------------------------------------::
@ECHO OFF

:: Example script variables
SET config_script=set-java-home.cmd
SET example_path=%CD%\JTSDK-Tools\env\%config_script%

:: If anything is in %1 it should set debug to ON
if [%1]==[] (
    SET jdebug=0
) ELSE (
    SET jdebug=1
)

:: This has a high potential of falire. Java is a pain
IF NOT "%JAVA_HOME%" == "" GOTO EOF

:: Error message if JAVA_HOME not set
ECHO.
ECHO Java JDK was not found or is empty or JAVA_HOME is incorrect.
ECHO Eclipe, Maven, Gradle, Spring, and Tomcat all require Java to run.
ECHO.
ECHO Possible Causes:
ECHO  ^- Java is not installed
ECHO  ^- JAVA_HOME environment variable is set incorrectly
ECHO  ^- Java was installed without the JDK
ECHO.
ECHO Please ensure you have installed Java and 
ECHO set the JAVA_HOME variable globally.
ECHO.
ECHO For testing purposes, you can use ^: ^( %config_script% ^)
ECHO Script Location ^: %example_path%
ECHO.
EXIT /b 1

:EOF
IF %jdebug%==1 (
    CLS
    ECHO.
    ECHO Debug For JAVA_HOME Path
    ECHO JAVA_HOME ....: %JAVA_HOME%
    ECHO.
    ECHO.Java Runtime ^(JRE^)
    java -version
    ECHO.
    ECHO.Java Compiler ^(JDK^)
    javac -version
 )

exit /b 0