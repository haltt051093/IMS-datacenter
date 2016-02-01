using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class AccountIndexViewModel
    {
        public AccountIndexViewModel()
        {
            Accounts = new List<AccountExtendedModel>();
        }

        public List<AccountExtendedModel> Accounts { get; set; }

    }
}