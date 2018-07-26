using System;
using System.Collections.Generic;
using System.Reflection;
using JTCore.Library;

namespace JTEnv
{
    class Program
    {
        public static void Main(String[] args)
        {
            /* instantiate Env Enums */
            EnvUtils envUtils = new EnvUtils();

            #region Args < 1 Processing
            if (args.Length < 1)
            {
                Common.ClearScreen();
                EnvUtils.JTEnvHelpMessage();
                Environment.Exit(1);
            }
            #endregion

            #region Args == 1 Processing
            // check args[0] first
            if (args.Length == 1)
            {
                if (
                    args[0].ToLower() == "-h" ||
                    args[0].ToLower() == "-help"
                    )
                {
                    Common.ClearScreen();
                    EnvUtils.JTEnvHelpMessage();
                    Environment.Exit(0);
                }
                if (
                    args[0].ToLower() == "-v" ||
                    args[0].ToLower() == "-version"
                    )
                {
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    Environment.Exit(0);
                }

                else if (
                    args[0].ToLower() == "-a" ||
                    args[0].ToLower() == "-all"
                    )
                {
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.UserEnvList), "User Vars");
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.JavaEnvList), "Java Vars");
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.SystemEnvList), "System Vars");
                    Environment.Exit(0);
                }
                else if (
                    args[0].ToLower() == "-u" ||
                    args[0].ToLower() == "-user"
                    )
                {
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.UserEnvList), "User Vars");
                    Environment.Exit(0);
                }
                else if (
                    args[0].ToLower() == "-j" ||
                    args[0].ToLower() == "-java"
                        )
                {
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.JavaEnvList), "Java Vars");
                    Environment.Exit(0);
                }
                else if (
                    args[0].ToLower() == "-s" ||
                    args[0].ToLower() == "-system"
                        )
                {
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.SystemEnvList), "Java Vars");
                    Environment.Exit(0);
                }
                else
                {
                    Console.WriteLine($"\nUnonown Argument : {args[0]}\n");
                    EnvUtils.JTEnvHelpMessage();
                    Environment.Exit(1);
                }
            }
            #endregion

#if DEBUG
            /* pause */
            Console.ReadKey();
#endif

        } /* End - Main Method */

        //---------------------------------------------------------------------
        // METHODS
        //---------------------------------------------------------------------

        /* Print Assembly Header */
        private static void PrintAssemblyHeader()
        {
            Console.WriteLine("\n");
            Console.WriteLine($"Assembly    : {Assembly.GetExecutingAssembly().GetName().Name}");
            Console.WriteLine($"Version     : {Assembly.GetExecutingAssembly().GetName().Version}");

        } /* End PrintAssemblyHeader() */

    } /* End - Main Class */

} /* End namespace JTEnv */
