# -*- coding: utf-8 -*-
import os
import sys
import time
import argparse

from . import __version__ as version
from . import __name__ as name
from . import __username__
from . import __sharedir__


def clear():
    os.system('cls' if os.name == 'nt' else 'clear ||:')


def is_time(instr):
    try:
        time.strptime(instr, '%H%M%S')
        return True
    except ValueError:
        return False


def print_main_header():
    print("\nRunning Script .......: ", sys.argv[0])
    print("Number of arguments ..: ", len(sys.argv))
    print("My Call ..............: ", sys.argv[1].upper())
    print("His Call .............: ", sys.argv[2].upper())
    print("Looking for ..........: ", str(sys.argv))
    print("\n")


def print_line_header():
    print("{0:<6}  {1:<10}  {2:<6}  {3:<6}  {4:<5}  {5:<10}  {6:<10}  {7:<3}".format(
                                                                    'Line',
                                                                    'Date',
                                                                    'Time',
                                                                    'Band',
                                                                    'Mode',
                                                                    'Call',
                                                                    'Call',
                                                                    'Message'))
    print('-' * 75)


def print_line(val1,val2,val3,val4,val5,val6,val7,val8):
    print("{0:<3}  {1:<3}  {2:<3}  {3:<3}  {4:<5}  {5:<10}  {6:<10}  {7:<3}".format(
                                                                    val1,
                                                                    val2,
                                                                    val3,
                                                                    val4,
                                                                    val5,
                                                                    val6,
                                                                    val7,
                                                                    val8))


def check_call():
    print_main_header()
    print_line_header()

    mycall = str(sys.argv[1]).upper()
    hiscall = str(sys.argv[2]).upper()

    start = time.time()
    with open('ALL.TXT','r') as f:
        counter = 1
        tim=''
        hc=''
        mc=''
        tag=''
        for line in f:
            split = line.split()
            # this is an event line: set date, time, band, and mode
            if is_time(split[0]) == False:
                dat = str(split[0])
                ban = str(split[2])
                mod = str(split[4])
            else:
                if len(split) < 8:
                    pass
                else:
                    if str(split[5]) == hiscall and str(split[6]) == mycall:
                        tim = str(split[0])
                        tag = str(split[7])
                        print_line(counter,dat,tim,ban,mod,hiscall,mycall,tag)
                    elif str(split[6]) == hiscall and str(split[5]) == mycall:
                        tim = str(split[0])
                        tag = str(split[7])
                        print_line(counter,dat,tim,ban,mod,mycall,hiscall,tag)
            counter = counter + 1

            #reset vars
            tim=''
            hc=''
            mc=''
            tag=''
            et1 = time.time() - start
        print("\nLine Count .....: {:,}".format(counter))            
        print("Execution Time .: {:.2f} sec".format(et1))
        f.close()

def main():
   
    parser = argparse.ArgumentParser()
    parser.prog = 'atcheck'
    parser.description = "Parse WSJT-X ALL.TXT File for callsigns"
    parser.epilog = "atcheck [OPTION]"

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
