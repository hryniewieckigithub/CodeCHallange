using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeChallange
{
    class Trade
    {
        private decimal openPositionValue;
        private int openPositionDate;
        private decimal closePositionValue;
        private int closePositionDate;

        public decimal OpenPositionValue { get => openPositionValue; set => openPositionValue = value; }
        public int OpenPositionDate { get => openPositionDate; set => openPositionDate = value; }
        public decimal ClosePositionValue { get => closePositionValue; set => closePositionValue = value; }
        public int ClosePositionDate { get => closePositionDate; set => closePositionDate = value; }

        public Trade(decimal openPositionValue, int openPositionDate, decimal closePositionValue, int closePositionDate)
        {
            this.openPositionDate = openPositionDate;
            this.openPositionValue = openPositionValue;
            this.closePositionDate = closePositionDate;
            this.closePositionValue = closePositionValue;
        }
        public decimal GetTradeDiff()
        {
            return ClosePositionValue - OpenPositionValue;
        }

        public override string ToString()
        {
            return String.Format("{0}({1}),{2}({3})", openPositionDate, openPositionValue, closePositionDate, closePositionValue);
        }
    }
}
