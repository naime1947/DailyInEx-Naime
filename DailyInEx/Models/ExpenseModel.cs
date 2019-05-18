using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DailyInEx.Models
{
    public class ExpenseModel
    {
        public int Id { get; set; }
        public double Amount { get; set; }
        public string ChequeNo { get; set; }
        public int BankId { get; set; }
        public string Particular { get; set; }
        public DateTime Date { get; set; }
        public int AmountType { get; set; }

        public bool Cash
        {
            get
            {
                if (AmountType == 0)
                {
                    return true;
                }
                else { return false; }
            }
            set
            {
                if (AmountType == 0)
                {
                    Cash = true;
                }
                else { Cash = false; }
            }
        }
        public bool Cheque
        {
            get
            {
                if (AmountType == 1)
                {
                    return true;
                }
                else { return false; }
            }

            set
            {
                if (AmountType == 1)
                {
                    Cheque = true;
                }
                else
                {
                    Cheque = false;
                }
            }
        }
    }
}