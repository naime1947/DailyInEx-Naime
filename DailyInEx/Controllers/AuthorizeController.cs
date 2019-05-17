using DailyInEx.Models;
using DataLibrary.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyInEx.Controllers
{
    public class AuthorizeController : Controller
    {
        // GET: Authorize
        public ActionResult Index()
        {
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
                return RedirectToAction("Index","Authorize");
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
                Session["user"] = email;
                return RedirectToAction("Index", "Authorize");
            }
            ViewBag.ErrorMassage = "Login Invalid";
            Session["user"] = null;
            return View();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Login", "Authorize");
        }
    }
}