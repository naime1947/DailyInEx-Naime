using DataLibrary.BusinessLogic;
using DataLibrary.BusinessModel;
using DataLibrary.BusinessModel.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyInEx.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IncomeMonthly(int? year, int? month)
        {
            if (year != null & month != null)
            {
                List<IncomeMonthlyView> incomes = ReportProcessor.GetMonthlyIncome((int)year, (int)month);

                if (incomes.Count > 0)
                {
                    ViewBag.Message = incomes.Count + " data found";
                    ViewBag.IncomeList = incomes;
                }
                else
                {
                    ViewBag.Message = "No Data found";
                }
            }
            ViewBag.ListOfYear = ReportProcessor.ListOfYear();
            return View();
        }

        public ActionResult ExpenseMonthly(int? year, int? month)
        {
            if (year != null & month != null)
            {
                List<ExpenseMonthlyView> expenses = ReportProcessor.GetMonthlyExpense((int)year, (int)month);

                if (expenses.Count > 0)
                {
                    ViewBag.Message = expenses.Count + " data found";
                    ViewBag.ExpenseList = expenses;
                }
                else
                {
                    ViewBag.Message = "No Data found";
                }
            }
            ViewBag.ListOfYear = ReportProcessor.ListOfYear();
            return View();
        }

        public ActionResult YearlyReport(int? year)
        {
            if (year != null)
            {
                List<YearlyInExView> yearlyReportList = ReportProcessor.GetYearlyInExRepot((int)year);
                ViewBag.Report = yearlyReportList;
            }
            else
            {
                ViewBag.Message = "No data found";
            }
            ViewBag.ListOfYear = ReportProcessor.ListOfYear();

            return View();
        }

    }
}