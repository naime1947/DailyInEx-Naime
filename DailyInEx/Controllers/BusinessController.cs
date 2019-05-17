using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyInEx.Controllers
{
    public class BusinessController : Controller
    {
        // GET: Business
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Authorize");
        }

        public ActionResult IncomeEntry()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IncomeEntry()
        {
            return View();
        }
    }
}