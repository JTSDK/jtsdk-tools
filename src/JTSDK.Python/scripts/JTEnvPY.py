"""
Date.........: 7/29/2018
Author.......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
Copyright....: Copyright (C) 2018, Greg Beam KI7MT
License......: GPL-3
Description..: Shows pre-defined lists of Environment variables from lists

Usage:
    python JTEnvPY.py [option]

    Option:
        -h, --help      show help message
        -a, --all,      show all list variables end exit
        -j, --java      show Java related variables and exit
        -s, --system    show System variables and exit
        -u, --user      show User variables and exit
        -v, --version   show program's version number and exit

"""

import os
import sys
import argparse

__version__ = '3.0.1'
__name__ = 'JTEnv-py'

# parser setup
parser = argparse.ArgumentParser()
parser.prog = 'JTEnv-py'
parser.description = "Prints Environment Variables used with JTSDK-Tools v3"
parser.epilog = "python JTEnvPY.py [OPTION]"
parser.add_argument('-a', '--all', help="show all list variables end exit", action='store_true')
parser.add_argument('-j', '--java', help="show Java related variables and exit",  action='store_true')
parser.add_argument('-s', '--system', help="show System variables and exit",  action='store_true')
parser.add_argument('-u', '--user', help="show User variables and exit",  action='store_true')
parser.add_argument('-z', '--jtsdk', help="show JTSDK-Tools variables ane exit",  action='store_true')
parser.add_argument('-v', '--version', action='version', version='%(prog)s - v' + __version__)

# lists for : Java, User, System, JTSDK-Tools
javaList = ['JAVA_HOME', 'M2_HOME','MAVEN_HOME','GRADLE_HOME','JAVA_TOOL_OPTIONS']
userList = ['USERNAME','USERPROFILE','LOCALAPPDATA','TEMP']
systemList = ['COMPUTERNAME','OS','PROCESSOR_ARCHITECTURE','COMSPEC','PROCESSOR_IDENTIFIER']
jtsdkList = ['JTSDK_HOME','JTSDK_APPS','JTSDK_CONFIG','JTSDK_DATA']

# combine all lists in a very basic way
allList = []
allList = userList + systemList + javaList + jtsdkList

# print the options headers
def printHeader():
    """Prints the Environment Section Header"""
    os.system('cls' if os.name == 'nt' else 'clear')
    print("\nApplication : %s" % __name__ )
    print('Version     : %s' % __version__)
    print('Python Exec : %s' % sys.executable)
    print("")
    print('{0:<23} {1}'.format("Variable", "Path"))
    print("-" * 55)

def print_list(args):
    """Loops through a provided list of Environment variables
    
    Parameters:
        args = str
            Arguments parsed by ArgParse
    
    Variables:
        javaList = list
            list of environment variables used by Java applications

        systemList = list
            list of system environment variables

        userList = list
            list of user environment variables

        jtsdkList = list
            list of JTSDK-Tools specific variables

    Shows:
        list of environment variables and paths based on args parsed

    """
    
    # default list
    finalList = []

    # process arguments
    if args.java:
        finalList = javaList

    if args.system:
        finalList = systemList

    if args.jtsdk:
        finalList = jtsdkList

    if args.user:
        finalList = userList

    if args.all:
        finalList = allList

    printHeader()
    for i in finalList:
        try:    
            print('{0:<23} {1}'.format(i, os.environ[i]))
        except KeyError:
            print('{0:<23} {1}'.format(i, '-- undefined --'))

    sys.exit(0)

# process the arguments
args = parser.parse_args()
if len(sys.argv) < 2:
    parser.print_help()
    sys.exit(1)
else:
    print_list(args)

# END - JTEnvPY.py