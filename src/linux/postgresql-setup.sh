#!/usr/bin/env bash

set -e

# Process lists
checklist=(postgresql-11 postgresql-contrib pgadmin4)
declare -a pkglist

# Install Prequisits
clear ||:

echo "=========================="
echo 'Checking Prerequisits'
echo "=========================="
echo ""
sudo apt-get update
sudo apt-get -y -q install curl ca-certificates
echo ""
echo "================================="
echo "Installing PosgreSQL && Pgadmin4"
echo "================================="

# check if the repository has already been added
grep "bionic-pgdg" /etc/apt/sources.list.d/pgdg.list &>/dev/null

# check in repository has already been added
if [[ $? -ne 0 ]]; then
    echo "* Adding PostgreSQL Repository"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    sudo apt-get update
else
    echo "* PostgreSQL repository is present"
fi

# check if installed
echo "* Checking Required Packages"
for i in "${checklist[@]}"
do
    dpkg -l $i &>/dev/null
    if [[ $? -ne 0 ]]; then
        pkglist+=($i) 
    fi
done

# check the array list for needed packages
if [[ ${#pkglist[@]} -ne 0 ]]; then
    echo "* Installing Needed Packages"
    for i in "${pkglist[@]}"
    do
        sudo apt-get install -y $i
    done
else
    echo "* No Packages Needed"
fi

echo ""
echo "Finished PostgreSQL Installation"
echo ""

# End PostgreSQL Installation