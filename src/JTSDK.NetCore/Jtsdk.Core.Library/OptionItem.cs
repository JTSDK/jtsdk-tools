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
            "QT59",
            "CMake311",
            "Unix",
            "Java",
            "PostgreSQL",
            "Sqlite3"
        };

        // Exclusion List - these get removed from ConfigItemList
        // when setting Default Options
        public readonly List<string> ExclusionList = new List<string>
        {
            "Quiet",
            "QT59",
            "CMake311",
            "Java",
            "PostgreSQL",
            "Sqlite3",
            "Skipsvn",
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
        public string GetOptionStatus( string path, string item)
        {
            string value = "--";

            bool status = File.Exists(Path.Combine(path, item.ToLower()));
            if (status)
            {
                value = "Enabled";
            }
            return value;
        }

        // send the path location and check if file exists
        public void GetAllOptionStatus(string path)
        {
            var featureList = new List<string>(ConfigItemList);

            featureList.Sort();

            foreach (var item in featureList)
            {
                bool exists = File.Exists(Path.Combine(path, item.ToLower()));
                string val="--";
                if(exists)
                {
                    val="Enabled";
                }
                Console.WriteLine($" {item.PadRight(8)}\t{val}");
            }
         }

        // enable default items
        public void EnableDefaultOptions(string path)
        {
            // disable all the options first
            DisableAllOptions(path);

            var list1 = new List<string>(ConfigItemList);
            var list2 = new List<string>(ExclusionList);
            
            // sort the lists
            list1.Sort();
            list2.Sort();

            // remove exclusion list items from list1
            foreach (var item in list2)
            {
                list1.Remove(item);
            }

            // only add items that are left
            foreach (var item in list1)
            {
                EnableOption(path, item);
            }
        }

        // enable all items
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
            Console.WriteLine(" Usage ....: config [ option ]");
            Console.WriteLine(" Example ..: config -h");
            Console.WriteLine("");
            Console.WriteLine(" Individual Options\n");
            Console.WriteLine("   -e <option>\t Enables Single Option");
            Console.WriteLine("   -d <option>\t Disables Single Option\n");
            Console.WriteLine(" Group Options\n");
            Console.WriteLine("   -e all\t Enables All Options");
            Console.WriteLine("   -e default\t Enables Default Options");
            Console.WriteLine("   -d all\t Disables All Options");
            Console.WriteLine("   -l\t\t List All Option Status");
            Console.WriteLine("   -h\t\t Display this message");
            Console.WriteLine();
        }

    } // END - class OptionItem

} // END - namespace Jtsdk.Core.Library.Options