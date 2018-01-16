using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace Jtsdk.Core.Library
{
    public class OptionItem
    {
        // Available Features
        public readonly List<string> ConfigItemList = new List<string>
        {
            "Separate",
            "Quiet",
            "Skipsvn",
            "Clean",
            "Reconfigure",
            "Autorun",
            "Autosvn",
            "QT57",
            "UnixTools",
            "Python3"
        };

        // is valid = Item Is In List
        public bool IsValid(string item)
        {
            bool exists = ConfigItemList.Any(s => s.Equals(item, StringComparison.OrdinalIgnoreCase));
            return exists;
        }

        // enable item - create file
        public void EnableOption(string path, string item)
        {
            File.Create(Path.Combine(path, item.ToLower())).Dispose();
        }

        // disable item - delete file
        public void DisableOption( string path, string item)
        {
            if (File.Exists(Path.Combine(path, item.ToLower())))
            {
                File.Delete(Path.Combine(path, item.ToLower()));
            }
        }

        // get status of item <true|false>
        public bool GetOptionStatus( string path, string item)
        {
            bool status = File.Exists(Path.Combine(path, item.ToLower()));
            return status;
        }

        // send the path location and check if file exists
        public void GetAllOptionStatus(string path)
        {
            var featureList = new List<string>(ConfigItemList);

            featureList.Sort();

            foreach (var item in featureList)
            {
                bool exists = File.Exists(Path.Combine(path, item.ToLower()));
                Console.WriteLine($" {item.PadRight(8)}\t{exists}");
            }
         }

        // disable all items
        public void EnableAllOptions(string path)
        {
            var featureList = new List<string>(ConfigItemList);

            featureList.Sort();

            foreach (var item in featureList)
            {
                EnableOption(path, item);
            }
        }

        // disable all items
        public void DisableAllOptions(string path)
        {
            var featureList = new List<string>(ConfigItemList);

            featureList.Sort();

            foreach (var item in featureList)
            {
                DisableOption(path, item);
            }
        }

        // display list horizontally
        public void DisplayOptionsHorizontal()
        {
            ConfigItemList.Sort();
            foreach (var data in ConfigItemList)
            {
                Console.Write(data + " ");
            }
        }

        // print help message
        public void OptionItemHelpMessage()
        {
            Common.DashLine();
            Console.WriteLine("Configuration Option Help");
            Common.DashLine();
            Console.WriteLine("");
            Console.WriteLine(" Usage ....: jtsdk-options [ option ]");
            Console.WriteLine(" Example ..: jtsdk-options -h");
            Console.WriteLine("");
            Console.WriteLine(" Individual Options\n");
            Console.WriteLine("   -e <option>\t Enables Single Option");
            Console.WriteLine("   -d <option>\t Disables Single Option\n");
            Console.WriteLine(" Group Options\n");
            Console.WriteLine("   -e all\t Enables All Options");
            Console.WriteLine("   -d all\t Disables All Options");
            Console.WriteLine("   -l\t\t List All Option Status");
            Console.WriteLine("   -h\t\t Display this message");
            Console.WriteLine();
        }

    } // END - class OptionItem

} // END - namespace Jtsdk.Core.Library