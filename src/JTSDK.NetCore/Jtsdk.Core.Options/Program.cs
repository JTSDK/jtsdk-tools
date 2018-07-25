using System;
using System.Collections.Generic;
using Jtsdk.Core.Library;

namespace JTConfig
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // instantiate PathUtils and verify JTSDK_HOME is set
            PathUtils tools = new PathUtils();
            if (!tools.ValidJtsdkHomePath())
            {
               tools.InvalidEnvironmentMessage();
            }

            // add critical folders to list
            string configDir = tools.GetConfigDir();

            // make direcories - set up for many, but only using one at present
            List<string> pathList = new List<string> { configDir };
            foreach (var item in pathList)
            {
                Common.MakeDirectory(item);
            }

            // instantiate config tools
            OptionItem config = new OptionItem();

            #region Args < 1 Processing
            if (args.Length < 1)
            {
                Common.ClearScreen();
                config.OptionItemHelpMessage();
                Environment.Exit(1);
            }
            #endregion

            #region Args == 1 Processing
            // check args[0] first
            if (args.Length == 1)
            {
                if (
                    args[0].ToLower() == "-h" ||
                    args[0].ToLower() == "-help" ||
                    args[0].ToLower() == "--help" ||
                    args[0].ToLower() == "help"
                    )
                {
                    Common.ClearScreen();
                    config.OptionItemHelpMessage();
                    Environment.Exit(1);
                }
                else if (
                        args[0].ToLower() == "-l" ||
                        args[0].ToLower() == "-list" ||
                        args[0].ToLower() == "--list" ||
                        args[0].ToLower() == "list"
                        )
                {
                        Common.ClearScreen();
                        Common.DashLine();
                        Console.WriteLine($" Configuration Status");
                        Common.DashLine();
                        config.GetAllOptionStatus(tools.GetConfigDir());
                        Console.WriteLine();
                        Environment.Exit(0);
                }
                else
                {
                    Console.WriteLine($"\nUnonown Argument : {args[0]}");
                    Common.PausePrompt();
                    Environment.Exit(1);
                }
            }
            #endregion

            #region Args == 2 Processing
            if (args.Length == 2)
            {
                string opt2 = args[1].ToString().ToLower();

                if (
                    args[0] == "-e" ||
                    args[0] == "-E" ||
                    args[0] == "enable" ||
                    args[0] == "ENABLE"
                    )
                {
                    if (opt2 == "all")
                    {
                        Common.ClearScreen();
                        config.EnableAllOptions(configDir);
                        Common.DashLine();
                        Console.WriteLine($" Enabled All Options");
                        Common.DashLine();
                        config.GetAllOptionStatus(configDir);
                        Console.WriteLine();
                        Environment.Exit(0);

                    }
                    else if (opt2 == "default")
                    {
                        Common.ClearScreen();
                        config.EnableDefaultOptions(configDir);
                        Common.DashLine();
                        Console.WriteLine($" Enabled Default Options");
                        Common.DashLine();
                        config.GetAllOptionStatus(configDir);
                        Console.WriteLine();
                        Environment.Exit(0);

                    }
                    else if (config.IsValid(opt2))
                    {
                        //Console.WriteLine($"\nYeahhh ... {args[1]} is in the list!!");
                        config.EnableOption(configDir, opt2.ToLower());
                        Console.WriteLine($"\nEnabled : {opt2.ToLower()}");
                        Environment.Exit(0);
                    }
                    else
                    {
                        Console.WriteLine($"\nUnknown Option : {args[1]}\n");
                        Console.Write("Legal Options : ");
                        config.DisplayOptionsHorizontal();
                        Console.WriteLine();
                        Environment.Exit(1);
                    }
                }
                else if (
                        args[0] == "-d" ||
                        args[0] == "-D" ||
                        args[0] == "disable" ||
                        args[0] == "DISABLE"
                        )
                {
                    if (opt2 == "all")
                    {
                        Common.ClearScreen();
                        config.DisableAllOptions(configDir);
                        Common.DashLine();
                        Console.WriteLine($" Disable All Options");
                        Common.DashLine();
                        config.GetAllOptionStatus(configDir);
                        Console.WriteLine();
                        Environment.Exit(0);

                    }
                    else if (config.IsValid(opt2))
                    {
                        //Console.WriteLine($"\nYeahhh ... {args[1]} is in the list!!");
                        config.DisableOption(configDir, opt2.ToLower());
                        Console.WriteLine($"\nDisabled : {opt2.ToLower()}");
                        Environment.Exit(0);
                    }
                    else
                    {
                        Console.WriteLine($"\nUnkown Option : {args[1]}\n");
                        Console.Write("Legal Options : " );
                        config.DisplayOptionsHorizontal();
                        Console.WriteLine();
                        Environment.Exit(1);
                    }
                }
                else
                {
                    Console.WriteLine($"\nUnknown Argument : {args[0]}\n");
                    Environment.Exit(1);
                }
            }
            #endregion

        } // END - Main Method

    } // END - class Program

} // END - namespace Jtsdk.Core.Options
