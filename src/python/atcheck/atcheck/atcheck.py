# -*- coding: utf-8 -*-
""" 
atcheck
=======

Provides
--------
    1. Searches the WSJT-X produced ALL.TXT file for a given combination
       of callsigns and returns any matches it finds.

    Parameters
    ----------
    path : string (optional)
        Path to the The first parameter.
    mycall : str
        Callsign of the operator
    hiscall : str
        Callsign og the contacted station

    Returns
    -------
        str: Lineno, Date, Time, Band, Mode, MyCall, HisCall, Tag

    Usage
    -----
        atcheck [-h] [-f F] -mc MC -hc HC [-v]

        Parse WSJT-X ALL.TXT File for callsigns.

        optional arguments:
        -h, --help  show this help message and exit
        -f F        alternate location to ALL.TXT file
        -mc MC      My callsign
        -hc HC      His Callsign
        -v          display module version

        atcheck [OPTION]

"""
import os
import sys
import time
import argparse
import getpass
import platform
from os.path import expanduser

# All-Text-Check: meta-data
version_info = (0, 0, 1)
__version__ = '.'.join(str(c) for c in version_info)
__name__ = "atcheck"
__author__ = "Greg Beam, KI7MT"
__license__ = "GPLv3"
__email__ = "ki7mt@yahoo.com"


def get_username():
    """Get username based on getpass

    Returns
        str: username
    """
    return getpass.getuser()


def get_system():
    r"""Get system type based on platform

    Returns
        str: `Windows || Linux || Darwin || Posix`
    """
    system = ""
    if sys.platform.startswith('win32'):
        system = "Windows"
    elif sys.platform.startswith('linux'):
        system = "Linux"
    elif sys.platform.startswith('darwin'):
        system = "Darwin"
    else: # guess that its a posix system if not the others
        system = "Posix"

    return system


def get_user_home():
    r"""Get User Home Directory
    
    Returns
        Windows
            `%userprofile%`
        Linux | Posix
            `$HOME`
    """
    return expanduser("~")


def get_share_dir():
    r"""Get share directory based on platform

    Returns
        Windows
            str: %userprofile\AppData\Local\WSJT-X
        Linux
            str: /home/$USER/.local/share/WSJT-X
        Darwin
            str: /home/$USER/Library/Application Support/WSJT-X
        Posix
            str: /home/$USER/.local/share/WSJT-X    

    """
    sharedir = ""
    if sys.platform.startswith('win32'):
        sharedir = os.path.join(os.getenv('LOCALAPPDATA'),'WSJT-X')
    elif sys.platform.startswith('linux'):
        sharedir = os.path.join(get_user_home(),'.local','share','WSJT-X')
    elif sys.platform.startswith('darwin'):
            sharedir = os.path.join(get_user_home(),'Library','Application Support','WSJT-X')
    else:
        sharedir = os.path.join(get_user_home(),'.local','share','WSJT-X')

    return sharedir


# All-Text-Check: global variables
__username__ = get_username()
__homedir__ = get_user_home()
__sharedir__ = get_share_dir()


# All-Text-Check meta-data
__all__ = ['__version__',
            '__name__',
            '__author__',
            '__license__',
            '__email__',
            '__username__',
            '__homedir__',
            '__sharedir__'
            ]

def clear():
    """Clean screen"""
    os.system('cls' if os.name == 'nt' else 'clear ||:')


def is_time(instr):
    """Check if string is actually a time string

    Arguments:
        instr {[type]} -- [description]
    
    Returns:
        [type] -- [description]
    """
    try:
        time.strptime(instr, '%H%M%S')
        return True
    except ValueError:
        return False


def check_infile(infile):
    """Check if atcheck can reach the file"""
    try:
        with open(infile) as file:
            pass
    except IOError as e:
        print_error_header(__name__,__version__,e)
        print("Unable to open file. Please check the path.")
        print("File Path : ", file)
        print("")
        sys.exit(1)


def print_error_header(name,version,text):
    """Print Header"""
    print("\nApp Name ....: ", name)
    print("Version .....: ", version)
    print("\n{text}".format(text=text))
    print("")


def print_main_header(name,version,text,mc,hc):
    """Print Header"""
    print("\nApp Name ....: ", name)
    print("Version .....: ", version)
    print("My Call .....: ", mc)
    print("His Call ....: ", hc)
    print("\n{text}\n".format(text=text))


def print_line_header():
    """Print decode line"""
    print("{0:<4}  {1:<10}  {2:<6}  {3:<5}  {4:<5}  {5:<10}  {6:<10}  {7:<3}".format(
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


def check_call(file,text,mc,hc):
    """Check ALL.TXT file for MyCall and His Call"""
    mycall = mc.upper()
    hiscall = hc.upper()
    print_main_header(__name__,__version__,text,mycall,hiscall)
    print_line_header()

    # start processing ALL.TXT file
    start = time.time()
    with open(file,'r') as f:
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
    """ Main atcheck function"""
    parser = argparse.ArgumentParser()
    parser.prog = 'atcheck'
    parser = argparse.ArgumentParser(description="Parse WSJT-X ALL.TXT File for callsigns.")
    parser.add_argument('-f',action="store",type=str,help='alternate location to ALL.TXT file')
    parser.add_argument('-mc',action="store",required=True,help="my callsign")
    parser.add_argument('-hc',action="store",required=True,help="his Callsign")
    parser.add_argument('-v',action='version',version='%(prog)s ' + __version__,help='display module version')

    # process cli sys.argv[**args, **kwargs]
    args = parser.parse_args()
    mc = str(args.mc).upper()
    hc = str(args.hc).upper()

    # iterate through arg parse options
    if len(sys.argv) < 2:
        print_error_header(__name__, __version__,"Argument Error")
        parser.print_help()
        print("")
        sys.exit(1)
    else:
        # user defined ALL.TXT file location
        if args.f:
            check_infile(args.f)
            file = args.f
        else:
            # default WSJT-X ALL.TXT file location
            file = os.path.join(__sharedir__,"ALL.TXT")

    # send path, and calls to call_check() function
    clear()
    text = "Processing Callsigns"
    check_call(file,text,mc,hc)

    sys.exit(0)

if __name__ == '__main__':
    """Call main function"""
    main()
