using DataLibrary.BusinessModel;
using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class IncomeExpensesProcessor
    {
        public static List<Bank> LoadBanks()
        {
            string sql = "select * from bank";
            return SqlDataAccess.LoadData<Bank>(sql);
        }

        public static bool SaveIncome(double amount, bool cash, bool cheque, string chequeNo, int bankId, string particular, DateTime date)
        {
            Income data = new Income
            {
                Amount = amount,
                Cash = cash,
                Cheque = cheque,
                ChequeNo = chequeNo,
                BankId = (int)bankId,
                Particular = particular,
                Date = date
            };

            if (data.BankId == 0)
            {
                data.BankId = null;
            }

            string sql = @"Insert into Income(amount, cash, cheque, chequeNo, bankId, particular, date)
                        Values(@Amount, @Cash, @Cheque, @ChequeNo, @BankId, @Particular, @Date)";
            int rowAffected =  SqlDataAccess.SaveData(sql, data);
            if (rowAffected > 0)
            {
                return true;
            }
            return false;
        }
        
    }
}
