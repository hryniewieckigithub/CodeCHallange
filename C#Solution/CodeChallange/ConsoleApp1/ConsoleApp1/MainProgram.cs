using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChallange
{
    class MainProgram
    {
        static void Main(string[] args)
        {
            try
            {
                String filePath = args[0]; // file path
                Char separator = args[1].ToCharArray()[0];
                String bestTrade = Helper.GetBestTrade(filePath, separator);
                Console.WriteLine(bestTrade);
            }
                catch(Exception exc)
            {
                Console.WriteLine("Exception occured, error details:" + exc.StackTrace);
            }
        }
    }
}
