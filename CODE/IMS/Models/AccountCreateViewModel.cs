
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class AccountCreateViewModel
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public bool? Status { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Identification { get; set; }
        public string GroupName { get; set; }

        public List<SelectListItem> Roles { get; set; }
        public List<SelectListItem> Statuses { get; set; }
        public List<SelectListItem> Groups { get; set; } 
    }
}