﻿
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;


namespace IMS.Models
{
    public class AccountCreateViewModel
    {
        public int Id { get; set; }
        
        [Required]
        [Remote("CheckUsername","Validate", ErrorMessage = "Username is existed", HttpMethod = "POST")]
        public string Username { get; set; }      
        public string Password { get; set; }
        [Required]
        public string Role { get; set; }
        public bool Status { get; set; }  
        [Required]  
        public string Fullname { get; set; }   
        [RegularExpression("^[0-9]+$", ErrorMessage = "Phone must be number")]
        [Required]  
        public string Phone { get; set; }
        [Required]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "E-mail is not valid")]
        public string Email { get; set; }   
        [Required]
        public string Address { get; set; }
        [RegularExpression("^[0-9]+$", ErrorMessage = "Identification must be number")]
        [Required]   
        public string Identification { get; set; }
        [Required]
        public string GroupCode { get; set; }
        public string Company { get; set; }
        public  string UserLogin { get; set; }
        public string RoleLogin { get; set; }
        public string Button { get; set; }
        public string SuccessMessage { get; set; }

        public List<SelectListItem> Roles { get; set; }
        public List<SelectListItem> Statuses { get; set; }
        public List<SelectListItem> Groups { get; set; } 
    }
}