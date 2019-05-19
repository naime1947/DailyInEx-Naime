using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessModel.ViewModel
{
    public class YearlyInExView
    {
        public string Month { get; set; }
        public double MonthlyIncome { get; set; }
        public double MonthlyExpense { get; set; }

        public double GetMonthlyProfit()
        {
            return MonthlyIncome - MonthlyExpense;
        }
    }
}
