using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;

namespace IMS.Models
{
    public class AccountCreateViewModel
    {
        public string Username { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Identification { get; set; }
        public string Status { get; set; }

        public Role Role { get; set; }
        public ShiftGroup Group { get; set; }
    }
}