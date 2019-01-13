@ECHO off
:: -----------------------------------------------------------------------------
:: Name ..............: version-check.cmd
:: Description .......: Print versions of Key Applicaitons
:: Author ............: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright .........: Copyright (C) 2014-2018 Greg Beam, KI7MT
:: License ...........: GPL-3
::
:: version-vheck is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: version-check is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::

CLS
ECHO ^*^*^*^* Gathering Environment Information, Please Wait ^*^*^*^*
SETLOCAL

:: Core Tools
asciidoctor --version |grep "asciidoctor" |awk "{print $2}" >a.v & SET /P ADV=<a.v & rm a.v
bash --version |awk "FNR==1 {print $4}" >b.v & SET /P BENV=<b.v & rm b.v
cmake --version |awk "{print $3}" >c.m & SET /P CMV=<c.m & rm c.m
dotnet --version >d.n & SET /P DOTV=<d.n & rm d.n
git --version |awk "{print $3}" >c.m & SET /P GITV=<c.m & rm c.m
g++.exe --version |grep Built |awk "{print $7}" >g.v & SET /P CVER=<g.v & rm g.v
makensis.exe /VERSION  |tr -d "v" >n.m & SET /P NSM=<n.m & rm n.m
mingw32-make --version |grep Make |awk "{print $3}" >g.v & SET /P GNMK=<g.v & rm g.v
nuget help |awk "FNR==1 {print $3}" >ng.v & SET /P NUG=<ng.v & rm ng.v
pkg-config --version >p.c & SET /P PKG=<p.c & rm p.c
qmake.exe --version |awk "FNR==1 {print $3}" >q.m & SET /P QMV=<q.m & rm q.m
svn --version |awk "{print $3}" >c.m & SET /P SVNV=<c.m & rm c.m

::------------------------------------------------------------------------------
:: CONDITIONAL VERSION CHECKS
::------------------------------------------------------------------------------

:: Pandoc
IF EXIST "%JTSDK_HOME%\tools\pandoc\%pandocv%" (
pandoc --version | awk "FNR==1 {print $2}" >p.v & SET /P PDV=<p.v & rm p.v
) ELSE (
SET PDV=Not Installed
)

:: DocFX
IF EXIST "%JTSDK_HOME%\tools\docfx\%docfxv%" (
docfx.exe --version | awk "FNR==1 {print $2}" >p.v & SET /P DFX=<p.v & rm p.v
) ELSE (
SET DFX=Not Installed
)

:: SQLite3
IF EXIST "%JTSDK_HOME%\tools\sqlite3\%sqlite3v%" (
sqlite3 --version |awk "FNR==1 {print $1}" >s.v & SET /P SQ3V=<s.v & rm s.v
) ELSE (
SET SQ3V=Not Installed
)

:: Gradle
IF EXIST "%JTSDK_HOME%\tools\gradle\%gradlev%" (
gradle --version |awk "FNR==3 {print $2}" >g.v & SET /P GDLV=<g.v & rm g.v
) ELSE (
SET GDLV=Not Installed
)

:: Apache Ant
IF EXIST "%JTSDK_HOME%\tools\ant\%antv%" (
gradle --version |awk "FNR==1 {print $4}" >a.v & SET /P ANTV=<a.v & rm a.v
) ELSE (
SET ANTV=Not Installed
)

:: Apache Maven
IF EXIST "%JTSDK_HOME%\tools\maven\%mavenv%" (
mvn --version |awk "FNR==1 {print $3}" >mv.v & SET /P MVNV=<mv.v & rm mv.v
) ELSE (
SET MVNV=Not Installed
)

:: PostgreSQL
IF EXIST "%JTSDK_HOME%\tools\PostgreSQL\10\bin\psql.exe" (
postgres --version --version |awk "FNR==1 {print $3}" >p.m & SET /P PGV=<p.m & rm p.m
) ELSE (
SET PGV=Not Installed
)

:: Print the Version Data
CLS
ECHO.
ECHO  Core Tools
ECHO    Asciidoctor    : %ADV%
ECHO    Cmake          : %CMV%
ECHO    DotNet Core    : %DOTV%
ECHO    GCC            : %CVER%
ECHO    Git            : %GITV%
ECHO    InnoSetup      : %innov%
ECHO    Mingw32 Make   : %GNMK%
ECHO    MSYS2 Bash     : %BENV%
ECHO    NSIS           : %NSM%
ECHO    NuGet          : %NUG%
ECHO    Pkg Config     : %PKG%
ECHO    Qmake          : %QMV%
ECHO    QT Version     : %QTV%
ECHO    Subversion     : %SVNV%
ECHO.
ECHO  Java Tools
ECHO    Ant            : %ANTV%
ECHO    Gradle         : %GDLV%
ECHO    Maven          : %MVNV%
ECHO.
ECHO  Doc Tools
ECHO    DocFX          : %DFX%
ECHO    Pandoc         : %PDV%
ECHO.
ECHO  Database Tools
ECHO   PostgeSQL      : %PGV%
ECHO   SQLite         : %SQ3V%
ECHO.
ECHO  ^-^- end of version check ^-^-
GOTO EOF

:EOF
ENDLOCAL
exit /b 0