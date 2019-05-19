using DataLibrary.BusinessModel;
using DataLibrary.BusinessModel.ViewModel;
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
            for (int i = DateTime.Today.Year; i >= 2000; i--)
            {
                listOfYear.Add(i);
            }
            return listOfYear;
        }


        public static List<IncomeMonthlyView> GetMonthlyIncome(int year, int month)
        {
            string sql = @"select * from IncomeMonthlyViewWithBankName";
            List<IncomeMonthlyView> incomes = SqlDataAccess.LoadData<IncomeMonthlyView>(sql);
            List<IncomeMonthlyView> incomeList = new List<IncomeMonthlyView>();
            if (incomes != null)
            {
                foreach (IncomeMonthlyView income in incomes)
                {
                    if (income.Date.Month == month & income.Date.Year == year)
                    {
                        incomeList.Add(income);
                    }
                }
            }

            return incomeList;
        }

        public static List<ExpenseMonthlyView> GetMonthlyExpense(int year, int month)
        {
            string sql = @"select * from ExpenseMonthlyViewWithBankName";
            List<ExpenseMonthlyView> expenses = SqlDataAccess.LoadData<ExpenseMonthlyView>(sql);
            List<ExpenseMonthlyView> expenseList = new List<ExpenseMonthlyView>();
            if (expenses != null)
            {
                foreach (ExpenseMonthlyView expense in expenses)
                {
                    if (expense.Date.Month == month & expense.Date.Year == year)
                    {
                        expenseList.Add(expense);
                    }
                }
            }

            return expenseList;
        }

        public static List<YearlyInExView> GetYearlyInExRepot(int? year)
        {
            List<YearlyInExView> yearlyInExViewList = new List<YearlyInExView>();
            for (int month = 1; month <= 12; month++)
            {
                List<IncomeMonthlyView> incomeMonthlyViews = GetMonthlyIncome((int)year, month);
                List<ExpenseMonthlyView> expenseMonthlyViews = GetMonthlyExpense((int)year, month);
                YearlyInExView yearlyInExView = new YearlyInExView()
                {
                    Month = Month.GetMonthString(month),
                    
                };
                
                foreach (IncomeMonthlyView data in incomeMonthlyViews)
                {
                    yearlyInExView.MonthlyIncome += data.Amount;
                }

                foreach (ExpenseMonthlyView data in expenseMonthlyViews)
                {
                    yearlyInExView.MonthlyExpense += data.Amount;
                }

                yearlyInExViewList.Add(yearlyInExView);
            }

            return yearlyInExViewList;
        }
    }
}
