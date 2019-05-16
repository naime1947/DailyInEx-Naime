using DailyInEx.Models;
using DataLibrary.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyInEx.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Register()
        {
            ViewBag.Countries = RegistrationProcessor.LoadCounries();
            return View();
        }

        [HttpPost]
        public ActionResult Register(CompanyModel company)
        {
            int rowAffected = RegistrationProcessor.SaveCompany(company.CompanyName, company.CompanyEmail, company.Password, company.Address, company.CountryId);
            if (rowAffected > 0)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            bool isLoginValied = RegistrationProcessor.ValidateLogin(email, password);
            if (isLoginValied)
            {
                return RedirectToAction("Index");
            }
            ViewBag.ErrorMassage = "Login Invalid";
            return View();
        }
    }
}