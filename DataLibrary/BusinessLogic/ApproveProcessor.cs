using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class ApproveProcessor
    {
        public static bool ApproveIncome(List<int> approvedId)
        {
            foreach(int id in approvedId)
            {
                string sql = "Update income set isApproved = 1 where id ="+id;
                SqlDataAccess.UpdateData(sql);
            }
            return true;
        }
    }
}
