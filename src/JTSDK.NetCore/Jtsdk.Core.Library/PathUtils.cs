using System;
using System.IO;
using System.Runtime.InteropServices;

namespace Jtsdk.Core.Library
{
    public class PathUtils
    {
        #region Get JTSDK Home Path
        private string GetJtsdkHomePath()
        {
            return GetEnvironmentVariableData("JTSDK_HOME");
        }
        #endregion

        #region Get JAVA_HOME Home Path
        private string GetJavaHomePath()
        {
            return GetEnvironmentVariableData("JAVA_HOME");
        }
        #endregion


        #region Is Windows Platform
        public bool IsWindows()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
        }
        #endregion

        #region Is macOS Platform
        public bool IsMacOS()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.OSX);
        }
        #endregion

        #region Is Linux Platform
        public bool IsLinux()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
        }
        #endregion

        #region Get SRC Direcotry
        public string GetSrcDir()
        {
            return Path.Combine(GetJtsdkHomePath(), "src");
        }
        #endregion

        #region Get Config Directory
        public string GetConfigDir()
        {
            string pathD;

            if (IsWindows())
            {
                pathD = Path.Combine(GetLocalAppDataDir(), "JTSDK", "config");
            }
            else if (IsMacOS())
            {
                pathD = Path.Combine(GetEnvironmentVariableData("HOME"), "Library", "Application Support", "JTSDK", "config");
            }
            else
            {
                pathD = Path.Combine(GetEnvironmentVariableData("HOME"), ".jtsdk", "config");
            }
            return pathD;
        }
        #endregion

        #region Get App Directory
        public string GetAppDir()
        {
            return Path.Combine(GetJtsdkHomePath(), "tools", "apps");
        }
        #endregion

        #region Get AppData Directory
        public string GetAppDataDir()
        {
            return Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
        }
        #endregion

        #region Get LocalAppData Directory
        public string GetLocalAppDataDir()
        {
            return Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
        }
        #endregion

        #region Get Environment Variable Data
        public string GetEnvironmentVariableData(string var)
        {
            return Environment.GetEnvironmentVariable(var);
        }
        #endregion

        #region Valid JTSDK Home Path
        public bool ValidJtsdkHomePath()
        {
            bool var1 = false;

            if (GetJtsdkHomePath() != null)
            {
                var1 = true;
            }

            return var1;
        }
        #endregion

        #region Display All Paths
        public void DisplayAllPaths()
        {
            Console.WriteLine();
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine($"JTSDK Environment Paths");
            Console.WriteLine("-----------------------------------------\n");
            Console.WriteLine($" JTSDK Specific");
            Console.WriteLine($"   Home..........: {GetJtsdkHomePath()}");
            Console.WriteLine($"   App Dir.......: {GetAppDir()}");
            Console.WriteLine($"   Config .......: {GetConfigDir()}");
            Console.WriteLine($"   Src ..........: {GetSrcDir()}\n");
            Console.WriteLine($" USER Spicific ");
            Console.WriteLine($"   AppData.......: {GetAppDataDir()}");
            Console.WriteLine($"   LocalAppData..: {GetLocalAppDataDir()}\n");
        }
        #endregion

        #region Invalid Environment Message
        public void InvalidEnvironmentMessage()
        {
            // Validate we are running with JTSDK_HOME set
            Console.WriteLine();
            Console.WriteLine($"Invalid Enviroment. [ JTSDK_HOME ] variable is NULL.");
            Console.WriteLine("Are Running From a JTSDK Environment?\n");
            Console.Write("Press ENTER key to exit ... ");
            Console.ReadKey();
            Environment.Exit(1);
        }
        #endregion

    } // END - PathUtils

} // END - namespace Jtsdk.Core.Library