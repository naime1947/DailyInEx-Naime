using DataLibrary.BusinessModel;
using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class ReportProcessor
    {
        public static List<int> ListOfYear()
        {
            List<int> listOfYear = new List<int>();
            for(int i = DateTime.Today.Year; i>= 2000; i--)
            {
                listOfYear.Add(i);
            }
            return listOfYear;
        }


        public static List<Income> GetMonthlyIncome(int year, int month)
        {
 
            var date = Convert.ToDateTime(month + "/1/" + year);
            string sql = @"select id, amount, cash, cheque, chequeno, bankid, particular, date from income where Isapproved = 1";
            List<Income> incomes = SqlDataAccess.LoadData<Income>(sql);
            List<Income> incomeList = new List<Income>();
            if (incomes != null)
            {
                foreach(Income income in incomes)
                {
                    if(income.Date.Month == month & income.Date.Year == year)
                    {
                        incomeList.Add(income);
                    }
                }
            }

            return incomeList;
        }

    }
}
