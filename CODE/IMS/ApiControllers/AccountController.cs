using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.Models;

namespace IMS.ApiControllers
{
    public class AccountController : BaseApiController
    {
        public DataTableModel<Account> GetAll(string role)
        {
            var result = new DataTableModel<Account>();
        
            if (role == "Manager")
            {
                var accounts = AccountBLO.Current.GetAll();
                
                result.Data = accounts;
             

            }else if (role == "Staff" || role == "Shift Head")
            {
                var accounts = AccountBLO.Current.GetAll().Where(x => x.Role == "Customer").ToList();
              
                result.Data = accounts;
               
            }
            return result;
        } 
    }
}
