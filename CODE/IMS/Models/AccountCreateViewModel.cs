
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class AccountCreateViewModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Please enter username")]
        public string Username { get; set; }      
        public string Password { get; set; }
        public string Role { get; set; }
        public bool Status { get; set; }    
        public string Fullname { get; set; }     
        public string Phone { get; set; }
        [DataType(DataType.EmailAddress,ErrorMessage = "Email format is incorrect")]
        public string Email { get; set; }   
        public string Address { get; set; }      
        public string Identification { get; set; }
        public string GroupCode { get; set; }
        public string Company { get; set; }

        public List<SelectListItem> Roles { get; set; }
        public List<SelectListItem> Statuses { get; set; }
        public List<SelectListItem> Groups { get; set; } 
    }
}