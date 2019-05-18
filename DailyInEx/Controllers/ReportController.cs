using DataLibrary.BusinessLogic;
using DataLibrary.BusinessModel;
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
                List<Income> incomes = ReportProcessor.GetMonthlyIncome((int)year, (int)month);
                if (incomes.Count > 0)
                {
                    ViewBag.Message=incomes.Count+" data found";
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
    }
}