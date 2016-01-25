using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;

namespace IMS.Models
{
    public class AccountIndexViewModel
    {
        //public 
        //public Account Account { get; set; }
        public  int AccountId { get; set; }
        public string Username { get; set; }
        public int RoleId { get; set; }
        public bool Status { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Identification { get; set; }

        public List<Account> Accounts { get; set; }
        public Role Role { get; set; } 
    }
}