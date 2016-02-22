using System;
using System.Collections.Generic;
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
        public List<Account> ListAccount { get; set; }
        public static implicit operator List<object>(AccountIndexViewModel v)
        {
            throw new NotImplementedException();
        }

    }
}