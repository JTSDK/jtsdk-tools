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
gradle --version |awk "FNR==3 {print $2}" >g.v & SET /P GDLV=<g.v & rm g.v
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

:: Print the Version Data
ECHO  Core Tools
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
ECHO. Java Tools
ECHO    Java           : %JAV%
ECHO    Gradle         : %GDLV%
ECHO    Maven          : %MVNV%
ECHO.
ECHO. Doc Tools
ECHO    Asciidoctor    : %ADV%
ECHO    DocFX          : %DFX%
ECHO    Pandoc         : %PDV%
ECHO.
ECHO. Database Tools
ECHO    PostgeSQL      : %PGV%
ECHO    SQLite         : %SQ3V%
ECHO.
GOTO EOF

:EOF
ENDLOCAL
exit /b 0