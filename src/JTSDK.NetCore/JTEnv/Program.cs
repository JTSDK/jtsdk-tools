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
            /* instantiate EnvUtils */
            EnvUtils envUtils = new EnvUtils();

            #region Args < 1 Processing
            if (args.Length < 1 || args.Length > 1)
            {
                Common.ClearScreen();
                EnvUtils.JTEnvHelpMessage();
                Environment.Exit(1);
            }
            #endregion

            #region Arg[0] Switch
            var option = args[0].ToLower();
            switch (option)
            {
                case "-h":
                case "-help":
                    Common.ClearScreen();
                    EnvUtils.JTEnvHelpMessage();
                    Environment.Exit(0);
                    break;
                case "-v":
                case "-version":
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    Environment.Exit(0);
                    break;
                case "-a":
                case "-all":
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.UserEnvList), "User Vars");
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.JavaEnvList), "Java Vars");
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.SystemEnvList), "System Vars");
                    Environment.Exit(0);
                    break;
                case "-u":
                case "-user":
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.UserEnvList), "User Vars");
                    Environment.Exit(0);
                    break;
                case "-j":
                case "-java":
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.JavaEnvList), "Java Vars");
                    Environment.Exit(0);
                    break;
                case "-s":
                case "-system":
                    Common.ClearScreen();
                    PrintAssemblyHeader();
                    EnvUtils.GetSectionInformaiton(new List<string>(envUtils.SystemEnvList), "System Vars");
                    break;
                default:
                    Common.ClearScreen();
                    EnvUtils.JTEnvHelpMessage();
                    break;
            }
            #endregion

        } /* End - Main Method */

        //---------------------------------------------------------------------
        // METHODS
        //---------------------------------------------------------------------

        /* pring assembly header */
        private static void PrintAssemblyHeader()
        {
            Console.WriteLine("\n");
            Console.WriteLine($"Assembly    : {Assembly.GetExecutingAssembly().GetName().Name}");
            Console.WriteLine($"Version     : {Assembly.GetExecutingAssembly().GetName().Version}");

        } /* End PrintAssemblyHeader() */

    } /* End - Main Class */

} /* End namespace JTEnv */
