using DataLibrary.BusinessModel;
using DataLibrary.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.BusinessLogic
{
    public static class RegistrationProcessor
    {
        public static List<Country> LoadCounries()
        {
            string sql = "Select * from dbo.Country";
            return SqlDataAccess.LoadData<Country>(sql);
        }

        public static int SaveCompany(string companyName, string companyEmail, string password, string address, int countryId)
        {
            Company data = new Company
            {
                CompanyName = companyName,
                CompanyEmail = companyEmail,
                Password = password,
                Address = address,
                CountryId = countryId
            };

            string sql = @"Insert into Company(CompanyName, CompanyEmail, Password, Address, CountryID) 
                            Values(@CompanyName,@CompanyEmail,@Password,@Address,@CountryId)";
            return SqlDataAccess.SaveData<Company>(sql,data);
        }
    }
}
