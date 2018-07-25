/* 
 * Class: JavaEnv
 * 
 * Desctiption: Prints Java Related Environment Variables
 *
 * Usage: javac JavaEnv.java
 *        java JavaEnv
 * 
 * Date: 7/22/2018
 * 
 * Author: Greg Beam, KI7MT <ki7mt@yahoo.com>
 * 
 * Version: 1.0.1
 * 
 * Licesne: GPL-3
 * 
*/ 
import java.util.ArrayList;

public class JavaEnv {

    private final static String APP_NAME = "JavaEnv";
    private final static String APP_VERSION = "1.0.1";
    private final static String APP_DESC = "Java Environment Variables";

    public static void main (String[] args) {

        /* clear console */
        clearScreen();    

        /* print header */
        printHeader();

        /* create ArrayList */
        ArrayList<String> variables = new ArrayList<String>();
        variables.add("JTSDK_HOME");
        variables.add("JAVA_TOOL_OPTIONS");
        variables.add("JAVA_HOME");
        variables.add("MAVEN_HOME");
        variables.add("M2_HOME");
        variables.add("GRADLE_HOME");

        /* print list item(s) and their associated value */
        for(String item : variables)
        {
            System.out.printf("%-20s %-30s%n",item,System.getenv(item));
        }

    } /* End - Main Method */

    // -------------------------------------------------------------------------
    // MAIN CLASS  METHODS
    //--------------------------------------------------------------------------

    /* clear console command based os.name */
    private final static void clearScreen()
    {
        final String os = System.getProperty("os.name");

        try
        {
            if (os.contains("Windows")) {
            
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            
            } else {
            
                Runtime.getRuntime().exec("clear");
            
            }
        }
        catch (final Exception e)
        {
            System.err.println(e);
        }

    } /* End - clearConsole() */

    /* Print message header */
    private static void printHeader() {

        System.out.println("\nName        : " + APP_NAME );
        System.out.println("Version     : " + APP_VERSION );
        System.out.println("Description : " + APP_DESC + "\n");
        System.out.printf("%-20s %-30s%n","Variable","Path");
        System.out.println("------------------------------------------------------");

    } /* End - printHeader() */

} /* End - JavaEnv */