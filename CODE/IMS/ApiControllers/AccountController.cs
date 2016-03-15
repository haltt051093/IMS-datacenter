using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;
using IMS.ApiModels;
using IMS.Core;
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

        [HttpPost]
        public List<string> GetAvailableRoles(GetAvailableRolesQuery q)
        {
            var result = new List<string>();
            var group = GroupBLO.Current.GetByModel(new Group {GroupCode = q.GroupCode});
            if (group == null)
            {
                return result;
            }

            var groupUsers = AccountBLO.Current.GetAccountsByGroup(q.GroupCode);
            if (groupUsers.Count(x => x.Role == Constants.Role.SHIFT_HEAD) < 1)
            {
                result.Add(Constants.Role.SHIFT_HEAD);
            }

            if (groupUsers.Count(x => x.Role == Constants.Role.STAFF) < 2)
            {
                result.Add(Constants.Role.STAFF);
            }

            var account = groupUsers.Where(x => x.Username == q.UserName).FirstOrDefault();
            if (account != null)
            {
                result.Add(account.Role);
            }

            return result;
        }

        public class GetAvailableRolesQuery
        {
            public string GroupCode { get; set; }
            public string UserName { get; set; }
        }
    }
}
