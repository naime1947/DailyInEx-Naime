using DailyInEx.Models;
using DataLibrary.BusinessLogic;
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
            
            ViewBag.Banks = IncomeExpensesProcessor.LoadBanks();
            return View();
        }

        [HttpPost]
        public ActionResult IncomeEntry(IncomeModel income)
        {
            bool isSaved = IncomeExpensesProcessor.SaveIncome(income.Amount, income.Cash, income.Cheque, income.ChequeNo, income.BankId, income.Particular, income.Date);
            if (isSaved)
            {
                ViewBag.Massage = "Income Saved Successfully";
            }
            else
            {
                ViewBag.Massage = "Sorry Income couldn't save";
            }
            ViewBag.Banks = IncomeExpensesProcessor.LoadBanks();
            return View();
        }



        public ActionResult ExpenseEntry()
        {
            ViewBag.Banks = IncomeExpensesProcessor.LoadBanks();
            return View();
        }

        [HttpPost]
        public ActionResult ExpenseEntry(ExpenseModel expense)
        {
            bool isSaved = IncomeExpensesProcessor.SaveExpense(expense.Amount, expense.Cash, expense.Cheque, expense.ChequeNo, expense.BankId, expense.Particular, expense.Date);
            if (isSaved)
            {
                ViewBag.Massage = "Expense Saved Successfully";
            }
            else
            {
                ViewBag.Massage = "Sorry Expense couldn't save";
            }
            ViewBag.Banks = IncomeExpensesProcessor.LoadBanks();
            return View();
        }

    }
}