using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChallange
{
    static class Helper
    {
        private static String getFileContent(String filePath)
        {
            String fileContent;
            using (StreamReader sr = new StreamReader(filePath))
            {
                fileContent = sr.ReadToEnd();
            }
            return fileContent;
        }
        private static List<Decimal> getListOfTrades(String fileContent, Char separator)
        {
            return (from p in fileContent.Split(separator) select decimal.Parse(p.ToString(), CultureInfo.InvariantCulture)).ToList();
        }
        public static string GetBestTrade(String filePath, Char separator)
        {
            string fileContent = getFileContent(filePath);
            List<Decimal> trades = getListOfTrades(fileContent, separator);

            decimal diff = 0.00M;
            decimal lastValue = trades[trades.Count - 1];
            int lastDay = trades.Count;
            Trade bestTrade = new Trade(trades[trades.Count - 2], trades.Count - 2, trades[trades.Count - 1], trades.Count - 1);

            for (int i = trades.Count - 2; i >= 0; i--)
            {
                if (trades[i] > lastValue)
                {
                    lastValue = trades[i];
                    lastDay = i+1;
                }
                else
                {
                    diff = lastValue - trades[i];
                    if (diff > bestTrade.GetTradeDiff())
                    {
                        bestTrade.OpenPositionValue = trades[i];
                        bestTrade.OpenPositionDate = i + 1;
                        bestTrade.ClosePositionValue = lastValue;
                        bestTrade.ClosePositionDate = lastDay;
                    }
                }

            }
            return bestTrade.ToString();
        }

    }
}