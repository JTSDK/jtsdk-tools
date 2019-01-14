# -*- coding: utf-8 -*-
import sys
import argparse

from .printenv import print_all, print_dict, print_list, print_header, merge_dict, print_dirs
from .setupenv import create_directories
from . import __version__ as version
from . import __name__ as name
from . import __username__
from . import __hostname__
from . import __os__
from . import __osversion__
from . import __arch__
from . import __processor__
from . import __homedir__
from . import __sharedir__
from . import __configdir__
from . import __datadir__


def main():
    """Main Function"""
    # lists
    ALL_LIST = []
    
    # environment variable list for JAVA
    JAVA_LIST = [
        'JAVA_HOME',
        'M2_HOME',
        'MAVEN_HOME',
        'GRADLE_HOME',
        'JAVA_TOOL_OPTIONS'
        ]
    
    # environment variables list for JTSDK
    JTSDK_LIST = [
        'JTSDK_HOME',
        'JTSDK_APPS',
        'JTSDK_CONFIG',
        'JTSDK_DATA'
        ]
    
    # combined Java and JTSDK variable list
    ALL_LIST = JAVA_LIST + JTSDK_LIST

    # shared directories dictionary
    appdirs = {
        "Shared": __sharedir__,
        "Config": __configdir__,
        "Data": __datadir__
        }

    # user related variable(s) dictionary
    user = {
        "User": __username__,
        "Home": __homedir__
        }

    # system related variable(s) dictionary
    system = {
        "Host": __hostname__,
        "OS": __os__,
        "Version": __osversion__,
        "Arch": __arch__,
        "CPU": __processor__
        }

    parser = argparse.ArgumentParser()
    parser.prog = 'jtenv'
    parser.description = "Print Environment Variables"
    parser.epilog = "jtenv [OPTION]"

    parser.add_argument('-a', '--all',
                        help="List all variables",
                        action='store_true')

    parser.add_argument('-j', '--java',
                        help="Java related variables",
                        action='store_true')

    parser.add_argument('-s', '--system',
                        help="System variables and exit",
                        action='store_true')

    parser.add_argument('-S', '--setup',
                        help="Setup FSH Directories",
                        action='store_true')

    parser.add_argument('-u', '--user',
                        help="User variables and exit",
                        action='store_true')

    parser.add_argument('-z', '--jtsdk',
                        help="JTSDK-Tools variables",
                        action='store_true')

    parser.add_argument('-v', '--version',
                        help="The application version number",
                        action='version',
                        version='%(prog)s {}'.format(version))

    # process cli sys.argv[**args, **kwargs]
    args = parser.parse_args()

    # iterate through arg parse options
    if len(sys.argv) < 2:
        print_header(name, version, "Argument Error")
        parser.print_help()
        print("")
        sys.exit(1)
    elif args.java:
        print_header(name, version, "Java Environment Variables")
        print_list(JAVA_LIST)
        print("")
    elif args.jtsdk:
        print_header(name, version, "JTSDK Environment Variables")
        print_list(JTSDK_LIST)
        print("")
    elif args.system:
        print_header(name, version, "System Environment Variables")
        print_dict(system)
        print("")
    elif args.setup:
        print_header(name, version, "Setup Directories")
        create_directories(appdirs)
        print("")
    elif args.user:
        print_header(name, version, "User Environment Variables")
        print_dict(user)
        print_dirs(appdirs)
        print("")
    elif args.all:
        print_header(name, version, "All JTSDK Environment Variables")
        print_dict(system)
        print_dict(user)
        print_dirs(appdirs)
        print_list(ALL_LIST)
        print("")
    else:
        parser.print_help()
        print("")

    sys.exit(0)

if __name__ == '__main__':
    main()
