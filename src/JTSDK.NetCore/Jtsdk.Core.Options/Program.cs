using System;
using System.Collections.Generic;
using Jtsdk.Core.Library;

namespace Jtsdk.Core.Options
{
    public class Program
    {
        static void Main(string[] args)
        {
            // verify we are running with JTSDK_HOME set
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
            
            #region CLI Arg[0] Processing
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
                    Environment.Exit(1);
                }
                else
                {
                    Console.WriteLine($"\nUnonown Argument : {args[0]}");
                    Common.PausePrompt();
                }
            }
            #endregion

            #region CLI Arg[1] Processing
            if (args.Length == 2)
            {
                string opt2 = args[1].ToString().ToLower();

                if (args[0] == "-e" || args[0] == "-E")
                {
                    if (opt2 == "all")
                    {
                        Common.ClearScreen();
                        config.EnableAllOptions(configDir);
                        Common.DashLine();
                        Console.WriteLine($" Enabled All Options");
                        Common.DashLine();
                        config.GetAllOptionStatus(configDir);
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
                else if (args[0] == "-d" || args[0] == "-D")
                {
                    if (opt2 == "all")
                    {
                        Common.ClearScreen();
                        config.DisableAllOptions(configDir);
                        Common.DashLine();
                        Console.WriteLine($" Disable All Options");
                        Common.DashLine();
                        config.GetAllOptionStatus(configDir);
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

            #region Main Menu
            // main menu
            for (; ; )
            {
                char choice;
                do
                {
                    Common.ClearScreen();
                    Common.MainMenuHeader("Configuration Main Menu");
                     Console.WriteLine();
                    Console.WriteLine(" Group Options\n");
                    Console.WriteLine("   1. Enable All Options");
                    Console.WriteLine("   2. Disable All Options");
                    Console.WriteLine("   3. List All Options Status");
                    Console.WriteLine("   4. Help Message\n");
                    Common.DashLine();
                    Console.Write("Choose Option (q to quit): ");
                    do
                    {
                        choice = (char)Console.Read();
                    } while (choice == '\n' | choice == '\r');
                } while (choice < '1' | choice > '4' & choice != 'q');

                if (choice == 'q')
                {
                    break;
                }
                Console.WriteLine("\n");

                // if a valid option was selected
                switch (choice)
                {
                    case '1': // display help message
                        config.EnableAllOptions(configDir);
                        config.GetAllOptionStatus(tools.GetConfigDir());
                        Common.PausePrompt();
                        break;
                    case '2': // disable options
                        config.DisableAllOptions(configDir);
                        config.GetAllOptionStatus(tools.GetConfigDir());
                        Common.PausePrompt();
                        break;
                    case '3': // list option status
                        Common.ClearScreen();
                        Common.DashLine();
                        Console.WriteLine($" Configuration Status");
                        Common.DashLine();
                        config.GetAllOptionStatus(tools.GetConfigDir());
                        Common.PausePrompt();
                        break;
                    case '4': // disable options
                        Common.ClearScreen();
                        config.OptionItemHelpMessage();
                        Common.PausePrompt();
                        break;
                    default:
                        Common.ClearScreen();
                        Common.PausePrompt();
                        break;

                } // END - Switch

            } // END - ForLoop
            #endregion

        } // END - Main Method

    } // END - class Program

} // END - namespace Jtsdk.Core.Config
