using System;
using System.IO;
using System.Runtime.InteropServices;

namespace Jtsdk.Core.Library
{
    public class PathUtils
    {
        private string GetJtsdkHomePath()
        {
            return GetEnvironmentVariablePath("JTSDK_HOME");
        }

        public bool IsWindows()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
        }

        public bool IsMacOS()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.OSX);
        }

        public bool IsLinux()
        {
            return RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
        }

        public string GetSrcDir()
        {
            return Path.Combine(GetJtsdkHomePath(), "src");
        }

        public string GetConfigDir()
        {
            string pathD;

            if (IsWindows())
            {
                pathD = Path.Combine(GetLocalAppDataDir(), "JTSDK", "config");
            }
            else if (IsMacOS())
            {
                pathD = Path.Combine(GetEnvironmentVariablePath("HOME"), "Library", "Application Support", "JTSDK", "config");
            }
            else
            {
                pathD = Path.Combine(GetEnvironmentVariablePath("HOME"), ".jtsdk", "config");
            }
            return pathD;
        }

        public string GetAppDir()
        {
            return Path.Combine(GetJtsdkHomePath(), "tools", "JTSDK.NetCore");
        }

        public string GetAppDataDir()
        {
            return Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
        }

        public string GetLocalAppDataDir()
        {
            return Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
        }

        public string GetEnvironmentVariablePath(string var)
        {
            return Environment.GetEnvironmentVariable(var);
        }

        // validate %JTSDK_HOME% variable
        public bool ValidJtsdkHomePath()
        {
            bool var1 = false;

            if (GetJtsdkHomePath() != null)
            {
                var1 = true;
            }

            return var1;
        }

        // display help message
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

        // environment error message
        public void InvalidEnvironmentMessage()
        {
            // Validate we are running with JTSDK_HOME set
            Console.WriteLine();
            Console.WriteLine($"Invalid Enviroment %JTSDK_HOME% variable is NULL.");
            Console.WriteLine("Are Running From a JTSDK Environment?\n");
            Console.Write("Press ENTER key to exit ... ");
            Console.ReadKey();
            Environment.Exit(1);
        }

    } // END - PathUtils

} // END - namespace Jtsdk.Core.Library
