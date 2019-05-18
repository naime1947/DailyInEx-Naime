using DataLibrary.BusinessModel;
using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class ViewPendingProcessor
    {
        public static List<Income> LoadIncomes()
        {
            string sql = @"select id, amount, cash, cheque, chequeno, bankid, particular, date from income where Isapproved is null";
            return SqlDataAccess.LoadData<Income>(sql);
        }
    }
}
