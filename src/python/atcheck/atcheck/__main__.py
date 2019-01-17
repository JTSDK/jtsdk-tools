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
    """Clean screen"""
    os.system('cls' if os.name == 'nt' else 'clear ||:')


def is_time(instr):
    try:
        time.strptime(instr, '%H%M%S')
        return True
    except ValueError:
        return False


def check_infile(infile):
    """Check if atcheck can reach the file"""
    try:
        with open('my_settings.dat') as file:
            pass
    except IOError as e:
        print("Unable to open file. Check Path")
        print("File Path : ", infile)
        print("")
        sys.exit(1)


def print_error_header(name, version, text):
    """Print Header"""
    print("\nApp Name ..........: ", name)
    print("Version ...........: ", version)
    print("\n{text}\n".format(text=text)
    print("Arguments passed ..:  ", str(sys.argv))
    print("\n")


def print_main_header(name, version, text):
    """Print Header"""
    print("\nApp Name ..........: ", name)
    print("Version ..............: ", version)
    print("\n{text}\n".format(text=text)
    print("Number of Arguments ..: ", len(sys.argv))
    print("My Call ..............: ", sys.argv[1].upper())
    print("His Call .............: ", sys.argv[2].upper())
    print("Looking for ..........: ", str(sys.argv))
    print("\n")


def print_line_header():
    """Print decode line"""
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


def print_footer(linecount,timer):
    """Print footer"""
    print("\nLine Count .....: {:,}".format(linecount))            
    print("Execution Time .: {:.2f} sec".format(timer))


def print_line(val1,val2,val3,val4,val5,val6,val7,val8):
    """Prints decode line"""
    print("{0:<3}  {1:<3}  {2:<3}  {3:<3}  {4:<5}  {5:<10}  {6:<10}  {7:<3}".format(
                                                                    val1,
                                                                    val2,
                                                                    val3,
                                                                    val4,
                                                                    val5,
                                                                    val6,
                                                                    val7,
                                                                    val8))


def check_call(file,mc,hc):
    """Check ALL.TXT file for MyCall and His Call"""

    print_main_header(name, version,"")
    print_line_header()
    mycall = mc.upper()
    hiscall = hc.upper()

    # start processing ALL.TXT file
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

        # print closing footer
        print_footer(counter,et1)
        f.close()

def main():
   
    parser = argparse.ArgumentParser()
    parser.prog = 'atcheck'
    parser.description = "Parse WSJT-X ALL.TXT File for callsigns"
    parser.epilog = "atcheck [OPTION]"

    parser.add_argument('-f', '--file',
                        action="store",
                        type=str,
                        help='Alternate location to ALL.TXT file')

    parser.add_argument('-mc', '--mycall',
                        action="store",
                        required=True,
                        type=str,
                        help='My callsign')

    parser.add_argument('-hc', '--hiscall',
                    action="store",
                    required=True,
                    type=str,
                    help='His callsign')

    parser.add_argument('-v', '--version', 
                    action='version',
                    version='%(prog)s ' + version,
                    help='display module version')

    # process cli sys.argv[**args, **kwargs]
    args = parser.parse_args()
    mc = str(args.mycall).upper()
    hc = str(args.hiscall).upper()

    # iterate through arg parse options
    if len(sys.argv) < 2:
        print_error_header(name, version, "Argument Error")
        parser.print_help()
        print("")
        sys.exit(1)
    else:
        # user defined ALL.TXT file location
        if args.infile:
            check_infile(args.infile)
            file = args.infile
        else:
            # default WSJT-X ALL.TXT file location
            file = os.path.join(__sharedir__,"ALL.TXT")

    # send path, and calls to call_check() function
    print_main_header(name, version, "Process Callsigns")
    check_call(file,mc,hc)

    sys.exit(0)

if __name__ == '__main__':
    main()
