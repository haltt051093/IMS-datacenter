
using System.Collections.Generic;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class AccountCreateViewModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int? RoleId { get; set; }
        public bool? Status { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Identification { get; set; }
        public int GroupId { get; set; }

        public List<SelectListItem> Roles { get; set; }
        public List<SelectListItem> Statuses { get; set; }
        public List<SelectListItem> Groups { get; set; } 
    }
}