using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;

namespace IMS.Models
{
    public class ServerIndexViewModel
    {
        public ServerIndexViewModel()
        {
            Accounts = new List<Account>();
        }
        public List<Account> Accounts { get; set; } 
    }
}