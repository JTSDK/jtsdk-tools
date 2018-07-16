#!/bin/bash
#
# Title ........: msys-build-hamlib.sh
# Version ......: snapshot
# Description ..: Build G4WJS Hammlib3 from source
# Project URL ..: Git: git://git.code.sf.net/u/bsomervi/hamlib
# Usage ........: ./build-hamlib.sh
#
# Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
# Copyright ....: Copyright (C) 2018 Greg Beam, KI7MT
# License ......: Apache 2.0
#
# msys-build-hamlib.sh is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation either version 3 of the
# License, or (at your option) any later version. 
#
# msys-build-hamlib.sh is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

# Exit on errors
#set -e

# General use Vars and colour
PKG_NAME=Hamlib
today=$(date +"%d-%m-%Y")
timestamp=$(date +"%d-%m-%Y at %R")
builder=$(whoami)

# Sets the path using Cygwin Style: /c/JTSDK or whatever %JTSDK_HOME% is set to
JTSDK_CYG_BASE=`cygpath.exe -u $JTSDK_HOME`

# Sets LocalAppData CygwinStyle: /c/User/$USER/AppData/Local/JTSDK/config
JTSDK_CYG_CONFIG=`cygpath.exe -u $JTSDK_CONFIG`

# Set the Tool Chain based on User Config Selection
if [[ -f $JTSDK_CYG_CONFIG/qt59 ]]
then
    export PATH="$JTSDK_CYG_BASE/tools/Qt/Tools/mingw530_32/bin:$PATH"
    TC="$JTSDK_CYG_BASE/tools/Qt/Tools/mingw530_32/bin"
else
    export PATH="$JTSDK_CYG_BASE/tools/Qt/Tools/mingw492_32/bin:$PATH"
    TC="$JTSDK_CYG_BASE/tools/Qt/Tools/mingw492_32/bin"
fi

# set remaing path variables
SRCD="$JTSDK_CYG_BASE/src/hamlib"
BUILDD="$SRCD/build"
PREFIX="$JTSDK_CYG_BASE/tools/hamlib/qt/$QTV"
LIBINC="$JTSDK_CYG_BASE/tools/libusb/1.0.22/include"
LIBDLL="$JTSDK_CYG_BASE/tools/libusb/1.0.22/MinGW32/dll"

# Foreground colours
C_R='\033[01;31m'		# red
C_G='\033[01;32m'		# green
C_Y='\033[01;33m'		# yellow
C_C='\033[01;36m'		# cyan
C_NC='\033[01;37m'		# no color

# Tool Check Function ----------------------------------------------------------
tool_check() {
echo ''
echo '---------------------------------------------------------------'
echo -e ${C_Y}" CHECKING TOOL-CHAIN ( QT $QTV Enabled )"${C_NC}
echo '---------------------------------------------------------------'

# Setup array and perform simple version checks
echo ''
array=( 'ar' 'nm' 'ld' 'gcc' 'g++' 'ranlib' )

for i in "${array[@]}"
do
	"$i" --version >/dev/null 2>&1
	
	if [ "$?" = "1" ];
	then 
		echo -en " $i check" && echo -e ${C_R}' FAILED'${C_NC}
		echo ''
		echo ' If you have not sourced one of the two options, try'
		echo ' that first, otherwise set you path correctly:'
		echo ''
		echo ' [ 1 ] For the QT5 Tool Chain type, ..: source-qt5'
		echo ' [ 2 ] For MinGW Tool-Chain, type ....: source-mingw32'
		echo ''
		exit 1
	else
		echo -en " $i .." && echo -e ${C_G}' OK'${C_NC}
	fi
done

# List tools versions
echo -e ' Compiler ...... '${C_G}"$(gcc --version |awk 'FNR==1')"${C_NC}
echo -e ' Bin Utils ..... '${C_G}"$(ranlib --version |awk 'FNR==1')"${C_NC}
echo -e ' Libtool ....... '${C_G}"$(libtool --version |awk 'FNR==1')"${C_NC}
echo -e ' Pkg-Config  ... '${C_G}"$(pkg-config --version)"${C_NC}
echo -e ' Source Path ... '${C_G}"$SRCD"${C_NC}
echo -e ' Build Path .... '${C_G}"$BUILDD"${C_NC}
echo -e ' Install Path .. '${C_G}"$PREFIX"${C_NC}
}
# Tool Check End Function ------------------------------------------------------

#--------------------------------------------------------------------#
# START MAIN SCRIPT                                                  #
#--------------------------------------------------------------------#

# Run Tool Check
cd
clear
tool_check

if [ "$?" = "0" ];
then
echo -en " TC Path ......." && echo -e ${C_G}" $TC"${C_NC}
echo -en " TC Status ....."&& echo -e ${C_G}' OK'${C_NC}
	echo ''
else
	echo ''
	echo -e ${C_R}"TOOL CHAIN WARNING"${C_NC}
	echo 'There was a problem with the Tool-Chain.'
	echo "$0 Will now exit .."
	exit ''
	exit 1
fi

# Start Git clone
echo '---------------------------------------------------------------'
echo -e ${C_Y} ' CLONING G4WJS HAMLIB3'${C_NC}
echo '---------------------------------------------------------------'
echo ''
mkdir -p "$BUILDD"
if [[ -f $SRCD/src/bootstrap ]];
then
	cd "$SRCD/src"
	git pull
