using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLibrary;
using DataLibrary.BusinessLogic;

namespace DailyInEx.Controllers
{
    public class ApproveInExController : Controller
    {
        // GET: ApproveInEx
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult ApproveIncome()
        {
            ViewBag.Incomes = ViewPendingProcessor.LoadIncomes();
            return View();
        }

        [HttpPost]
        public ActionResult ApproveIncome(FormCollection data)
        {
            List<int> approvedIds = new List<int>();
            
            var arr = data[0].ToString().Split(',');

            foreach (string id in arr)
            {
                approvedIds.Add(Convert.ToInt32(id));
            }

            ApproveProcessor.ApproveIncome(approvedIds);
            ViewBag.Incomes = ViewPendingProcessor.LoadIncomes();
            return View();
        }

        public ActionResult ApproveExpense()
        {
            ViewBag.Expenses = ViewPendingProcessor.LoadExpeses();
            return View();
        }

        [HttpPost]
        public ActionResult ApproveExpense(FormCollection data)
        {
            List<int> approvedIds = new List<int>();

            var arr = data[0].ToString().Split(',');

            foreach (string id in arr)
            {
                approvedIds.Add(Convert.ToInt32(id));
            }

            ApproveProcessor.ApproveExpense(approvedIds);
            ViewBag.Expenses = ViewPendingProcessor.LoadExpeses();
            return View();
        }
    }
}