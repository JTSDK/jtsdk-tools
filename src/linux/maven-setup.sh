#!/usr/bin/env bash

set -e

# check the Apache Maven Website and adjust version as needed
# https://maven.apache.org/download.cgi
version="3.6.0"
url="https://www-us.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz"

# set script variables
config_dir="$HOME/.config/jtsdk-tools"
maven_env="$config_dir/env/maven-env.sh"

# ensure env directory exists
mkdir -p "$config_dir/env" &>/dev/null

# Install Prequisits
clear ||:
echo "================================="
echo "Installing Apache Maven"
echo "================================="

# check in repository has already been added
if [[ ! -d /opt/apache-maven-$version ]]; then
    
    echo "* Downloading Maven Version : $version"
    sudo wget -c -N --progress=dot "$url" -P /tmp
    
    echo "* Extracting apache-maven-$version-bin.tar.gz"
    sudo tar xf /tmp/apache-maven-"$version"-bin.tar.gz -C /opt
    
    # to prevent any link errors, unlink /opt/maven first
    echo "* Linking /opt/apache-maven-$version to /opt/maven"

    # unlink if xists
    if [[ -L /opt/maven ]]; then
        sudo unlink /opt/maven
    fi

    # Link the new version
    sudo ln -s /opt/apache-maven-"$version" /opt/maven

    # generate maven-env.sh script
    echo "* Generate Maven Envirnment Script"
    rm -f "$maven_env" &>/dev/null
    touch "$maven_env" &>/dev/null

# create the here doc
(
cat <<'EOF_MAVEN_ENV'
#!/usr/bin/env bash

# Auto Generated by maven-setup.sh

# Project ......: JTSDK-Tools
# File .........: maven-env.sh
# Author .......: Greg Beam (KI7MT)
# Description ..: Environment variables for Apache Maven
# Usage.........: Source this script to use Maven environment variabes
#
# Example:
#       source /home/$USER/.config/jtsdk-tools/env/maven-env.sh
#       mvn --version

# set variables
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

# End Maven Environment Script
EOF_MAVEN_ENV
) > "$maven_env"

    # source the env script
    echo "* Sourcing : $maven_env"
    source "$maven_env"
    echo "* Run Version Check"
    echo ""
    mvn --version
    echo ""
    echo "Finished Installing Maven Version : $version"
    echo ""

else
    echo "* Maven Version : $version is already installed"
    echo ""
fi

# End Maven Installation