#!/bin/bash
#
# Title ........: install-pkg-list.sh
# Description ..: Install list of packages for use with JTSDK v3
# Project URL ..: https://github.com/KI7MT/jtsdk-dotnet-core
# Usage ........: From MSYS2 console - install-pkg-list.sh
#
# Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
# Copyright ....: Copyright (C) 2018 Greg Beam, KI7MT
# License ......: GPLv3
#
# install-pkg-list.sh is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation either version 3 of the
# License, or (at your option) any later version. 
#
# install-pkg-list.sh is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

# Exit on errors
set -e

# Foreground colours
C_R='\033[01;31m'		# red
C_G='\033[01;32m'		# green
C_Y='\033[01;33m'		# yellow
C_C='\033[01;36m'		# cyan
C_NC='\033[01;37m'		# no color

# Tool Check Function ----------------------------------------------------------
echo ''
echo '---------------------------------------------------------------'
echo -e ${C_Y}"INSTALL JTSDK v3 PACKAGE LIST"${C_NC}
echo '---------------------------------------------------------------'

# Declare the array
declare -a pkg_list

# Read file line items into a Bash Array 
readarray pkg_list < /usr/etc/hamlib-pkg-list.txt

# Loop through the pkg_list array and install as needed
for i in "${pkg_list[@]}"
do
	pacman -S --needed --noconfirm "$i"
done

# exit script
echo ''
exit 0
