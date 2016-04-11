
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IMS.Models
{
    public class AccountLoginViewModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ReturnUrl { get; set; }
        public string SuccessMessage { get; set; }
        public string FailMessage { get; set; }
        [Required]   
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email is not valid")]
        [Remote("CheckEmail","Validate",ErrorMessage = "Email is not existed", HttpMethod = "POST")]
        public string Email { get; set; }
    }
}
