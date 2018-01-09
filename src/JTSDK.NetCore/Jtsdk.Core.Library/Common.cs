using System;
using System.IO;

namespace Jtsdk.Core.Library
{
    public class Common
    {

        public static char OperatingSystemPathSeparator()
        {
            return Path.DirectorySeparatorChar;
        }

        // returns the name of the current assembly
        public static string GetApplicationName()
        {
            return System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;
        }

        // return current directory
        public static string GetCurrentDir()
        {
            return Directory.GetCurrentDirectory();
        }

        // create a directory
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

        // check if a file exists
        public static bool CheckFileExists(string path, string fileName)
        {
            bool status = File.Exists(path + Path.DirectorySeparatorChar + fileName);
            return status;
        }

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

        #region MainMenuHeader

        public static void MainMenuHeader(string title)
        {
            DashLine();
            Console.WriteLine($"{title}");
            DashLine();
        }

        #endregion

        #region ClearScreen

        public static void ClearScreen()
        {
            Console.Clear();
        }

        #endregion

        #region UnderConstruction

        public static void UnderConstruction()
        {
            ClearScreen();
            DashLine();
            Console.WriteLine("\n** [ Feature Is Under Construction ] **\n");
            DashLine();
        }

        #endregion

        #region PausePrompt

        public static void PausePrompt()
        {
            Console.Write("\nPress ENTER to contiunue ...");
            Console.ReadKey();
            ClearScreen();
        }

        #endregion
    }
}
