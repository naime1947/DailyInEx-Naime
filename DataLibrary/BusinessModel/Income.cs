using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessModel
{
    class Income
    {
        public int Id { get; set; }
        public double Amount { get; set; }
        public bool Cash { get; set; }
        public bool Cheque { get; set; }
        public string ChequeNo { get; set; }
        public int? BankId { get; set; }
        public string Particular { get; set; }
        public DateTime Date { get; set; }
        
    }
}