else
	cd "$SRCD"
	
    if [[ -d $SRCD/src ]]
    then
        rm -rf "$SRCD/src"
    fi
    
    git clone git://git.code.sf.net/u/bsomervi/hamlib src
	cd "$SRCD/src"
	git checkout integration
fi

# Run hamlib bootstrap
cd "$SRCD/src"
echo ''
echo '---------------------------------------------------------------'
echo -e ${C_Y} " RUN BOOTSTRAP [ $PKG_NAME ]"${C_NC}
echo '---------------------------------------------------------------'
echo ''
echo 'Running bootstrap'
./bootstrap

# Run configure
cd "$BUILDD"
echo ''
echo '---------------------------------------------------------------'
echo -e ${C_Y} " CONFIGURING [ $PKG_NAME ]"${C_NC}
echo '---------------------------------------------------------------'
echo ''
echo '.. This may take a several minutes to complete'

# Build Static Only
echo -en ".. Build Type: " && echo -e ${C_G}'Static'${C_NC}
echo ''
../src/configure --prefix=$PREFIX \
--disable-shared \
--enable-static \
--disable-winradio \
--without-cxx-binding \
CC="$TC/gcc.exe" \
CXX="$TC/g++.exe" \
CFLAGS="-g -O2 -fdata-sections -ffunction-sections -I$LIBINC" \
LDFLAGS='-Wl,--gc-sections' \
LIBUSB_LIBS="-L$LIBDLL -llibusb-1.0" \

# Make clean check
if [[ -f $BUILDD/tests/rigctld.exe ]];
then
	echo ''
	echo '---------------------------------------------------------------'
	echo -e ${C_Y} " RUNNING MAKE CLEAN [ $PKG_NAME ]"${C_NC}
	echo '---------------------------------------------------------------'
	echo ''
	make clean
fi

# Run make
echo ''
echo '----------------------------------------------------------------'
echo -e ${C_Y} " RUNNING MAKE ALL [ $PKG_NAME ]"${C_NC}
echo '----------------------------------------------------------------'
echo ''
make -j$NUMBER_OF_PROCESSORS

# Run make install-strip
echo ''
echo '----------------------------------------------------------------'
echo -e ${C_Y} " INSTALLING [ $PKG_NAME ]"${C_NC}
echo '----------------------------------------------------------------'
echo ''
make install-strip

# Generate README if build finishes .. OK ..
if [[ $? = "0" ]];
then
	if [[ -f $PREFIX/$PKG_NAME.build.info ]]
    then
        rm -f "$PREFIX/$PKG_NAME.build.info"
    fi

	echo ''
	echo '---------------------------------------------------------------'
	echo -e ${C_Y} " ADDING BUILD INFO [ $PKG_NAME.build.info ] "${C_NC}
	echo '---------------------------------------------------------------'
	echo ''
	echo '  Creating Hamlib3 Build Info File'

# Generate Build Info File
(
cat <<EOF

# Package Information
Build Date...: $timestamp
Builder......: $builder
Prefix.......: $PREFIX
Pkg Name.....: $PKG_NAME
Pkg Version..: development
Tool Chain...: $QTV

# Source Location and Integration
Git URL......: git://git.code.sf.net/u/bsomervi/hamlib
Git Extra....: git checkout integration'

# Configure Options <for Static>
--prefix=$PREFIX \
--disable-shared \
--enable-static \
--disable-winradio \
--without-cxx-binding \
CC=$TC/gcc.exe \
CXX=$TC/g++.exe \
CFLAGS="-g -O2 -fdata-sections -ffunction-sections -I$LIBINC" \
LDFLAGS='-Wl,--gc-sections' \
LIBUSB_LIBS="-L$LIBDLL -llibusb-1.0" \

# Build Commands
make -j$NUMBER_OF_PROCESSORS
make install-strip

EOF
) > "$PREFIX/$PKG_NAME.build.info"
	echo '  Finished'
fi

echo ''
echo '---------------------------------------------------------------'
echo -e ${C_Y} " FIXUP PKGCONFIG "${C_NC}
echo '---------------------------------------------------------------'
echo ''
echo '  Updating hamlib.pc'
sed -i 's/Requires.private\: libusb-1.0/Requires.private\:/g' "$PREFIX/lib/pkgconfig/hamlib.pc" >/dev/null 2>&1

# Finished
if [ "$?" = "0" ];
then
	echo ''
	echo '----------------------------------------------------------------'
	echo -e ${C_G} " FINISHED INSTALLING [ $PKG_NAME ]"${C_NC}
	echo '----------------------------------------------------------------'
	echo ''
	touch "$PREFIX/build-date-$today"
	echo "  Tool-Chain........: QT $QTV"
	echo "  Source Location...: $SRCD/src"
	echo "  Build Location....: $SRCD/build"
	echo "  Install Location..: $PREFIX"
	echo "  Package Config....: $PREFIX/lib/pkgconfig/hamlib.pc"
	echo ''
	exit 0
else
	echo -e ${C_G} 'BUILD ERRORS OCCURED'${C_NC}
	echo "Check the screen and correct errors"
	echo ''
	echo "Exiting [ $0 ] with Status [ 1 ]"
	echo ''
	exit 1
fi

exit 0
