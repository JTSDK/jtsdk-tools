using System;
using System.IO;

namespace JTCore.Library
{
    public class Common
    {
        #region Path Separator
        public static char OperatingSystemPathSeparator()
        {
            return Path.DirectorySeparatorChar;
        }
        #endregion

        #region Application Name
        // returns the name of the current assembly
        public static string GetApplicationName()
        {
            return System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
        }
        #endregion

        #region Current Directory
        public static string GetCurrentDir()
        {
            return Directory.GetCurrentDirectory();
        }
        #endregion

        #region Create Directory
        public static void MakeDirectory(string myDir)
        {
            try
            {
                Directory.CreateDirectory(myDir);
            }
            catch (Exception e)
            {
                Console.WriteLine("The process failed: {0}", e.ToString());
                Environment.Exit(1);
            }
        }
        #endregion

        #region Check File Exists
        public static bool CheckFileExists(string path, string fileName)
        {
            bool status = File.Exists(path + Path.DirectorySeparatorChar + fileName);
            return status;
        }
        #endregion

        #region StarLine

        public static void StartLine()
        {
            Console.WriteLine("****************************************");
        }

        #endregion

        #region DashLine

        public static void DashLine()
        {
            Console.WriteLine("----------------------------------------");
        }

        #endregion

        #region Main Menu Header

        public static void MainMenuHeader(string title)
        {
            DashLine();
            Console.WriteLine($"{title}");
            DashLine();
        }

        #endregion

        #region Clear Screen

        public static void ClearScreen()
        {
            Console.Clear();
        }

        #endregion

        #region Under Construction

        public static void UnderConstruction()
        {
            ClearScreen();
            DashLine();
            Console.WriteLine("\n** [ Feature Is Under Construction ] **\n");
            DashLine();
        }

        #endregion

        #region Pause Prompt

        public static void PausePrompt()
        {
            Console.Write("\nPress ENTER to contiunue ...");
            Console.ReadKey();
            ClearScreen();
        }

        #endregion

    } // END - class Common

} // END - namespace Jtsdk.Core.Library
