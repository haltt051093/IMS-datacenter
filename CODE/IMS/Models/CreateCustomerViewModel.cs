using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Models
{
    public class CreateCustomerViewModel
    {
        public int Id { get; set; }

        [Required]
        [Remote("CheckUsername", "Validate", ErrorMessage = "Username is existed", HttpMethod = "POST")]
        public string Username { get; set; }
        public string Password { get; set; }
      
        public bool Status { get; set; }
        [Required]
        public string Fullname { get; set; }
        [Required]
        public string Phone { get; set; }
        [Required]
        [DataType(DataType.EmailAddress, ErrorMessage = "Email format is incorrect")]
        public string Email { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string Identification { get; set; }
     
        public string Company { get; set; }
        public string UserLogin { get; set; }
        public string Button { get; set; }

      
    }
}