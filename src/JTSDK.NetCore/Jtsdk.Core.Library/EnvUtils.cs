using System;
using System.Collections.Generic;

namespace Jtsdk.Core.Library
{
    public class EnvUtils
    {
        // Java Environment Variables List
        public readonly List<string> JavaEnvList = new List<string>
        {
            "JTSDK_HOME",
            "JAVA_HOME",
            "JAVA_TOOL_OPTIONS",
            "MAVEN_HOME",
            "M2_HOME",
            "GRADLE_HOME"
        };

        // User Environment Variables List
        public readonly List<string> UserEnvList = new List<string>
        {
            "USERNAME",
            "USERPROFILE",
            "LOCALAPPDATA",
            "TEMP"
        };

        // System Environment Variables List
        public readonly List<string> SystemEnvList = new List<string>
        {
            "COMPUTERNAME",
            "OS",
            "PROCESSOR_ARCHITECTURE",
            "COMSPEC",
            "PROCESSOR_IDENTIFIER"
        };

        /* loop through list */
        public static void GetSectionInformaiton(List<string> list, string text)
        {
            EnvSectionHeader(text);
            foreach (var item in list)
            {
                var value = Environment.GetEnvironmentVariable(item);
                if (Environment.GetEnvironmentVariable(item) == null)
                {
                    Console.WriteLine($"{item,-23} {"-- not set --",-40}");
                }
                else
                {
                    Console.WriteLine($"{item,-23} {value,-40}");
                }
            }
        }

        /* Section header */
        private static void EnvSectionHeader(string text)
        {
            Console.WriteLine(String.Format("\n{0,-23}{1,-40}", text, "Path"));
            Console.WriteLine("------------------------------------------------------");
        }

        // print help message
        public static void JTEnvHelpMessage()
        {
            Common.DashLine();
            Console.WriteLine("JTEnv Help Message");
            Common.DashLine();
            Console.WriteLine("");
            Console.WriteLine(" Usage ....: jtenv [ option ]");
            Console.WriteLine(" Example ..: jtenv -h");
            Console.WriteLine("");
            Console.WriteLine(" Options\n");
            Console.WriteLine("   -a User\tAll environment variables");
            Console.WriteLine("   -u User\tUser environment variables");
            Console.WriteLine("   -j Java\tJava environment variables");
            Console.WriteLine("   -s System\tSystemenvironment variables");
            Console.WriteLine("   -h Help\tDisplay this message");
            Console.WriteLine();
            Environment.Exit(0);

        } /* End JTEnvHelpmessage */

    } /* End EnvUtils Class */
}
